#include "clang/AST/AST.h"
#include "clang/ASTMatchers/ASTMatchers.h"
#include "clang/ASTMatchers/ASTMatchFinder.h"
#include "clang/Frontend/CompilerInstance.h"
#include "clang/Rewrite/Core/Rewriter.h"
#include "clang/Tooling/CommonOptionsParser.h"
#include "clang/Tooling/Tooling.h"

using namespace clang;
using namespace clang::ast_matchers;
using namespace clang::tooling;

class LoopTimingInserter : public MatchFinder::MatchCallback {
public:
    LoopTimingInserter(Rewriter &Rewrite) : Rewrite(Rewrite) {}

    virtual void run(const MatchFinder::MatchResult &Result) {
        if (const Stmt *Loop = Result.Nodes.getNodeAs<Stmt>("loop")) {
            int LoopNestingLevel = getNestingLevel(Result, Loop);

            // Get the start location of the loop to insert code before it
            SourceLocation StartLoc = Loop->getBeginLoc();

            // Insert timing start code and pragma directive before the loop
            std::string TimingStartCode = "auto start = std::chrono::high_resolution_clock::now();\n";
            std::string PragmaDirective = "#pragma clang loop unroll_count(" + std::to_string(LoopNestingLevel == 0 ? N : 1) + ")\n";
            Rewrite.InsertTextBefore(StartLoc, TimingStartCode + PragmaDirective);

            // Get the end location of the loop to insert code after it
            // This assumes that Loop is a compound statement (i.e., enclosed in braces {})
            if (const auto *CS = dyn_cast<CompoundStmt>(Loop)) {
                SourceLocation EndLoc = CS->getEndLoc().getLocWithOffset(1);

                // Insert timing end code after the loop
                std::string TimingEndCode = "\nauto end = std::chrono::high_resolution_clock::now();\n"
                                            "auto duration = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();\n"
                                            "add_to_loop(duration);\n";
                Rewrite.InsertTextAfterToken(EndLoc, TimingEndCode);
            }
        }
    }

private:
    Rewriter &Rewrite;
};

int main(int argc, const char **argv) {
    CommonOptionsParser op(argc, argv);
    ClangTool Tool(op.getCompilations(), op.getSourcePathList());

    Rewriter Rewrite;
    LoopTimingInserter Inserter(Rewrite);

    MatchFinder Finder;
    // Define matchers for loops and add to Finder
    auto ForLoopMatcher = forStmt().bind("forLoop");
    auto WhileLoopMatcher = whileStmt().bind("whileLoop");
    auto DoWhileLoopMatcher = doStmt().bind("doWhileLoop");
    // Use LoopTimingInserter as callback
    Finder.addMatcher(ForLoopMatcher, &Inserter);
    Finder.addMatcher(WhileLoopMatcher, &Inserter);
    Finder.addMatcher(DoWhileLoopMatcher, &Inserter);

    Tool.run(newFrontendActionFactory(&Finder).get());

    // Output the rewritten source code
    for (const auto &File : Rewrite.getSourceMgr().fileinfo_begin()) {
    const auto &ID = File.first;
    Rewrite.getEditBuffer(ID).write(llvm::outs());
}
}
