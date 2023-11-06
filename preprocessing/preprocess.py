
import subprocess
import time
import os
import json

# Command to run clang with specified unroll factor
# clang -Xclang -mllvm -Xclang -unroll-count=<factor> -o my_program my_program.c

# Compile the C program with the specified unroll factor
def compile_with_unroll(c_file, output_exe, unroll_factor):
    try:
        # Compile the C program
        compile_command = [
            'clang++', '-std=c++17', '-O3','-Xclang', '-mllvm', '-Xclang', f'-unroll-count={unroll_factor}',
            'preprocessing/template.cpp', c_file, '-o', output_exe
        ]
        subprocess.run(compile_command, check=True)
        
        print(f"Compilation of {c_file} finished successfully.")
        return True
    except subprocess.CalledProcessError as e:
        print(f"Compilation failed: {e}")
        return False
    
def run_and_time(executable, num_runs=5):
    times = []
    for _ in range(num_runs):
        try:
            result = subprocess.run([f'./{executable}'], check=True, stdout=subprocess.PIPE, text=True)
            times.append(int(result.stdout))

        except subprocess.CalledProcessError as e:
            print(f"Execution failed: {e}")

    return times


def main():
    num_runs = 5
    data = dict()
    intermediate_save_factor = 100

    for i, filename in enumerate(os.listdir('preprocessed_dataset')):
        data[filename] = dict()
        for unroll_factor in [1, 2, 4, 8]:
            output_exe = f"{filename}_{unroll_factor}.exe"
            if compile_with_unroll(os.path.join('preprocessed_dataset', filename), output_exe, unroll_factor=unroll_factor):
                times = run_and_time(output_exe, num_runs=num_runs)
                data[filename][unroll_factor] = times
                print(f"Execution times for {output_exe}: {times}")

        if i % intermediate_save_factor == 0:
            print(f"Saving intermediate results to file...")
            with open('dataset/results.json', 'w') as file:
                json.dump(data, file)
    
    with open('dataset/results.json', 'w') as file:
        json.dump(data, file, indent=4)

if __name__ == '__main__':
    main()