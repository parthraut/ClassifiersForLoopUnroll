
# build .ll file
# Init compile to test.ll
clang++ -g -emit-llvm -S test_no_nested.cpp -Xclang -disable-O0-optnone -o test.ll
# To run pass
#opt -disable-output -load-pass-plugin=./llvm_passes/build/featurepass/featurepass.so -passes="featurepass" test.ll
opt -disable-output -load-pass-plugin=./llvm_passes/build/featurepass/featurepass.so -passes=mem2reg,instcombine,loop-simplify,loop-rotate,featurepass test.ll


# opt -disable-output -load-pass-plugin=./llvm_passes/build/featurepass/featurepass.so -passes="loop-simplify,loop-rotate,featurepass" test.ll

# opt -disable-output -load-pass-plugin=./llvm_passes/build/featurepass/featurepass.so -passes="featurepass" test.ll