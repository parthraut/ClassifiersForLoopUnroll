#include <stdio.h>
#include <string.h>

#define MAX_SEQ_LENGTH 100
#define NUM_SEQUENCES 5

// Function to generate a DNA profile from multiple DNA sequences
void generateDNAProfile(char sequences[][MAX_SEQ_LENGTH], int numSequences, int seqLength) {
    printf("DNA Sequences:\n");

    // Print the original DNA sequences
    for (int i = 0; i < numSequences; ++i) {
        printf("%s\n", sequences[i]);
    }

    printf("\nDNA Profile:\n");

    // Initialize counters for each nucleotide
    int aCount = 0, cCount = 0, gCount = 0, tCount = 0;

    // Count nucleotide occurrences at each position
    for (int i = 0; i < seqLength; ++i) {
        for (int j = 0; j < numSequences; ++j) {
            switch (sequences[j][i]) {
                case 'A':
                    aCount++;
                    break;
                case 'C':
                    cCount++;
                    break;
                case 'G':
                    gCount++;
                    break;
                case 'T':
                    tCount++;
                    break;
                // Handle other cases if necessary
            }
        }

        // Print nucleotide counts at the current position
        printf("Position %d: A=%d, C=%d, G=%d, T=%d\n", i + 1, aCount, cCount, gCount, tCount);

        // Reset counters for the next position
        aCount = 0;
        cCount = 0;
        gCount = 0;
        tCount = 0;
    }
}

int main() {
    char dnaSequences[NUM_SEQUENCES][MAX_SEQ_LENGTH] = {
        "ATGCTA",
        "ATGCTC",
        "ATGCTG",
        "ATGCTT",
        "ATGCTA"
    };

    int sequenceLength = strlen(dnaSequences[0]);

    // Generate DNA profile from multiple DNA sequences
    generateDNAProfile(dnaSequences, NUM_SEQUENCES, sequenceLength);

    return 0;
}