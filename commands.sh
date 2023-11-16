
# compile command
clang++ -std=c++17 -O3 -Xclang -mllvm -Xclang -unroll-count=4 test.cpp '-o' output_exe


# no unroll
clang++ -std=c++17 -O3 -Xclang -Rpass=loop-unroll -Xclang -Rpass-missed=loop-unroll test.cpp -o output_exe

# CMake commands
cmake ..    # must be in the build folder
make        # must be in the build folder

clang -emit-llvm -S test.c -Xclang -disable-O0-optnone -o test.ll

clang++ -std=c++17 -O3 -Xclang -Rpass=loop-unroll -Xclang -Rpass-missed=loop-unroll -emit-llvm -S test.cpp -Xclang -disable-O0-optnone -o test.ll
clang++ -std=c++17 -O3 -fno-unroll-loops -Xclang -Rpass-missed=loop-unroll -emit-llvm -S test.cpp -Xclang -disable-O0-optnone -o test.ll

opt -disable-output -load-pass-plugin=./llvm_passes/build/set_unroll_pass/set_unroll_pass.so -passes="loop-unroll2" test.ll