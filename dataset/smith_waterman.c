#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAX_SEQ_LENGTH 1000

int max(int a, int b, int c) {
    int max_val = (a > b) ? a : b;
    return (max_val > c) ? max_val : c;
}

void smithWaterman(char seq1[], char seq2[]) {
    int len1 = strlen(seq1);
    int len2 = strlen(seq2);

    int matrix[len1 + 1][len2 + 1];

    for (int i = 0; i <= len1; ++i) {
        for (int j = 0; j <= len2; ++j) {
            if (i == 0 || j == 0)
                matrix[i][j] = 0;
            else if (seq1[i - 1] == seq2[j - 1])
                matrix[i][j] = matrix[i - 1][j - 1] + 1;
            else
                matrix[i][j] = max(matrix[i - 1][j], matrix[i][j - 1], matrix[i - 1][j - 1]);
        }
    }

    // Print the alignment matrix
    for (int i = 0; i <= len1; ++i) {
        for (int j = 0; j <= len2; ++j) {
            printf("%d\t", matrix[i][j]);
        }
        printf("\n");
    }
}

int main() {
    char sequence1[MAX_SEQ_LENGTH];
    char sequence2[MAX_SEQ_LENGTH];

    const char charset[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    int charsetLength = sizeof(charset) - 1;

    for (int i = 0; i < MAX_SEQ_LENGTH; ++i) {
        int index1 = rand() % charsetLength;
        int index2 = rand() % charsetLength;
        sequence1[i] = charset[index1];
        sequence2[i] = charset[index2];
    }

    sequence1[MAX_SEQ_LENGTH-1] = '\0'; // Null-terminate the string
    sequence2[MAX_SEQ_LENGTH-1] = '\0'; // Null-terminate the string

    // printf("Enter Sequence 1: ");
    // scanf("%s", sequence1);

    // printf("Enter Sequence 2: ");
    // scanf("%s", sequence2);

    smithWaterman(sequence1, sequence2);

    return 0;
}