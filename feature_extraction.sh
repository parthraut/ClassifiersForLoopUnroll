
# build .ll file
# Init compile to test.ll
clang++ -g -emit-llvm -S test_no_nested.cpp -Xclang -disable-O0-optnone -o test.ll
# To run pass
clang++ -I/home/praut/CompilersFinalProject/external/json/include -I/usr/include/c++/11 -I/usr/include/x86_64-linux-gnu/c++/11 -L /usr/lib/gcc/x86_64-linux-gnu/11 -std=c++17 -O3 -Xclang -Rpass=loop-unroll -Xclang -Rpass-missed=loop-unroll preprocessed/simple_test/1_simple_test.cpp time.cpp -o output_exe

opt -disable-output -load-pass-plugin=./llvm_passes/build/featurepass/featurepass.so -passes="featurepass" test.ll


opt -disable-output -load-pass-plugin=./llvm_passes/build/featurepass/featurepass.so -passes="loop-simplify,loop-rotate,featurepass" test.ll

opt -disable-output -load-pass-plugin=./llvm_passes/build/featurepass/featurepass.so -passes="featurepass" test.ll