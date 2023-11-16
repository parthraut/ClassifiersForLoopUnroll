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


using namespace llvm;

namespace {

// look into other older pass manager
// look into loop pass

// change to new pass
struct LoopUnrollPass2 : public FunctionPass {
  static char ID;

  LoopUnrollPass2() : FunctionPass(ID) {}

  bool runOnFunction(Function &F) {
    LoopInfo &LI = getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
    ScalarEvolution &SE = getAnalysis<ScalarEvolutionWrapperPass>().getSE();
    DominatorTree DT = DominatorTree(F);
    AssumptionCache &AC = getAnalysis<AssumptionCacheTracker>().getAssumptionCache(F);
    llvm::TargetTransformInfo &TTI = getAnalysis<llvm::TargetTransformInfoWrapperPass>().getTTI(F);
    OptimizationRemarkEmitter ORE(&F);


    for (Loop *L : LI) {
    
      const SCEV *trip_count = SE.getBackedgeTakenCount(L);
      if (isa<SCEVConstant>(trip_count)) {
        unsigned int unroll_factor = 2;

        UnrollLoopOptions ULO = {
            unroll_factor /* Count */, 
            true /* Force */, 
            false /* Runtime */, 
            false /* AllowExpensiveTripCount */,
            true /* UnrollRemainder */, 
            true /* ForgetAllSCEV */
        };

        bool ForgetAllSCEV;

        llvm::LoopUnrollResult res = UnrollLoop(L, ULO, &LI, &SE, &DT, &AC, &TTI, &ORE, true /*Preserve LCSSA*/, nullptr);

        if (res == llvm::LoopUnrollResult::Unmodified){
          errs() << "unmodified\n";
          return false;
        }
        else if (res == llvm::LoopUnrollResult::PartiallyUnrolled){
          errs() << "partially unrolled\n";
        }
        else {
          errs() << "fully unrolled\n";
        }
      }
    }

    return true;
  }

  // // This is required for the pass to be recognized and initialized by LLVM
  // void getAnalysisUsage(AnalysisUsage &AU) const override {
  //   AU.addRequired<LoopInfoWrapperPass>();
  //   AU.addRequired<ScalarEvolutionWrapperPass>();
  //   AU.setPreservesCFG();
  // }
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
     if(Name == "set-unroll-pass"){
      FPM.addPass(LoopUnrollPass2());
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