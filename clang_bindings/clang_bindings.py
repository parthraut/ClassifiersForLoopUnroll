import clang.cindex
import pdb

pdb.set_trace()
clang.cindex.Config.set_library_file('/llvm-project/build/lib/libclang.so')


index = clang.cindex.Index.create()

translation_unit = index.parse('../test.c')