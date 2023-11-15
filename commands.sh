
# compile command
clang++ -std=c++17 -O3 -Xclang -mllvm -Xclang -unroll-count=4 test.cpp '-o' output_exe


# no unroll
clang++ -std=c++17 -O3 -Xclang -Rpass=loop-unroll -Xclang -Rpass-missed=loop-unroll test.cpp -o output_exe
