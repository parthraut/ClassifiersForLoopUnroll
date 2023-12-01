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
#include "llvm/Pass.h"
#include <llvm/Analysis/ScalarEvolutionExpressions.h>
#include "llvm/Analysis/DependenceAnalysis.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Transforms/Scalar/IndVarSimplify.h"

#include <iostream>
#include <vector>
#include <optional>

// NOTE, must add path -I/home/praut/CompilersFinalProject/external/json/include before compiling
#include <nlohmann/json.hpp>
using json = nlohmann::json;

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

    int scev_to_int(SCEV* scev) {
      const SCEVConstant *constantSCEV = dyn_cast<SCEVConstant>(scev);
      APInt constantValue = constantSCEV->getAPInt();
      int64_t int_val = constantValue.getLimitedValue();
      return int_val;
    }

    int scev_to_int(const SCEV* scev) {
      const SCEVConstant *constantSCEV = dyn_cast<SCEVConstant>(scev);
      APInt constantValue = constantSCEV->getAPInt();
      int64_t int_val = constantValue.getLimitedValue();
      return int_val;
    }

    PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM)
    {
      /* OUTPUT: json with feture information

      {
        {
          loop_line_number: int
          feature1: []
          feature2: []
          ...
        }
      }
      */

      json features;

      /* ANALYSES NEEDED BEGIN */
      // LoopInfo &LI = getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
      llvm::LoopAnalysis::Result &LI = FAM.getResult<LoopAnalysis>(F);
      ScalarEvolution &SE = FAM.getResult<ScalarEvolutionAnalysis>(F);
      DependenceInfo depInfo = FAM.getResult<DependenceAnalysis>(F);
      /* ANALYSES NEEDED END */

      for (Loop *L : LI)
      {
        // if loop is a fully inner nested loop
        if (L->getSubLoops().empty())
        {
          // init inner json
          json loop_features;

          /* GET LOOP LINE NUMBER BEGIN */
            int line_number = -1;
            Instruction *I_line = L->getHeader()->getFirstNonPHIOrDbg();
            if (auto DL = I_line->getDebugLoc())
            {
              // Extract the line number from the DebugLoc
              line_number = DL.getLine();
            }
            loop_features["loop_line_number"] = line_number;

          /* GET LOOP LINE NUMBER END */

          /* FEATURE 1 (Trip count) EXRACTION BEGIN */
          // stores trip count, if not known set to -1

          int64_t trip_count = -1;
          errs() << "before trip count loop\n";
          if (L->getCanonicalInductionVariable()) {
            errs() << "loop has induction var\n";
          } else {
            errs() << "loop DOES NOT induction var\n";
          }

          if (L->getCanonicalInductionVariable() && L->getCanonicalInductionVariable()->getType()->isIntegerTy())
          {
            const SCEV *trip_count_SCEV = SE.getBackedgeTakenCount(L);
            const SCEVConstant *constantSCEV = dyn_cast<SCEVConstant>(trip_count_SCEV);
            APInt constantValue = constantSCEV->getAPInt();
            trip_count = constantValue.getLimitedValue();
          }

          loop_features["trip_count"] = trip_count;

            if (SE.hasLoopInvariantBackedgeTakenCount(L)) {
              const SCEV *TripCountSCEV = SE.getBackedgeTakenCount(L);
              if (isa<SCEVConstant>(TripCountSCEV)) {
                  const SCEVConstant *TripCountConstant = cast<SCEVConstant>(TripCountSCEV);
                  uint64_t TripCount = TripCountConstant->getValue()->getZExtValue();

                  // Use TripCount as needed
                  errs() << "TripCount: " << TripCount << "\n";
              }
              else{
                errs() << "NO FING TRIP COUNT KNOWN >:(\n";
              }
          }
          /* FEATURE 1 (Trip count) EXRACTION END */

          /* FEATURE 2 (Instruction Counts) EXRACTION BEGIN */
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

          loop_features["instr_counts"] = counts;
          /* FEATURE 2 (Instruction Counts) EXRACTION END */

          /* FEATURE 3 (Dependency Distance) EXRACTION BEGIN */

          // Dependence *Dep = DI.getDependency(&I);
          // if (Dep && Dep->isDistance()) {
          //   errs() << "Memory dependency with distance: " << Dep->getDistance() << "\n";
          // }

          int intra_loop_dependencies = 0;

          for (llvm::BasicBlock *BB1 : L->blocks()) {
            for (llvm::Instruction &I1 : *BB1) {
              for (llvm::BasicBlock *BB2 : L->blocks()) {
                for (llvm::Instruction &I2 : *BB2) {
                  auto dependence = depInfo.depends(&I1, &I2, true);	
                  // errs() << "checking loop independence\n"; //DEBUG
                  if(dependence && !dependence->isLoopIndependent()){ 
                    ++intra_loop_dependencies;
                  }
                }
              }
            }
          }

          loop_features["intra_loop_dependencies"] = intra_loop_dependencies;
          

          features.push_back(loop_features);
          /* FEATURE 3 (Dependency Distance) EXRACTION END */

          

        }

        


      }
      //   // Print stats
      //   // Print format: LINE_NUM ALUI ALUF LOAD STORE MEM BRANCH OTHERS TOTAL
      //   int sum = 0;
      //   for (int i = 0; i < counts.size(); i++)
      //   {
      //     errs() << ", " << format("%.3f", counts[i]);
      //     sum += counts[i];
      //   }
      //   errs() << ", " << sum << "\n";
      // }

      // PRINT LSON:

      errs() << features.dump(4);

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
                // FPM.addPass(llvm::createIndVarSimplifyPass());
                // FPM.addPass<LoopSimplifyPass>();
                // FPM.addPass(IndVarSimplify());
                // FPM.addPass(LoopSimplifyPass());
                FPM.addPass(FeaturePass());
                return true;
              }
              return false;
            });
      }};
}