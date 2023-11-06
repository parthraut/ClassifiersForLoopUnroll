import re

# Function to change the name of the main function
def change_main_function_name(input_file, output_file, new_main_name):
    try:
        # Read the input C++ file
        with open(input_file, 'r') as file:
            cpp_code = file.read()

        # Define a regular expression pattern to match the main function
        pattern = r'int\s+main\s*\(\s*\)\s*{'

        # Replace the main function name with the new name
        modified_code = re.sub(pattern, f'int {new_main_name}(){{', cpp_code, count=1)

        # Write the modified code to the output file
        with open(output_file, 'w') as file:
            file.write(modified_code)

        print(f"Main function name changed to '{new_main_name}' and saved to '{output_file}'.")

    except FileNotFoundError:
        print("Input file not found.")

if __name__ == '__main__':
    input_file = 'dataset/ex_cpp.cpp'  # Replace with the path to your input file
    output_file = 'preprocessed_dataset/modified.cpp'  # Replace with the path for the output file
    new_main_name = 'test'  # Replace with the desired new name for the main function

    change_main_function_name(input_file, output_file, new_main_name)