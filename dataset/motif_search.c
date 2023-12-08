#include <stdio.h>
#include <string.h>

#define MAX_SEQ_LENGTH 100

// Function to search for a motif in a DNA sequence
void searchMotif(char dnaSequence[], char motif[], int seqLength, int motifLength) {
    printf("DNA Sequence: %s\n", dnaSequence);
    printf("Motif to Search: %s\n", motif);

    for (int i = 0; i <= seqLength - motifLength; ++i) {
        // Check if the current substring matches the motif
        int match = 1;
        for (int j = 0; j < motifLength; ++j) {
            if (dnaSequence[i + j] != motif[j]) {
                match = 0;
                break;
            }
        }

        // If a match is found, print the position
        if (match) {
            printf("Motif found at position %d\n", i + 1);
        }
    }
}

int main() {
    char dnaSequence[MAX_SEQ_LENGTH] = "ATGCTAGCTAATAGGTAG"; // Replace with your DNA sequence
    char motif[MAX_SEQ_LENGTH] = "TAG"; // Replace with your motif
    int seqLength = strlen(dnaSequence);
    int motifLength = strlen(motif);

    // Perform DNA sequence motif search
    searchMotif(dnaSequence, motif, seqLength, motifLength);

    return 0;
}