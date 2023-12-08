#include <stdio.h>
#include <string.h>

#define MAX_SEQ_LENGTH 100
#define NUM_SEQUENCES 5

// Function to generate the consensus sequence from a set of DNA sequences
void generateConsensus(char sequences[][MAX_SEQ_LENGTH], int numSequences) {
    int seqLength = strlen(sequences[0]);
    char consensus[seqLength + 1];

    // Initialize the consensus sequence with the first DNA sequence
    strcpy(consensus, sequences[0]);

    // Perform voting for each position in the sequences
    for (int i = 0; i < seqLength; ++i) {
        int counts[4] = {0}; // A, C, G, T

        // Count occurrences of each nucleotide at position i
        for (int j = 0; j < numSequences; ++j) {
            char nucleotide = sequences[j][i];
            switch (nucleotide) {
                case 'A':
                    counts[0]++;
                    break;
                case 'C':
                    counts[1]++;
                    break;
                case 'G':
                    counts[2]++;
                    break;
                case 'T':
                    counts[3]++;
                    break;
                // Handle other cases if necessary
            }
        }

        // Determine the most frequent nucleotide and update the consensus sequence
        char mostFrequent = 'A';
        for (int k = 1; k < 4; ++k) {
            if (counts[k] > counts[mostFrequent - 'A']) {
                mostFrequent = 'A' + k;
            }
        }

        consensus[i] = mostFrequent;
    }

    consensus[seqLength] = '\0'; // Null-terminate the consensus sequence

    // Print the consensus sequence
    printf("Consensus Sequence: %s\n", consensus);
}

int main() {
    char dnaSequences[NUM_SEQUENCES][MAX_SEQ_LENGTH] = {
        "ATGCTA",
        "ATGCTC",
        "ATGCTG",
        "ATGCTT",
        "ATGCTA"
    };

    generateConsensus(dnaSequences, NUM_SEQUENCES);

    return 0;
}