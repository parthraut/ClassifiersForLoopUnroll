#include <stdio.h>
#include <string.h>

#define MAX_SEQ_LENGTH 100

// Function to find the reverse complement of a DNA sequence
void reverseComplement(char sequence[], char reverseComp[], int length) {
    for (int i = 0; i < length; ++i) {
        switch (sequence[i]) {
            case 'A':
                reverseComp[length - i - 1] = 'T';
                break;
            case 'T':
                reverseComp[length - i - 1] = 'A';
                break;
            case 'C':
                reverseComp[length - i - 1] = 'G';
                break;
            case 'G':
                reverseComp[length - i - 1] = 'C';
                break;
            // Handle other cases if necessary
            default:
                reverseComp[length - i - 1] = sequence[i];
        }
    }

    reverseComp[length] = '\0'; // Null-terminate the reverse complement
}

int main() {
    char dnaSequence[MAX_SEQ_LENGTH] = "ATGCTA"; // Replace with your DNA sequence
    int sequenceLength = strlen(dnaSequence);

    char reverseComplementSequence[MAX_SEQ_LENGTH];

    // Find the reverse complement of the DNA sequence
    reverseComplement(dnaSequence, reverseComplementSequence, sequenceLength);

    // Print the original and reverse complement sequences
    printf("Original DNA Sequence: %s\n", dnaSequence);
    printf("Reverse Complement: %s\n", reverseComplementSequence);

    return 0;
}