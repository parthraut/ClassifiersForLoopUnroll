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
#include "llvm/CodeGen/Passes.h"
#include "llvm/CodeGen/LiveIntervals.h"

#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <vector>
#include <optional>
#include <cmath>

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
#define OTHER 6


#define FEATURE1
#define FEATURE2
#define FEATURE3
#define FEATURE4
#define FEATURE5
// #define FEATURE6
// #define FEATURE7

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

    // void getAnalysisUsage(llvm::AnalysisUsage &AU) const override
    // {
    //     AU.addRequired<llvm::ScalarEvolutionWrapperPass>();
    //     AU.setPreservesAll();
    //     llvm::PassInfoMixin<FeaturePass>::getAnalysisUsage(AU);
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
      llvm::LoopAnalysis::Result &LI = FAM.getResult<LoopAnalysis>(F);
      ScalarEvolution &SE = FAM.getResult<ScalarEvolutionAnalysis>(F);
      DependenceInfo depInfo = FAM.getResult<DependenceAnalysis>(F);
      // LiveIntervals &LIs = FAM.getResult<LiveIntervalsAnalysis>(F);


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
          #ifdef FEATURE1
          const SCEV* trip_count_scev = SE.getBackedgeTakenCount(L);
          int64_t trip_count = -1;
          if (isa<SCEVConstant>(trip_count_scev)) {
            const SCEVConstant* trip_count_constant = cast<SCEVConstant>(trip_count_scev);
            trip_count = trip_count_constant->getValue()->getZExtValue();
          }
          loop_features["trip_count"] = trip_count;
          #endif
          /* FEATURE 1 (Trip count) EXRACTION END */

          /* FEATURE 2 (Instruction Counts) EXRACTION BEGIN */

        // if (StoreInst *storeInst = dyn_cast<StoreInst>(&I)) {
        //   Value *storePtr = storeInst->getPointerOperand();

        //   // Check if the stored value is an array
        //   if (storePtr->getType()->isArrayTy()) {
        //     errs() << "Found a write to an array:\n";
        //     errs() << "Instruction: " << *storeInst << "\n";
        //   }
        // }


          #ifdef FEATURE2
          vector<float> counts(7, 0);
          int operand_sum = 0;
          int array_read = 0;
          int array_write = 0;
          // Loop over all basic blocks in the loop
          for (BasicBlock *BB : L->getBlocks())
          {
            // Loop over all instruction in the basic block
            for (Instruction &I : *BB)
            {

              // array read
              if (isa<LoadInst>(I)) {
                LoadInst* loadInst = dyn_cast<LoadInst>(&I);
                Value* ptr_operand = loadInst->getPointerOperand();
                if (isa<GEPOperator>(ptr_operand)) {
                  GEPOperator* gep = dyn_cast<GEPOperator>(ptr_operand);
                  Value* firstOperand = gep->getOperand(0);
                  Type* type = firstOperand->getType();
                  if (PointerType *pointerType = dyn_cast<PointerType>(type)) {
                      Type* elementType = pointerType->getPointerElementType();
                      if (elementType->isArrayTy()) {
                        ++array_read;
                      }
                  }
                }
              }

              // Check if instruction has array write
              if (StoreInst* storeInst = dyn_cast<StoreInst>(&I)) {
                // Value* store_ptr = storeInst->getPointerOperand();
                // if (store_ptr->getType()->isArrayTy()) {
                //   ++array_write;
                // }
                Value* ptr_operand = storeInst->getPointerOperand();
                if (isa<GEPOperator>(ptr_operand)) {
                  GEPOperator* gep = dyn_cast<GEPOperator>(ptr_operand);
                  Value* firstOperand = gep->getOperand(0);
                  Type* type = firstOperand->getType();
                  if (PointerType *pointerType = dyn_cast<PointerType>(type)) {
                      Type* elementType = pointerType->getPointerElementType();
                      if (elementType->isArrayTy()) {
                        ++array_write;
                      }
                  }
                }
              }

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
                ++counts[OTHER];
              }
            }
          }

          loop_features["alui"] = counts[ALUI];
          loop_features["aluf"] = counts[ALUF];
          loop_features["load"] = counts[LOAD];
          loop_features["store"] = counts[STORE];
          loop_features["mem"] = counts[MEM];
          loop_features["branch"] = counts[BRANCH];
          loop_features["other"] = counts[OTHER];

          float sum = 0;
          for (int i = 0; i < counts.size(); ++i) {
            sum += counts[i];
          }
          loop_features["instruction_sum"] = sum;
          loop_features["operand_sum"] = operand_sum;
          loop_features["array_reads"] = array_read;
          loop_features["array_writes"] = array_write;
          loop_features["array_accesses"] = array_read + array_write;

          #endif
          /* FEATURE 2 (Instruction Counts) EXRACTION END */

          /* FEATURE 3 (Dependency Distance AND has loop carried dependencies) EXRACTION BEGIN */
          #ifdef FEATURE3

          // Dependence *Dep = DI.getDependency(&I);
          // if (Dep && Dep->isDistance()) {
          //   errs() << "Memory dependency with distance: " << Dep->getDistance() << "\n";
          // }

          int max_inter_loop_dependency_distance = 0;
          int inter_loop_dependencies = 0;
          int intra_loop_dependencies = 0;

          for (llvm::BasicBlock *BB1 : L->blocks()) {
            for (llvm::Instruction &I1 : *BB1) {
              for (llvm::BasicBlock *BB2 : L->blocks()) {
                for (llvm::Instruction &I2 : *BB2) {

                  auto dependence = depInfo.depends(&I1, &I2, true);	
                  if(dependence && !dependence->isLoopIndependent()){ 
                      const SCEV* scev_distance = dependence->getDistance(L->getLoopDepth());
                      if (scev_distance) {
                        if (const SCEVConstant *constSCEV = dyn_cast<SCEVConstant>(scev_distance)) {
                          const APInt& intValue = constSCEV->getAPInt();
                          int int_signed_distance = intValue.getSExtValue();
                          int int_distance = abs(int_signed_distance);
                          max_inter_loop_dependency_distance = max_inter_loop_dependency_distance > int_distance ? max_inter_loop_dependency_distance : int_distance;
                        }
                      }
  
                    ++inter_loop_dependencies;

                  } else if (dependence && dependence->isLoopIndependent()) {
                    ++intra_loop_dependencies;
                  }
                }
              }
            }
          }

          loop_features["inter_loop_dependencies"] = inter_loop_dependencies;
          loop_features["has_inter_loop_carried_dependency"] = inter_loop_dependencies > 0;
          loop_features["max_inter_loop_dependency_distance"] = max_inter_loop_dependency_distance;
          loop_features["intra_loop_dependencies"] = intra_loop_dependencies;

          
          #endif
          /* FEATURE 3 (Dependency Distance) EXRACTION END */


          /* FEATURE 4 (Loop nest level) EXRACTION BEGIN */
          #ifdef FEATURE4

          loop_features["loop_nest_level"] = L->getLoopDepth();

          #endif
          /* FEATURE 4 (Loop nest level) EXRACTION END */
          
          /* FEATURE 5 (ResMII) EXRACTION BEGIN */
          #ifdef FEATURE5
          vector<int> resMII(3, 0);
          resMII[0] = ceil((counts[ALUI] + counts[ALUF]) / 1); // ALU resMII
          resMII[1] = ceil((counts[MEM]) / 1); // MEM resMII
          resMII[2] = ceil((counts[BRANCH]) / 1); // BR resMII
          loop_features["resmii_111"] = *max_element(resMII.begin(), resMII.end());

          std::fill(resMII.begin(), resMII.end(), 0);
          resMII[0] = ceil((counts[ALUI] + counts[ALUF]) / 2); // ALU resMII
          resMII[1] = ceil((counts[MEM]) / 1); // MEM resMII
          resMII[2] = ceil((counts[BRANCH]) / 1); // BR resMII
          loop_features["resmii_211"] = *max_element(resMII.begin(), resMII.end());
          
          std::fill(resMII.begin(), resMII.end(), 0);
          resMII[0] = ceil((counts[ALUI] + counts[ALUF]) / 1); // ALU resMII
          resMII[1] = ceil((counts[MEM]) / 2); // MEM resMII
          resMII[2] = ceil((counts[BRANCH]) / 1); // BR resMII
          loop_features["resmii_121"] = *max_element(resMII.begin(), resMII.end());

          #endif
          /* FEATURE 5 (ResMII) EXRACTION END */


          /* FEATURE 6 (Live range size) EXRACTION BEGIN */
          #ifdef FEATURE6
            // calculate all live ranges in loop L using LiveRange
            
          #endif
          /* FEATURE 6 (Live range size) EXRACTION END */
          
          features.push_back(loop_features);
        }

        


      }
      //   // Print stats
      //   // Print format: LINE_NUM ALUI ALUF LOAD STORE MEM BRANCH OTHER TOTAL
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