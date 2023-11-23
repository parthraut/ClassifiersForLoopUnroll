import sys
from pycparser import c_parser, c_ast, parse_file

# Visitor class to modify the C AST
class LoopVisitor(c_ast.NodeVisitor):
    def __init__(self):
        self.loop_counter = 0

    def visit_For(self, node):
        self.handle_loop(node, 'For')

    def visit_While(self, node):
        self.handle_loop(node, 'While')

    def handle_loop(self, node, loop_type):
        is_innermost = self.is_innermost_loop(node)
        self.loop_counter += 1
        loop_label = f'loop_{self.loop_counter}'

        # Add timing and pragma code
        if is_innermost or not self.has_nested_loop(node):
            start_code = f"""auto start_{loop_label} = std::chrono::high_resolution_clock::now();
#pragma clang loop unroll_count(N)
"""
            end_code = f"""auto end = std::chrono::high_resolution_clock::now();
auto duration = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start_{loop_label}).count();
add_to_loop({loop_label}, duration);
"""
            node.stmt.block_items.insert(0, c_parser.CParser().parse(start_code).ext[0])
            node.stmt.block_items.append(c_parser.CParser().parse(end_code).ext[0])
        else:
            pragma_code = "#pragma clang loop unroll_count(1)\n"
            node.stmt.block_items.insert(0, c_parser.CParser().parse(pragma_code).ext[0])

    def is_innermost_loop(self, node):
        """ Check if the loop is the innermost loop """
        class InnerLoopVisitor(c_ast.NodeVisitor):
            def __init__(self):
                self.found = False

            def visit_For(self, _):
                self.found = True

            def visit_While(self, _):
                self.found = True

        visitor = InnerLoopVisitor()
        visitor.visit(node.stmt)
        return not visitor.found

    def has_nested_loop(self, node):
        """ Check if the loop has a nested loop """
        return not self.is_innermost_loop(node)

# Parse the C file
ast = parse_file('example.c', use_cpp=True)

# Visit and modify the AST
visitor = LoopVisitor()
visitor.visit(ast)

# Convert the AST back to C code
generator = c_ast.CGenerator()
modified_code = generator.visit(ast)
print(modified_code)
