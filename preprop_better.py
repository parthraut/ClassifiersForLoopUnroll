from pycparser import c_parser, c_ast, parse_file, c_generator

import pdb

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

    # def generic_visit(self, node):
    #     loop_timed_under_me = False

    #     for child in node:
    #         loop_timed_under_me |= self.visit(child)

    #     timed_myself = False
    #     for child in node:
    #         if isinstance(child, (c_ast.For, c_ast.While)):
    #             if loop_timed_under_me:
    #                 self.nontiming_loops.append((node, child))
    #             else:
    #                 timed_myself = True
    #                 self.timing_loops.append((node, child))
        
    #     return loop_timed_under_me or timed_myself

class CustomPrint(c_generator.CGenerator):
    def visit_TimingCode(self, node):
        return node.text


# Parse the C file
ast = parse_file('simple_test.c', use_cpp=True)
visitor = Visitor()
visitor.visit(ast)

pdb.set_trace()

# Insert timing code before and after each loop
for node, child in visitor.timing_loops:
    if isinstance(node, c_ast.Compound):
        index = node.block_items.index(child)
        node.block_items.insert(index, TimingCode("//begin timed loop"))
        node.block_items.insert(index+2, TimingCode("//end timed loop"))

# Insert nontiming code before and after each loop
for node, child in visitor.nontiming_loops:
    if isinstance(node, c_ast.Compound):
        index = node.block_items.index(child)
        node.block_items.insert(index, TimingCode("//begin untimed loop"))
        node.block_items.insert(index+2, TimingCode("//end untimed loop"))

# print(visitor.timing_loops)
# print(visitor.nontiming_loops)

# Convert the AST back to C code
generator = CustomPrint()
modified_code = generator.visit(ast)
print(modified_code)

