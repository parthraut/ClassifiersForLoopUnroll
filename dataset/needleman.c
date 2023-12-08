#include <stdio.h>
#include <string.h>

#define MAX_SEQ_LENGTH 100
#define GAP_PENALTY -2
#define MATCH_SCORE 1
#define MISMATCH_SCORE -1

// Function to perform global sequence alignment using the Needleman-Wunsch algorithm
void needlemanWunsch(char seq1[], char seq2[]) {
    int len1 = strlen(seq1);
    int len2 = strlen(seq2);

    int matrix[len1 + 1][len2 + 1];

    // Initialize the matrix with gap penalties
    for (int i = 0; i <= len1; ++i) {
        matrix[i][0] = i * GAP_PENALTY;
    }
    for (int j = 0; j <= len2; ++j) {
        matrix[0][j] = j * GAP_PENALTY;
    }

    // Fill the matrix based on the Needleman-Wunsch algorithm
    for (int i = 1; i <= len1; ++i) {
        for (int j = 1; j <= len2; ++j) {
            int match = matrix[i - 1][j - 1] + ((seq1[i - 1] == seq2[j - 1]) ? MATCH_SCORE : MISMATCH_SCORE);
            int del = matrix[i - 1][j] + GAP_PENALTY;
            int insert = matrix[i][j - 1] + GAP_PENALTY;

            matrix[i][j] = (match > del) ? match : del;
            matrix[i][j] = (insert > matrix[i][j]) ? insert : matrix[i][j];
        }
    }

    // Print the alignment matrix
    printf("Alignment Matrix:\n");
    for (int i = 0; i <= len1; ++i) {
        for (int j = 0; j <= len2; ++j) {
            printf("%d\t", matrix[i][j]);
        }
        printf("\n");
    }

    // Traceback to find the aligned sequences
    int i = len1;
    int j = len2;
    printf("\nAligned Sequences:\n");
    while (i > 0 || j > 0) {
        if (i > 0 && j > 0 && matrix[i][j] == matrix[i - 1][j - 1] + ((seq1[i - 1] == seq2[j - 1]) ? MATCH_SCORE : MISMATCH_SCORE)) {
            printf("%c", seq1[i - 1]);
            i--;
            j--;
        } else if (i > 0 && matrix[i][j] == matrix[i - 1][j] + GAP_PENALTY) {
            printf("%c", seq1[i - 1]);
            i--;
        } else {
            printf("%c", seq2[j - 1]);
            j--;
        }
    }
    printf("\n");
}

int main() {
    char sequence1[] = "ACGTACGT";
    char sequence2[] = "ACGTGACGT";

    needlemanWunsch(sequence1, sequence2);

    return 0;
}