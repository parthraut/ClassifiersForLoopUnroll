#include <stdio.h>

#define N 1000
#define DAMPING_FACTOR 0.85
#define EPSILON 1e-10

void pagerank(float matrix[N][N], float result[N]) {
    float prev_rank[N];
    for (int i = 0; i < N; i++) {
        result[i] = 1.0 / N;
        prev_rank[i] = 1.0 / N;
    }

    while (1) {
        for (int i = 0; i < N; i++) {
            float sum = 0;
            for (int j = 0; j < N; j++) {
                sum += matrix[j][i] * prev_rank[j];
            }
            result[i] = (1 - DAMPING_FACTOR) / N + DAMPING_FACTOR * sum;
        }

        // Check for convergence
        int converged = 1;
        for (int i = 0; i < N; i++) {
            if (fabs(result[i] - prev_rank[i]) > EPSILON) {
                converged = 0;
                break;
            }
        }

        if (converged) {
            break;
        }

        // Update previous rank
        for (int i = 0; i < N; i++) {
            prev_rank[i] = result[i];
        }
    }
}

int main() {
    float matrix[N][N];
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            matrix[i][j] = rand() % 2;
        }
    }
    // float matrix[N][N] = {{0, 1, 1, 0},
    //                       {1, 0, 0, 1},
    //                       {1, 0, 0, 1},
    //                       {0, 1, 1, 0}};

    float result[N];
    pagerank(matrix, result);

    // Display PageRank scores
    printf("PageRank Scores:\n");
    for (int i = 0; i < N; i++) {
        printf("Node %d: %.4f\n", i + 1, result[i]);
    }

    return 0;
}