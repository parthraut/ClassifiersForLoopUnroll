#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/ScalarEvolutionExpressions.h"
#include "llvm/Transforms/Utils/LoopUtils.h"
#include "llvm/Transforms/Utils/UnrollLoop.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Dominators.h"
#include "llvm/Analysis/AssumptionCache.h"
#include "llvm/Analysis/OptimizationRemarkEmitter.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Analysis/LoopInfo.h"


using namespace llvm;

namespace {

// look into other older pass manager
// look into loop pass

// change to new pass
struct LoopUnrollPass : public PassInfoMixin<LoopUnrollPass> {

  PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM) {

                          LoopInfo &LI = FAM.getResult<llvm::LoopAnalysis>(F);

                          for(Loop* L : LI){
                            errs() << "at loop: " << L << "\n";
                          }

                          return PreservedAnalyses::all();

                        }
};

} // end anonymous namespace


// char LoopUnrollPass::ID = 0;
// static RegisterPass<LoopUnrollPass> X("loop-unroll2", "Loop Unroll Pass", false, false);

extern "C"::llvm::PassPluginLibraryInfo LLVM_ATTRIBUTE_WEAK llvmGetPassPluginInfo() {
 return {
  LLVM_PLUGIN_API_VERSION, "SetUnrollPass", "v0.1",
  [](PassBuilder &PB) {
   PB.registerPipelineParsingCallback(
    [](StringRef Name, FunctionPassManager &FPM,
    ArrayRef<PassBuilder::PipelineElement>) {
     if(Name == "loop_unroll_pass"){
      FPM.addPass(LoopUnrollPass());
      return true;
     }
     return false;
    }
   );
  }
 };
}

// char MyFunctionPass::ID = 0;

// extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo LLVM_ATTRIBUTE_WEAK *llvmGetPassPluginInfo() {
//     return new ::llvm::PassPluginLibraryInfo<MyFunctionPass>("MyFunctionPass", "My function pass description", &MyFunctionPass::ID);
// }