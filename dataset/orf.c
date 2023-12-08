#include <stdio.h>
#include <string.h>

#define MAX_SEQ_LENGTH 100

// Function to find open reading frames (ORFs) in a DNA sequence
void findORFs(char sequence[], int length) {
    int start = -1;
    int end = -1;

    printf("Open Reading Frames (ORFs):\n");

    for (int i = 0; i < length; ++i) {
        if (sequence[i] == 'A' && sequence[i + 1] == 'T' && sequence[i + 2] == 'G') {
            // Start codon (ATG) found
            start = i;
        } else if ((sequence[i] == 'T' && sequence[i + 1] == 'A' && sequence[i + 2] == 'A') ||
                   (sequence[i] == 'T' && sequence[i + 1] == 'A' && sequence[i + 2] == 'G') ||
                   (sequence[i] == 'T' && sequence[i + 1] == 'G' && sequence[i + 2] == 'A')) {
            // Stop codon (TAA, TAG, or TGA) found
            end = i + 2;

            // Print the ORF
            if (start != -1 && end != -1) {
                for (int j = start; j <= end; ++j) {
                    printf("%c", sequence[j]);
                }
                printf("\n");

                // Reset start and end positions
                start = -1;
                end = -1;
            }
        }
    }
}

int main() {
    char dnaSequence[MAX_SEQ_LENGTH] = "ATGCTAGCTAATAGGTAG"; // Replace with your DNA sequence
    int sequenceLength = strlen(dnaSequence);

    // Find open reading frames (ORFs) in the DNA sequence
    findORFs(dnaSequence, sequenceLength);

    return 0;
}