#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAX_SEQ_LENGTH 100

// Function to generate a random DNA sequence
void generateRandomSequence(char sequence[], int length) {
    for (int i = 0; i < length; ++i) {
        // Generate a random number (0 to 3) to represent A, C, G, or T
        int randomNucleotide = rand() % 4;

        // Assign the corresponding nucleotide to the sequence
        switch (randomNucleotide) {
            case 0:
                sequence[i] = 'A';
                break;
            case 1:
                sequence[i] = 'C';
                break;
            case 2:
                sequence[i] = 'G';
                break;
            case 3:
                sequence[i] = 'T';
                break;
        }
    }

    sequence[length] = '\0'; // Null-terminate the sequence
}

int main() {
    srand((unsigned int)time(NULL)); // Seed for random number generation

    int sequenceLength = 10; // Adjust the length as needed
    char randomSequence[MAX_SEQ_LENGTH];

    // Generate a random DNA sequence
    generateRandomSequence(randomSequence, sequenceLength);

    // Print the generated sequence
    printf("Random DNA Sequence: %s\n", randomSequence);

    return 0;
}