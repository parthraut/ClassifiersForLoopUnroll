import os

# Compile command
#clang++ -I/home/praut/CompilersFinalProject/external/json/include -I/usr/include/c++/11 -I/usr/include/x86_64-linux-gnu/c++/11 -L /usr/lib/gcc/x86_64-linux-gnu/11 -std=c++17 -O3 -Xclang -Rpass=loop-unroll -Xclang -Rpass-missed=loop-unroll preprocessed/simple_test/1_simple_test.cpp time.cpp -o output_exe



# for each directory in preprocessed
    # make directory called "executables" in preprocessed (if it exists ok)
    # for each file in simple_test:
        # call compile(file)

for test_dir in os.listdir('preprocessed'):
    if os.path.isdir(test_dir):
        
