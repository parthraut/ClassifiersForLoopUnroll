
# compile command
clang++ -std=c++17 -O3 -Xclang -mllvm -Xclang -unroll-count=4 test.cpp '-o' output_exe


# no unroll
clang++ -std=c++17 -O3 -Xclang -Rpass=loop-unroll -Xclang -Rpass-missed=loop-unroll test.cpp -o output_exe

clang++ -std=c++17 -O3 -Xclang -Rpass=loop-unroll -Xclang -Rpass-missed=loop-unroll test_no_nested.cpp -o output_exe

# CMake commands
cmake ..    # must be in the build folder
make        # must be in the build folder

clang -emit-llvm -S test.c -Xclang -disable-O0-optnone -o test.ll

clang++ -std=c++17 -O3 -Xclang -Rpass=loop-unroll -Xclang -Rpass-missed=loop-unroll -emit-llvm -S test.cpp -Xclang -disable-O0-optnone -o test.ll
clang++ -std=c++17 -O3 -fno-unroll-loops -Xclang -Rpass-missed=loop-unroll -emit-llvm -S test.cpp -Xclang -disable-O0-optnone -o test.ll

opt -disable-output -load-pass-plugin=./llvm_passes/build/set_unroll_pass/set_unroll_pass.so -passes="set_unroll_pass" test.ll

opt -disable-output -load-pass-plugin=./llvm_passes/build/set_unroll_pass/set_unroll_pass.so -passes=set_unroll_pass test_nonest.ll

# build in debug mode
cmake -DCMAKE_BUILD_TYPE=Debug ..


# building llvm debug version

# did not build opt: make opt

make opt -j13 &> make_opt_comp.txt

# using debug opt
./llvm-project-build/bin/opt -disable-output -load-pass-plugin=./llvm_passes/build/set_unroll_pass/set_unroll_pass.so -passes=set_unroll_pass test_nonest.ll

# make clang++
cmake -G "Unix Makefiles" -DLLVM_ENABLE_PROJECTS="clang" -DCMAKE_BUILD_TYPE=Debug ../llvm-project


# using custom debug clang
llvm-project-build/bin/clang -O3 -Xclang -Rpass=loop-unroll -Xclang -Rpass-missed=loop-unroll test_no_nested.cpp -o output_exe



## Over optimization, must first compile with -g, then run the pass, then -03

# Init compile to test.ll
llvm-project-build/bin/clang -g -emit-llvm -S test_no_nested.cpp -Xclang -disable-O0-optnone -o test.ll

# Run the pass
./llvm-project-build/bin/opt -load-pass-plugin=./llvm_passes/build/set_unroll_pass/set_unroll_pass.so -passes=set_unroll_pass test.ll > test_modified.ll

# Complete comp with -03 with debug output
llvm-project-build/bin/clang -O3 -Xclang -Rpass=loop-unroll -Xclang -Rpass-missed=loop-unroll test_modified.ll -o test

llvm-project-build/bin/clang -O3 -fno-unroll-loops test_modified.ll -o test

# Plan:

# 1. Compile with clang -g
# 2. Run a pass that inserts #pragma equivalent in iR
# 3. Run clang -03 and monitor output to ensure loop unrolling
# 4. Run a pass to insert timing code and gather loop attributes
# 5. clang -03 to executable

# Maybe better plan?

# 1. Compile with clang -g
# 2. Run our custom loop unrolling pass, if successful, insert timing code
# 3. 