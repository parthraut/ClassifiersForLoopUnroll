import re

def insert_pragma_in_loops(file_path, unroll_count):
    # Open and read the C file
    with open(file_path, 'r') as file:
        lines = file.readlines()

    new_lines = []
    loop_nesting_level = 0

    for line in lines:
        # Check if the line contains a loop start
        if re.search(r'\b(for|while|do)\b', line):
            loop_nesting_level += 1
            # Determine which pragma to insert based on nesting level
            pragma_unroll = unroll_count if loop_nesting_level == 1 else 1
            new_lines.append(f'#pragma clang loop unroll_count({pragma_unroll})\n')
        
        new_lines.append(line)

        # Check if the line contains a loop end
        if re.search(r'\b(}\s*;?\s*$)', line) and loop_nesting_level > 0:
            loop_nesting_level -= 1

    # Write the modified code to a new file
    with open(file_path, 'w') as file:
        file.writelines(new_lines)

# Example usage
insert_pragma_in_loops('test.cpp', 4)
