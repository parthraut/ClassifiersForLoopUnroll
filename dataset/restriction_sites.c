#include <stdio.h>
#include <string.h>

#define MAX_SEQ_LENGTH 100

// Function to identify potential restriction sites in a DNA sequence
void identifyRestrictionSites(char dnaSequence[]) {
    printf("DNA Sequence: %s\n", dnaSequence);

    // Define a restriction site pattern (example: GANTC)
    const char* restrictionSitePattern = "GANTC";

    int seqLength = strlen(dnaSequence);
    int patternLength = strlen(restrictionSitePattern);

    printf("Potential Restriction Sites:\n");

    // Check for the restriction site pattern in the DNA sequence
    for (int i = 0; i <= seqLength - patternLength; ++i) {
        // Check if the current substring matches the restriction site pattern
        int match = 1;
        for (int j = 0; j < patternLength; ++j) {
            if (dnaSequence[i + j] != restrictionSitePattern[j]) {
                match = 0;
                break;
            }
        }

        // If a match is found, print the position
        if (match) {
            printf("Position %d: %s\n", i + 1, restrictionSitePattern);
        }
    }
}

int main() {
    char dnaSequence[MAX_SEQ_LENGTH] = "ATGCTAGCTAATAGGTAG"; // Replace with your DNA sequence

    // Identify potential restriction sites in the DNA sequence
    identifyRestrictionSites(dnaSequence);

    return 0;
}