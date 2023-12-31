

import subprocess
import json
import pdb
import os
import re
from insert_timing_code import insert_timing_code
import logging

from tqdm import tqdm

# Set up logging
logging.basicConfig(level=logging.INFO,
                    format='%(asctime)s - %(levelname)s - %(message)s',
                    handlers=[logging.FileHandler("results.log"),
                              logging.StreamHandler()])

# Exceptions 
class CompileException(Exception):
    def __init__(self, message):
        super().__init__(message)

class RuntimeException(Exception):
    def __init__(self, message):
        super().__init__(message)


def extract_features(filename_path):
    """ Returns compiled json of features for each loop in file. """

    # compile original test to test.ll
    compile_command = [
                    "clang",
                    "-g",
                    "-emit-llvm",
                    "-S",
                    filename_path,
                    "-Xclang",
                    "-disable-O0-optnone",
                    "-o",
                    "test.ll"
                ]

    # will throw if compilation fails
    process = subprocess.Popen(compile_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    stdout, stderr = process.communicate()

    if process.returncode != 0:
        raise CompileException(stderr)

    # initializes features.json
    with open("features.json", 'w') as f:
        f.write("[]")

    # run pass, returns json in stdout
    run_opt_command = ['opt',
        '-disable-output',
        '-load-pass-plugin=./llvm_passes/build/featurepass/featurepass.so',
        '-passes=mem2reg,instcombine,loop-simplify,loop-rotate,featurepass',
        'test.ll'
    ]
    # will throw if opt fails
    process = subprocess.Popen(run_opt_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    stdout, stderr = process.communicate()

    if process.returncode != 0:
        raise RuntimeException("opt error" + stderr)

    """
     stdout is json, convert it to json object and return

     ex.
    [
            {
        "aluf": 0.0,
        "alui": 2.0,
        ...
        }
        ...
    ]

    """
    
    # load from features.json
    with open("features.json", 'r') as file:
        data = json.load(file)

    return data

def remove_includes(filename_path):
    """
    Remove all #include lines in the C++ file and store the result in preprop.cpp.
    """
    # Open the file specified by filename_path
    with open(filename_path, 'r') as file:
        content = file.read()

    # Use regex to remove all lines that start with #include
    modified_content = re.sub(r'^#include.*$', '', content, flags=re.MULTILINE)
    # modified_content = content

    # Write the modified content to a new file named preprop.cpp
    with open('preprop.cpp', 'w') as new_file:
        new_file.write(modified_content)

def insert_timing(filename_path, LUF):
    modified_code, line2loopnum = insert_timing_code('preprop.cpp', LUF)

    # output modified code to timed.cpp
    with open('timed_src.cpp', 'w') as timed_file:
        timed_file.write(modified_code)

    return line2loopnum

def compile_and_link():
    # compiles timed_src.cpp and links with time.cpp, returns output

    command = [
            "clang++",
            "-std=c++17",
            "-I/home/praut/CompilersFinalProject/external/json/include",
            "-I/usr/include/c++/11",
            "-I/usr/include/x86_64-linux-gnu/c++/11",
            "-L/usr/lib/gcc/x86_64-linux-gnu/11",
            "-O2",
            "-funroll-loops",
            "-Xclang", "-Rpass=loop-unroll",
            "timed_src.cpp",
            "time.cpp",
            "-o", "output_exe"
        ]

    process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    stdout, stderr = process.communicate()

    print(stderr)
    if process.returncode != 0:
        raise CompileException(stderr)



    return stdout

def run_and_aggregate_data(runs):

    run_data = {}

    for i in tqdm(range(runs), desc="Timing: "):
        # run output_exe and get stdcout
        process = subprocess.Popen("./output_exe", stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        stdout, stderr = process.communicate()

        # process saves to "times.json, load it in"
        with open("times.json", 'r') as file:
            data = json.load(file)

        """
        compile data into run_data, data looks like this
        {
            int0 : []
            int1 : []
        }
        """

        # Aggregate data into run_data
        for key, values in data.items():
            if key not in run_data:
                run_data[key] = []

            run_data[key].extend(values)

    return run_data

def remove_loops_failed(loops_unrolled_std_out, run_data):
    # TODO:
    return run_data

    
def time_code(filename_path, filename):
    
    # remove preprocessor directives, stores to preprop.cpp
    remove_includes(filename_path)

    LUFs = [1, 2, 3, 4, 5, 6, 7, 8]
    runs = 10

    all_LUF_times = {}

    """
    {
        loop_num : {
            LUF1 : []
            LUF2 : []
        }
    }
    
    """

    for LUF in tqdm(LUFs, desc="File Progress: "):
        line2loopnum = insert_timing(filename_path, LUF)
        loops_unrolled_std_out = compile_and_link()
        run_data = run_and_aggregate_data(runs)

        # TODO:
        run_data = remove_loops_failed(loops_unrolled_std_out, run_data)
        
        

        # Aggregate data to all_LUF_times
        for loop_num, times in run_data.items():
            if loop_num not in all_LUF_times:
                all_LUF_times[loop_num] = {}
            if len(times) != 0:
                all_LUF_times[loop_num][LUF] = sum(times) / len(times)
            else:
                all_LUF_times[loop_num][LUF] = -1
    
    return all_LUF_times











def generate_dataset():
    """ Generates Dataset from scratch. """

    # load json
    rerun = True

    with open('results.json', 'r') as file:
        data = json.load(file)

    for filename in os.listdir("dataset"):

        if not filename.endswith(".c"):
            # print(f"{filename} not a c file, skipping")
            continue

        logging.info(f"---------- {filename} : Reading file... ---------")

        if filename in data:
            if not rerun:
                logging.info(f"{filename} filename has data and rerun not enabled, skipping")
                continue

        filename_path = os.path.join("dataset", filename)

        try: 
            logging.info(f"---------- {filename} : extracting features ---------")
            features = extract_features(filename_path)

            logging.info(f"---------- {filename} : timing data ---------")
            timing_data = time_code(filename_path, filename)

            

            if filename in data.keys():
                logging.info(f"---------- {filename} : replacing data in results.json ---------")
            else:
                logging.info(f"---------- {filename} : adding data to results.json ---------")

            data[filename] = [features, timing_data]

            # store data back to results.json
            with open('results.json', 'w') as file:
                json.dump(data, file, indent=4)

        except CompileException as ce:
            logging.error(f'Compiler Error: {ce}')
            continue
        except RuntimeException as re:
            logging.error(f'Runtime Error: {re}')
            continue
        except Exception as e:
            logging.error(f'Error: {e}')
            continue


    # compile data and export


if __name__ == "__main__":
    generate_dataset()