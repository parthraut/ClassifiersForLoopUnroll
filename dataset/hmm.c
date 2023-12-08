#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define NUM_STATES 3
#define NUM_OBSERVATIONS 4
#define NUM_SEQ_LENGTH 5

void forwardAlgorithm(double transition[][NUM_STATES], double emission[][NUM_OBSERVATIONS],
                      double initialProb[], int observationSeq[], double forwardMatrix[][NUM_STATES]) {
    // Initialization
    for (int i = 0; i < NUM_STATES; ++i) {
        forwardMatrix[0][i] = initialProb[i] * emission[i][observationSeq[0]];
    }

    // Recursion
    for (int t = 1; t < NUM_SEQ_LENGTH; ++t) {
        for (int j = 0; j < NUM_STATES; ++j) {
            forwardMatrix[t][j] = 0;
            for (int i = 0; i < NUM_STATES; ++i) {
                forwardMatrix[t][j] += forwardMatrix[t - 1][i] * transition[i][j];
            }
            forwardMatrix[t][j] *= emission[j][observationSeq[t]];
        }
    }
}

int main() {
    double transition[NUM_STATES][NUM_STATES];
    double emission[NUM_STATES][NUM_OBSERVATIONS];
    double initialProb[NUM_STATES];
    int observationSeq[NUM_SEQ_LENGTH];

    // HMM parameters
    for (int i = 0; i < NUM_STATES; i++) {
        for (int j = 0; j < NUM_STATES; j++) {
            transition[i][j] = rand() % NUM_STATES;
        }
    }
    for (int i = 0; i < NUM_STATES; i++) {
        for (int j = 0; j < NUM_OBSERVATIONS; j++) {
            emission[i][j] = rand() % NUM_OBSERVATIONS;
        }
    }
    for (int i = 0; i < NUM_STATES; i++) {
        initialProb[i] = rand() % NUM_STATES;
    }
    for (int i = 0; i < NUM_SEQ_LENGTH; i++) {
        observationSeq[i] = rand() % NUM_SEQ_LENGTH;
    }

    double forwardMatrix[NUM_SEQ_LENGTH][NUM_STATES];

    forwardAlgorithm(transition, emission, initialProb, observationSeq, forwardMatrix);

    // Print the forward matrix
    for (int t = 0; t < NUM_SEQ_LENGTH; ++t) {
        for (int j = 0; j < NUM_STATES; ++j) {
            printf("%.4f\t", forwardMatrix[t][j]);
        }
        printf("\n");
    }

    return 0;
}