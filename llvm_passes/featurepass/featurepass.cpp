#include "llvm/Analysis/BlockFrequencyInfo.h"
#include "llvm/Analysis/BranchProbabilityInfo.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Format.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/CFG.h"

#include <iostream>
#include <vector>
#include <optional>

using namespace llvm;
using namespace std;

#define ALUI 0
#define ALUF 1
#define MEM 2
#define BIASEDBRANCH 3
#define UNBIASEDBRANCH 4
#define OTHERS 5

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

#define IS_MEM(ins)                                                                          \
  (ins.getOpcode() == Instruction::Alloca || ins.getOpcode() == Instruction::Load ||         \
   ins.getOpcode() == Instruction::Store || ins.getOpcode() == Instruction::GetElementPtr || \
   ins.getOpcode() == Instruction::Fence || ins.getOpcode() == Instruction::AtomicCmpXchg || \
   ins.getOpcode() == Instruction::AtomicRMW)

#define IS_BRANCH(ins)                                                             \
  (ins.getOpcode() == Instruction::Br || ins.getOpcode() == Instruction::Switch || \
   ins.getOpcode() == Instruction::IndirectBr)

namespace
{

  struct HW1Pass : public PassInfoMixin<HW1Pass>
  {

    PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM)
    {
      // These variables contain the results of some analysis passes.
      // Go through the documentation to see how they can be used.
      llvm::BlockFrequencyAnalysis::Result &bfi = FAM.getResult<BlockFrequencyAnalysis>(F);
      llvm::BranchProbabilityAnalysis::Result &bpi = FAM.getResult<BranchProbabilityAnalysis>(F);

      // Add your code here
      // SmallVector<uint64_t, 6> opCounts;
      // vector<uint64_t> opCounts(6, 0); // Stores function counts for each operation type
      vector<float> opCounts(6, 0); // Stores function counts for each operation type
      uint64_t dynOpCount = 0;      // Stores function dynamic operation count
      for (BasicBlock &BB : F)
      {
        uint64_t numOps = 0; // Stores operation count for this basic block
        uint64_t bpc = *bfi.getBlockProfileCount(&BB);
        for (Instruction &I : BB)
        {
          if (IS_ALUI(I))
          {
            opCounts[ALUI] += bpc;
          }
          else if (IS_ALUF(I))
          {
            opCounts[ALUF] += bpc;
          }
          else if (IS_MEM(I))
          {
            opCounts[MEM] += bpc;
          }
          else if (IS_BRANCH(I))
          {
            // Determine if branch is biased or not
            bool isBiased = false;
            for (BasicBlock *S : successors(&BB))
            {
              // Get edge probability for each successor & see if one is > 0.8
              BranchProbability bp = bpi.getEdgeProbability(&BB, S);
              // float ratio = static_cast<double>(bp.getNumerator()) / static_cast<double>(bp.getDenominator());
              // if (ratio > 0.8)
              if (bp > BranchProbability(8, 10))
              {
                // One is > 0.8 --> branch is biased, stop checking and update accordingly
                isBiased = true;
                opCounts[BIASEDBRANCH] += bpc;
                break;
              }
            }
            if (!isBiased)
            {
              // None are > 0.8 --> branch is unbiased, update accordingly
              opCounts[UNBIASEDBRANCH] += bpc;
            }
          }
          else
          {
            opCounts[OTHERS] += bpc;
          }
          ++numOps;
        }
        dynOpCount += bpc * numOps;
      }

      // Print stats
      errs() << F.getName();
      errs() << ", " << dynOpCount;
      for (int i = 0; i < opCounts.size(); i++)
      {
        if (dynOpCount == 0)
          errs() << ", " << format("%.3f", opCounts[i]);
        else
        {
          errs() << ", " << format("%.3f", opCounts[i]);
        }
      }
      errs() << "\n";

      return PreservedAnalyses::all();
    }
  };
}

extern "C" ::llvm::PassPluginLibraryInfo LLVM_ATTRIBUTE_WEAK llvmGetPassPluginInfo()
{
  return {
      LLVM_PLUGIN_API_VERSION, "HW1Pass", "v0.1",
      [](PassBuilder &PB)
      {
        PB.registerPipelineParsingCallback(
            [](StringRef Name, FunctionPassManager &FPM,
               ArrayRef<PassBuilder::PipelineElement>)
            {
              if (Name == "hw1")
              {
                FPM.addPass(HW1Pass());
                return true;
              }
              return false;
            });
      }};
}