
from insert_timing_code import insert_timing_code
import pdb
import os


# loop through all files in unprocessed directory
# for each file, run insert_timing_code
unroll_factors = [1, 2, 4, 8, 16, 32, 64]

for file in os.listdir('unprocessed'):
    print("Inserting timing code in : " + file)
    if file.endswith('.c'):
        for loop_unroll_factor in unroll_factors:
            timed_code = insert_timing_code('unprocessed/' + file, loop_unroll_factor)
            # write timed_code to processed directory
            with open('preprocessed/' + f"{loop_unroll_factor}_" + file + "pp", 'w') as f:
                print("Writing to preprocessed/" + file)
                f.write(timed_code)
