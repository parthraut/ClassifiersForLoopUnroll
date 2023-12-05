from pycparser import c_parser, c_ast, parse_file, c_generator

class TimingCode(c_ast.Node):
    def __init__(self, text):
        self.text = text
    
    def show(self, buf=None, offset=0, attr_names=False, showcoord=False):
        print(self.text)

class Visitor(c_ast.NodeVisitor):
    def __init__(self):
        self.timing_loops = []
        self.nontiming_loops = []


    def generic_visit(self, node):
        # post order traversal, visit child first
        timed_myself = False
        for child in node:
            nested_loop = self.visit(child)
            timed_myself |= nested_loop
            
            # check to see if child is for or while
            if isinstance(child, (c_ast.For, c_ast.While)):
                if nested_loop:
                    self.nontiming_loops.append((node, child))
                else:
                    self.timing_loops.append((node, child))
                    timed_myself = True
        
        return timed_myself

class CustomPrint(c_generator.CGenerator):
    def visit_TimingCode(self, node):
        return node.text


# Takes in filename of C program, parses it and inserts timing code, and returns modified C code
def insert_timing_code(filename, loop_unroll_factor):
    ast = parse_file(filename, use_cpp=True)
    visitor = Visitor()
    visitor.visit(ast)

    timed_loop_counter = 0

    # Insert includes and externs at the top of the file
    includes_and_directives = f"""
    #include <bits/stdc++.h>
    #include <chrono>
    #include <cstdint>
    #include <cstdlib>
    extern void add_to_loop(uint64_t, uint64_t);
    extern void print_times();
    extern void init_loops(int);"""
    ast.ext.insert(0, TimingCode(includes_and_directives))

    # Insert timing code before and after each loop
    for node, child in visitor.timing_loops:
        if isinstance(node, c_ast.Compound):

            before_timed_loop = f"""auto start_{timed_loop_counter} = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count({loop_unroll_factor})"""

            after_timed_loop = f"""auto end_{timed_loop_counter} = std::chrono::high_resolution_clock::now();
            auto duration_{timed_loop_counter} = std::chrono::duration_cast<std::chrono::nanoseconds>(end_{timed_loop_counter} - start_{timed_loop_counter});
            add_to_loop({timed_loop_counter}, duration_{timed_loop_counter}.count());"""


            index = node.block_items.index(child)
            node.block_items.insert(index, TimingCode(before_timed_loop))
            node.block_items.insert(index+2, TimingCode(after_timed_loop))
            timed_loop_counter += 1

    # Insert nontiming code before and after each loop
    for node, child in visitor.nontiming_loops:
        if isinstance(node, c_ast.Compound):
            before_untimed_loop = f"""#pragma clang loop unroll(disable)"""

            index = node.block_items.index(child)
            node.block_items.insert(index, TimingCode(before_untimed_loop))

    # Insert atexit(print_times) at the beginning of main
    for node in ast.ext:
        if isinstance(node, c_ast.FuncDef):
            if node.decl.name == 'main':
                node.body.block_items.insert(0, TimingCode(f"init_loops({len(visitor.timing_loops)});"))
                node.body.block_items.insert(0, TimingCode("atexit(print_times);"))
                break

    # Convert the AST back to C code
    generator = CustomPrint()
    modified_code = generator.visit(ast)
    return modified_code, {}

