#include <stdio.h>
#include <string.h>

#define MAX_SEQ_LENGTH 100

// Function to predict RNA secondary structure using the Nussinov algorithm
void nussinovAlgorithm(char sequence[], int length) {
    int i, j, k, gap;

    // Initialize a 2D array to store the dynamic programming matrix
    int dp[MAX_SEQ_LENGTH][MAX_SEQ_LENGTH];

    // Initialize the matrix with zeros
    for (i = 0; i < length; i++) {
        for (j = 0; j < length; j++) {
            dp[i][j] = 0;
        }
    }

    // Implement the Nussinov algorithm
    for (gap = 2; gap < length; gap++) {
        for (i = 0; i < length - gap; i++) {
            j = i + gap;
            dp[i][j] = dp[i + 1][j];
            for (k = i + 1; k <= j; k++) {
                if ((sequence[i] == 'A' && sequence[k] == 'U') ||
                    (sequence[i] == 'U' && sequence[k] == 'A') ||
                    (sequence[i] == 'C' && sequence[k] == 'G') ||
                    (sequence[i] == 'G' && sequence[k] == 'C')) {
                    dp[i][j] = (dp[i][j] > dp[i + 1][k - 1] + 1) ? dp[i][j] : dp[i + 1][k - 1] + 1;
                }
            }
            for (k = i; k < j; k++) {
                dp[i][j] = (dp[i][j] > dp[i][k] + dp[k + 1][j]) ? dp[i][j] : dp[i][k] + dp[k + 1][j];
            }
        }
    }

    // Print the predicted RNA secondary structure
    printf("Predicted RNA Secondary Structure:\n");
    for (i = 0; i < length; i++) {
        for (j = 0; j < length; j++) {
            if (j < i + 4) {
                printf(" ");
            } else {
                printf("%d", dp[i][j]);
            }
        }
        printf("\n");
    }
}

int main() {
    // Example RNA sequence
    char rnaSequence[] = "GGCAUUAUCCGU";
    int length = strlen(rnaSequence);

    nussinovAlgorithm(rnaSequence, length);

    return 0;
}