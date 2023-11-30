#include "llvm/Analysis/BlockFrequencyInfo.h"
#include "llvm/Analysis/BranchProbabilityInfo.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Format.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/CFG.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopIterator.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/ScalarEvolution.h"

#include <iostream>
#include <vector>
#include <optional>
// #include <nlohmann/json.hpp>
// using json = nlohmann::json;

using namespace llvm;
using namespace std;

#define ALUI 0
#define ALUF 1
#define LOAD 2
#define STORE 3
#define MEM 4
#define BRANCH 5
#define OTHERS 6

#define IS_ALUI(ins)                                                               \
  (ins.getOpcode() == Instruction::Add || ins.getOpcode() == Instruction::Sub ||   \
   ins.getOpcode() == Instruction::Mul || ins.getOpcode() == Instruction::UDiv ||  \
   ins.getOpcode() == Instruction::SDiv || ins.getOpcode() == Instruction::URem || \
   ins.getOpcode() == Instruction::Shl || ins.getOpcode() == Instruction::LShr ||  \
   ins.getOpcode() == Instruction::AShr || ins.getOpcode() == Instruction::And ||  \
   ins.getOpcode() == Instruction::Or || ins.getOpcode() == Instruction::Xor ||    \
   ins.getOpcode() == Instruction::ICmp || ins.getOpcode() == Instruction::SRem)

#define IS_ALUF(ins)                                                               \
  (ins.getOpcode() == Instruction::FAdd || ins.getOpcode() == Instruction::FSub || \
   ins.getOpcode() == Instruction::FMul || ins.getOpcode() == Instruction::FDiv || \
   ins.getOpcode() == Instruction::FRem || ins.getOpcode() == Instruction::FCmp)

#define IS_LOAD(ins) \
  (ins.getOpcode() == Instruction::Load)

#define IS_STORE(ins) \
  (ins.getOpcode() == Instruction::Store)

#define IS_MEM(ins)                                                                          \
  (ins.getOpcode() == Instruction::Alloca ||                                                 \
   ins.getOpcode() == Instruction::GetElementPtr ||                                          \
   ins.getOpcode() == Instruction::Fence || ins.getOpcode() == Instruction::AtomicCmpXchg || \
   ins.getOpcode() == Instruction::AtomicRMW)

#define IS_BRANCH(ins)                                                             \
  (ins.getOpcode() == Instruction::Br || ins.getOpcode() == Instruction::Switch || \
   ins.getOpcode() == Instruction::IndirectBr)

namespace
{

  struct FeaturePass : public PassInfoMixin<FeaturePass>
  {

    // void getAnalysisUsage(llvm::AnalysisUsage &AU) const override
    // {
    //   AU.addRequired<llvm::ScalarEvolutionWrapperPass>();
    //   AU.setPreservesAll(); // Indicate that the pass doesn't modify the function
    // }

    PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM)
    {

      // LoopInfo &LI = getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
      llvm::LoopAnalysis::Result &LI = FAM.getResult<LoopAnalysis>(F);
      ScalarEvolution SE = getAnalysis<ScalarEvolutionWrapperPass>().getSE(F);

      for (Loop *L : LI)
      {
        if (L->getSubLoops().empty())
        {
          if (L->getCanonicalInductionVariable() && L->getCanonicalInductionVariable()->getType()->isIntegerTy())
          {
            const SCEV *trip_count_SCEV = SE->getBackedgeTakenCount(L);
            const ConstantInt *cint_trip_count = dyn_cast<ConstantInt>(trip_count_SCEV->getAPInt());
            uint64_t trip_count = cint_trip_count->getZExtValue();
            errs() << trip_count;
          }
        }

        vector<float> counts(7, 0);

        // Loop over all basic blocks in the loop
        for (BasicBlock *BB : L->getBlocks())
        {
          // Loop over all instruction in the basic block
          for (Instruction &I : *BB)
          {
            // Check what type of instruction we have
            if (IS_ALUI(I))
            {
              ++counts[ALUI];
            }
            else if (IS_ALUF(I))
            {
              ++counts[ALUF];
            }
            else if (IS_LOAD(I))
            {
              ++counts[LOAD];
              ++counts[MEM];
            }
            else if (IS_STORE(I))
            {
              ++counts[STORE];
              ++counts[MEM];
            }
            else if (IS_MEM(I))
            {
              ++counts[MEM];
            }
            else if (IS_BRANCH(I))
            {
              ++counts[BRANCH];
            }
            else
            {
              ++counts[OTHERS];
            }
          }
        }

        // Print stats
        // Print format: ALUI ALUF LOAD STORE MEM BRANCH OTHERS TOTAL
        int sum = 0;
        for (int i = 0; i < counts.size(); i++)
        {
          errs() << ", " << format("%.3f", counts[i]);
          sum += counts[i];
        }
        errs() << ", " << sum << "\n";
      }

      return PreservedAnalyses::all();
    }
  };
}

extern "C" ::llvm::PassPluginLibraryInfo LLVM_ATTRIBUTE_WEAK llvmGetPassPluginInfo()
{
  return {
      LLVM_PLUGIN_API_VERSION, "FeaturePass", "v0.1",
      [](PassBuilder &PB)
      {
        PB.registerPipelineParsingCallback(
            [](StringRef Name, FunctionPassManager &FPM,
               ArrayRef<PassBuilder::PipelineElement>)
            {
              if (Name == "featurepass")
              {
                FPM.addPass(FeaturePass());
                return true;
              }
              return false;
            });
      }};
}