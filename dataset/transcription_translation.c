#include <stdio.h>
#include <string.h>

#define MAX_SEQ_LENGTH 100

// Function to perform transcription (DNA to RNA)
void transcribe(char dnaSequence[], char rnaSequence[], int length) {
    for (int i = 0; i < length; ++i) {
        // Replace 'T' with 'U'
        rnaSequence[i] = (dnaSequence[i] == 'T') ? 'U' : dnaSequence[i];
    }

    rnaSequence[length] = '\0'; // Null-terminate the RNA sequence
}

// Function to perform translation (RNA to protein)
void translate(char rnaSequence[], char proteinSequence[], int length) {
    // Define the genetic code (codon table)
    const char codonTable[64][4] = {
        "UUU", "UUC", "UUA", "UUG", "CUU", "CUC", "CUA", "CUG",
        "AUU", "AUC", "AUA", "AUG", "GUU", "GUC", "GUA", "GUG",
        "UCU", "UCC", "UCA", "UCG", "CCU", "CCC", "CCA", "CCG",
        "ACU", "ACC", "ACA", "ACG", "GCU", "GCC", "GCA", "GCG",
        "UAU", "UAC", "UAA", "UAG", "CAU", "CAC", "CAA", "CAG",
        "AAU", "AAC", "AAA", "AAG", "GAU", "GAC", "GAA", "GAG",
        "UGU", "UGC", "UGA", "UGG", "CGU", "CGC", "CGA", "CGG",
        "AGU", "AGC", "AGA", "AGG", "GGU", "GGC", "GGA", "GGG"
    };

    for (int i = 0; i < length; i += 3) {
        // Extract the current codon from the RNA sequence
        char codon[4] = {rnaSequence[i], rnaSequence[i + 1], rnaSequence[i + 2], '\0'};

        // Find the corresponding amino acid or stop codon in the genetic code
        char aminoAcid = 'X'; // Default: unknown amino acid
        for (int j = 0; j < 64; ++j) {
            if (strcmp(codon, codonTable[j]) == 0) {
                if (j == 63) {
                    // Stop codon
                    aminoAcid = '*';
                } else {
                    aminoAcid = 'A' + (j % 4);
                }
                break;
            }
        }

        // Append the amino acid to the protein sequence
        proteinSequence[i / 3] = aminoAcid;
    }

    proteinSequence[length / 3] = '\0'; // Null-terminate the protein sequence
}

int main() {
    char dnaSequence[MAX_SEQ_LENGTH] = "ATGCTAGCTAATAGGTAG"; // Replace with your DNA sequence
    int sequenceLength = strlen(dnaSequence);

    char rnaSequence[MAX_SEQ_LENGTH];
    char proteinSequence[MAX_SEQ_LENGTH / 3];

    // Perform transcription (DNA to RNA)
    transcribe(dnaSequence, rnaSequence, sequenceLength);

    // Perform translation (RNA to protein)
    translate(rnaSequence, proteinSequence, sequenceLength);

    // Print the original DNA sequence, transcribed RNA sequence, and translated protein sequence
    printf("Original DNA Sequence: %s\n", dnaSequence);
    printf("Transcribed RNA Sequence: %s\n", rnaSequence);
    printf("Translated Protein Sequence: %s\n", proteinSequence);

    return 0;
}