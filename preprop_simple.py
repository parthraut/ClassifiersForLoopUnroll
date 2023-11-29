from pycparser import c_parser, c_ast, parse_file, c_generator

import pdb

def clone_node(node):
    """ Creates a shallow copy of a given AST node. """
    if node is None:
        return None
    new_node = type(node)()
    for attr in node.attr_names:
        setattr(new_node, attr, getattr(node, attr))
    return new_node

class LoopVisitor(c_ast.NodeVisitor):
    def __init__(self):
        self.current_parent = None
        self.loop_counter = 0

    def visit_For(self, node):
        self.handle_loop(node)

    def visit_While(self, node):
        self.handle_loop(node)

    def handle_loop(self, node):
        loop_label = f'loop_{self.loop_counter}'
        self.loop_counter += 1

        # Construct new code elements
        start_code_str = f"""auto start_{loop_label} = std::chrono::high_resolution_clock::now();
#pragma clang loop unroll_count(N)
"""
        end_code_str = f"""auto end = std::chrono::high_resolution_clock::now();
auto duration = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start_{loop_label}).count();
add_to_loop({loop_label}, duration);
"""
        start_code = c_ast.Pragma(start_code_str.strip())
        end_code = c_ast.Pragma(end_code_str.strip())

        # Clone and modify the node
        cloned_node = clone_node(node)
        index = self.current_parent.block_items.index(node)
        self.current_parent.block_items[index] = cloned_node
        cloned_node.body.block_items.insert(0, start_code)
        cloned_node.body.block_items.append(end_code)

    def generic_visit(self, node):
        """ Called if no explicit visitor function exists for a
            node. Implements preorder visiting of the node.
        """
        old_parent = self.current_parent
        self.current_parent = node
        for c in node.children():
            self.visit(c[1])
        self.current_parent = old_parent



class Duplicate(c_ast.NodeVisitor):
    def visit(self, node):
        pdb.set_trace()


# Parse the C file
ast = parse_file('simple_test.c', use_cpp=True)

visitor = Duplicate()
visitor.visit(ast)


# # Visit and modify the AST
# visitor = LoopVisitor()
# visitor.visit(ast)

# # Convert the AST back to C code
# generator = c_generator.CGenerator()
# print(generator.visit(ast))
