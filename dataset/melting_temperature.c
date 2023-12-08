#include <stdio.h>
#include <string.h>

#define MAX_SEQ_LENGTH 100

// Function to calculate the melting temperature (Tm) of a DNA sequence
double calculateMeltingTemperature(char dnaSequence[]) {
    int seqLength = strlen(dnaSequence);

    // Constants for the calculation
    const int A_COUNT = 'A';
    const int C_COUNT = 'C';
    const int G_COUNT = 'G';
    const int T_COUNT = 'T';
    const double NA_CONCENTRATION = 0.1; // Sodium ion concentration (mol/L)

    // Count occurrences of each nucleotide
    int aCount = 0, cCount = 0, gCount = 0, tCount = 0;
    for (int i = 0; i < seqLength; ++i) {
        switch (dnaSequence[i]) {
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

    // Calculate the melting temperature (Tm) using the Nearest-Neighbor method
    double tm = 2 * (aCount + tCount) + 4 * (gCount + cCount);
    tm += 0.1 * (seqLength - 1) * log10(NA_CONCENTRATION);

    return tm;
}

int main() {
    char dnaSequence[MAX_SEQ_LENGTH] = "ATGCTAGCTAATAGGTAG"; // Replace with your DNA sequence

    // Calculate the melting temperature (Tm) of the DNA sequence
    double meltingTemperature = calculateMeltingTemperature(dnaSequence);

    printf("DNA Sequence: %s\n", dnaSequence);
    printf("Melting Temperature (Tm): %.2f °C\n", meltingTemperature);

    return 0;
}