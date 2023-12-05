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

#include <fstream>

// NOTE, must add path -I/home/praut/CompilersFinalProject/external/json/include before compiling
#include <nlohmann/json.hpp>
using json = nlohmann::json;

using namespace llvm;
using namespace std;

#define NUM_INST_COUNTS 12
#define ALUI 0
#define ALUF 1
#define LOAD 2
#define STORE 3
#define MEM 4
#define BRANCH 5
#define OTHER 6
#define INSTRUCTION_SUM 7
#define OPERAND_SUM 8
#define ARRAY_READS 9
#define ARRAY_WRITES 10
#define ARRAY_ACCESSES 11

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

    int getLineNumber(Loop *L)
    {
      int line_number = -1;
      Instruction *I_line = L->getHeader()->getFirstNonPHIOrDbg();
      if (auto DL = I_line->getDebugLoc())
      {
        // Extract the line number from the DebugLoc
        line_number = DL.getLine();
      }

      return line_number;
    }

    int64_t getTripCount(Loop *L, ScalarEvolution &SE)
    {
      const SCEV *trip_count_scev = SE.getBackedgeTakenCount(L);
      int64_t trip_count = -1;
      if (isa<SCEVConstant>(trip_count_scev))
      {
        const SCEVConstant *trip_count_constant = cast<SCEVConstant>(trip_count_scev);
        trip_count = trip_count_constant->getValue()->getZExtValue();
      }
      return trip_count;
    }

    vector<float> getInstructionCounts(Loop *L)
    {
      vector<float> counts(NUM_INST_COUNTS, 0);
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
          if (isa<LoadInst>(I))
          {
            LoadInst *loadInst = dyn_cast<LoadInst>(&I);
            Value *ptr_operand = loadInst->getPointerOperand();
            if (isa<GEPOperator>(ptr_operand))
            {
              GEPOperator *gep = dyn_cast<GEPOperator>(ptr_operand);
              Value *firstOperand = gep->getOperand(0);
              Type *type = firstOperand->getType();
              if (PointerType *pointerType = dyn_cast<PointerType>(type))
              {
                Type *elementType = pointerType->getPointerElementType();
                if (elementType->isArrayTy())
                {
                  ++array_read;
                }
              }
            }
          }

          // Check if instruction has array write
          if (StoreInst *storeInst = dyn_cast<StoreInst>(&I))
          {
            Value *ptr_operand = storeInst->getPointerOperand();
            if (isa<GEPOperator>(ptr_operand))
            {
              GEPOperator *gep = dyn_cast<GEPOperator>(ptr_operand);
              Value *firstOperand = gep->getOperand(0);
              Type *type = firstOperand->getType();
              if (PointerType *pointerType = dyn_cast<PointerType>(type))
              {
                Type *elementType = pointerType->getPointerElementType();
                if (elementType->isArrayTy())
                {
                  ++array_write;
                }
              }
            }
          }

          // Get number of operands
          operand_sum += I.getNumOperands();

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

      float sum = 0;
      for (int i = 0; i < NUM_INST_COUNTS; ++i)
      {
        sum += counts[i];
      }

      counts[INSTRUCTION_SUM] = sum;
      counts[OPERAND_SUM] = operand_sum;
      counts[ARRAY_READS] = array_read;
      counts[ARRAY_WRITES] = array_write;
      counts[ARRAY_ACCESSES] = array_read + array_write;

      return counts;
    }

    vector<float> getDependencyInfo(Loop *L, DependenceInfo &depInfo)
    {
      vector<float> dependencyInfo(12, 0.0);

      int max_inter_loop_dependency_distance = 0;
      int max_inter_loop_dependency_distance_flow = 0;
      int max_inter_loop_dependency_distance_anti = 0;
      int max_inter_loop_dependency_distance_output = 0;

      int inter_loop_dependencies = 0;
      int inter_loop_dependencies_flow = 0;
      int inter_loop_dependencies_anti = 0;
      int inter_loop_dependencies_output = 0;

      int intra_loop_dependencies = 0;
      int intra_loop_dependencies_flow = 0;
      int intra_loop_dependencies_anti = 0;
      int intra_loop_dependencies_output = 0;

      for (llvm::BasicBlock *BB1 : L->blocks())
      {
        for (llvm::Instruction &I1 : *BB1)
        {
          for (llvm::BasicBlock *BB2 : L->blocks())
          {
            for (llvm::Instruction &I2 : *BB2)
            {

              auto dependence = depInfo.depends(&I1, &I2, true);
              if (dependence && !dependence->isLoopIndependent())
              {
                const SCEV *scev_distance = dependence->getDistance(L->getLoopDepth());
                if (scev_distance)
                {
                  if (const SCEVConstant *constSCEV = dyn_cast<SCEVConstant>(scev_distance))
                  {
                    const APInt &intValue = constSCEV->getAPInt();
                    int int_signed_distance = intValue.getSExtValue();
                    int int_distance = abs(int_signed_distance);
                    max_inter_loop_dependency_distance = max_inter_loop_dependency_distance > int_distance ? max_inter_loop_dependency_distance : int_distance;

                    if (dependence.isFlow())
                    {
                      max_inter_loop_dependency_distance_flow = max_inter_loop_dependency_distance_flow > int_distance ? max_inter_loop_dependency_distance_flow : int_distance;
                    }
                    else if (dependence.isAnti())
                    {
                      max_inter_loop_dependency_distance_anti = max_inter_loop_dependency_distance_anti > int_distance ? max_inter_loop_dependency_distance_anti : int_distance;
                    }
                    else if (dependence.isOutput())
                    {
                      max_inter_loop_dependency_distance_output = max_inter_loop_dependency_distance_output > int_distance ? max_inter_loop_dependency_distance_output : int_distance;
                    }
                  }
                }

                ++inter_loop_dependencies;

                if (dependence.isFlow())
                {
                  ++inter_loop_dependencies_flow;
                }
                else if (dependence.isAnti())
                {
                  ++inter_loop_dependencies_anti;
                }
                else if (dependence.isOutput())
                {
                  ++inter_loop_dependencies_output;
                }
              }
              else if (dependence && dependence->isLoopIndependent())
              {
                ++intra_loop_dependencies;
                if (dependence.isFlow())
                {
                  ++intra_loop_dependencies_flow;
                }
                else if (dependence.isAnti())
                {
                  ++intra_loop_dependencies_anti;
                }
                else if (dependence.isOutput())
                {
                  ++intra_loop_dependencies_output;
                }
              }
            }
          }
        }
      }

      dependencyInfo[0] = max_inter_loop_dependency_distance;
      dependencyInfo[1] = max_inter_loop_dependency_distance_flow;
      dependencyInfo[2] = max_inter_loop_dependency_distance_anti;
      dependencyInfo[3] = max_inter_loop_dependency_distance_output;

      dependencyInfo[4] = inter_loop_dependencies;
      dependencyInfo[5] = inter_loop_dependencies_flow;
      dependencyInfo[6] = inter_loop_dependencies_anti;
      dependencyInfo[7] = inter_loop_dependencies_output;

      dependencyInfo[8] = intra_loop_dependencies;
      dependencyInfo[9] = intra_loop_dependencies_flow;
      dependencyInfo[10] = intra_loop_dependencies_anti;
      dependencyInfo[11] = intra_loop_dependencies_output;

      return dependencyInfo;
    }

    int getLoopDepth(Loop *L)
    {
      int loopDepth = L->getLoopDepth();
      return loopDepth;
    }

    vector<int> getResMIIEstimates(Loop *L, vector<float> instructionCounts)
    {
      vector<int> resMII(3, 0);

      resMII[0] = ceil((instructionCounts[ALUI] + instructionCounts[ALUF]) / 1); // ALU resMII
      resMII[1] = ceil((instructionCounts[MEM]) / 1);                            // MEM resMII
      resMII[2] = ceil((instructionCounts[BRANCH]) / 1);                         // BR resMII
      resMII[0] = *max_element(resMII.begin(), resMII.end());

      std::fill(resMII.begin(), resMII.end(), 0);
      resMII[0] = ceil((instructionCounts[ALUI] + instructionCounts[ALUF]) / 2); // ALU resMII
      resMII[1] = ceil((instructionCounts[MEM]) / 1);                            // MEM resMII
      resMII[2] = ceil((instructionCounts[BRANCH]) / 1);                         // BR resMII
      resMII[1] = *max_element(resMII.begin(), resMII.end());

      std::fill(resMII.begin(), resMII.end(), 0);
      resMII[0] = ceil((instructionCounts[ALUI] + instructionCounts[ALUF]) / 1); // ALU resMII
      resMII[1] = ceil((instructionCounts[MEM]) / 2);                            // MEM resMII
      resMII[2] = ceil((instructionCounts[BRANCH]) / 1);                         // BR resMII
      resMII[2] = *max_element(resMII.begin(), resMII.end());

      return resMII;
    }

    json get_loop_features(Loop *L, llvm::LoopAnalysis::Result &LI, ScalarEvolution &SE, DependenceInfo &depInfo)
    {
      json outer_features = json::array();

      if (L->getSubLoops().empty())
      {
        // init inner json
        json loop_features;

        int line_number = getLineNumber(L);
        int64_t trip_count = getTripCount(L, SE);
        vector<float> instruction_counts = getInstructionCounts(L);
        vector<float> dependency_info = getDependencyInfo(L, depInfo);
        int loop_nest_level = getLoopDepth(L);
        vector<int> res_mii_estimates = getResMIIEstimates(L, instruction_counts);

        loop_features["loop_line_number"] = line_number;
        loop_features["trip_count"] = trip_count;

        loop_features["alui"] = instruction_counts[ALUI];
        loop_features["aluf"] = instruction_counts[ALUF];
        loop_features["load"] = instruction_counts[LOAD];
        loop_features["store"] = instruction_counts[STORE];
        loop_features["mem"] = instruction_counts[MEM];
        loop_features["branch"] = instruction_counts[BRANCH];
        loop_features["other"] = instruction_counts[OTHER];
        loop_features["instruction_sum"] = instruction_counts[INSTRUCTION_SUM];
        loop_features["operand_sum"] = instruction_counts[OPERAND_SUM];
        loop_features["array_reads"] = instruction_counts[ARRAY_READS];
        loop_features["array_writes"] = instruction_counts[ARRAY_WRITES];
        loop_features["array_accesses"] = instruction_counts[ARRAY_ACCESSES];

        loop_features["max_inter_loop_dependency_distance"] = dependency_info[0];
        loop_features["max_inter_loop_dependency_distance_flow"] = dependency_info[1];
        loop_features["max_inter_loop_dependency_distance_anti"] = dependency_info[2];
        loop_features["max_inter_loop_dependency_distance"] = dependency_info[3];
        loop_features["inter_loop_dependencies"] = dependency_info[4];
        loop_features["inter_loop_dependencies_flow"] = dependency_info[5];
        loop_features["inter_loop_dependencies_anti"] = dependency_info[6];
        loop_features["inter_loop_dependencies_output"] = dependency_info[7];

        loop_features["intra_loop_dependencies"] = dependency_info[8];
        loop_features["intra_loop_dependencies_flow"] = dependency_info[9];
        loop_features["intra_loop_dependencies_anti"] = dependency_info[10];
        loop_features["intra_loop_dependencies_output"] = dependency_info[11];

        loop_features["has_inter_loop_carried_dependency"] = dependency_info[1] > 0;

        loop_features["loop_nest_level"] = loop_nest_level;

        loop_features["resmii_111"] = res_mii_estimates[0];
        loop_features["resmii_211"] = res_mii_estimates[1];
        loop_features["resmii_121"] = res_mii_estimates[2];

        outer_features.push_back(loop_features);
        return outer_features;
      }

      for (auto subL : L->getSubLoops())
      {
        json sub_loop_features = get_loop_features(subL, LI, SE, depInfo);
        for (auto &i : sub_loop_features)
        {
          outer_features.push_back(i);
        }
      }

      return outer_features;
    }

    PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM)
    {

      json function_features;

      /* ANALYSES NEEDED BEGIN */
      llvm::LoopAnalysis::Result &LI = FAM.getResult<LoopAnalysis>(F);
      ScalarEvolution &SE = FAM.getResult<ScalarEvolutionAnalysis>(F);
      DependenceInfo depInfo = FAM.getResult<DependenceAnalysis>(F);
      /* ANALYSES NEEDED END */

      for (Loop *L : LI)
      {
        json loop_features = get_loop_features(L, LI, SE, depInfo);

        for (auto &i : loop_features)
        {
          function_features.push_back(i);
        }
      }

      json running_json;
      std::ifstream inFile("features.json");
      if (inFile)
      {
        inFile >> running_json;
        inFile.close();
      }

      for (auto i : function_features)
      {
        running_json.push_back(i);
      }

      errs() << function_features.dump(4);
      std::ofstream file("features.json");
      if (file.is_open())
      {
        file << running_json.dump(4); // The '4' here is for pretty printing with an indent of 4 spaces
        file.close();
      }
      else
      {
        std::cerr << "Unable to open file";
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