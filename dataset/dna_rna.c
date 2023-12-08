#include <stdio.h>
#include <string.h>

// Function to translate DNA/RNA sequence to protein sequence
void translateSequence(char sequence[]) {
    int length = strlen(sequence);

    // Define codons and their corresponding amino acids
    char codons[64][4] = {"TTT", "TTC", "TTA", "TTG", "CTT", "CTC", "CTA", "CTG",
                          "ATT", "ATC", "ATA", "ATG", "GTT", "GTC", "GTA", "GTG",
                          "TCT", "TCC", "TCA", "TCG", "CCT", "CCC", "CCA", "CCG",
                          "ACT", "ACC", "ACA", "ACG", "GCT", "GCC", "GCA", "GCG",
                          "TAT", "TAC", "TAA", "TAG", "CAT", "CAC", "CAA", "CAG",
                          "AAT", "AAC", "AAA", "AAG", "GAT", "GAC", "GAA", "GAG",
                          "TGT", "TGC", "TGA", "TGG", "CGT", "CGC", "CGA", "CGG",
                          "AGT", "AGC", "AGA", "AGG", "GGT", "GGC", "GGA", "GGG"};

    char aminoAcids[64] = {'F', 'F', 'L', 'L', 'L', 'L', 'L', 'L',
                           'I', 'I', 'I', 'M', 'V', 'V', 'V', 'V',
                           'S', 'S', 'S', 'S', 'P', 'P', 'P', 'P',
                           'T', 'T', 'T', 'T', 'A', 'A', 'A', 'A',
                           'Y', 'Y', 'X', 'X', 'H', 'H', 'Q', 'Q',
                           'N', 'N', 'K', 'K', 'D', 'D', 'E', 'E',
                           'C', 'C', 'X', 'W', 'R', 'R', 'R', 'R',
                           'S', 'S', 'R', 'R', 'G', 'G', 'G', 'G'};

    printf("Protein Sequence: ");
    for (int i = 0; i < length; i += 3) {
        char codon[4];
        strncpy(codon, &sequence[i], 3);
        codon[3] = '\0'; // Null-terminate the codon

        for (int j = 0; j < 64; ++j) {
            if (strcmp(codon, codons[j]) == 0) {
                printf("%c", aminoAcids[j]);
                break;
            }
        }
    }
    printf("\n");
}

int main() {
    char dnaSequence[] = "ATGGTCCCTAAATTGTTGTTAGATTGTGTTGTGTGGAGAGTGAGTGAGATGATGATGAGTGATGTAGAGGTAGAATGGTCCCTAAATTGTTGTTAGATTGTGTTGTGTGGAGAGTGAGTGAGATGATGATGAGTGATGTAGAGGTAGAATGGTCCCTAAATTGTTGTTAGATTGTGTTGTGTGGAGAGTGAGTGAGATGATGATGAGTGATGTAGAGGTAGAATGGTCCCTAAATTGTTGTTAGATTGTGTTGTGTGGAGAGTGAGTGAGATGATGATGAGTGATGTAGAGGTAGAATGGTCCCTAAATTGTTGTTAGATTGTGTTGTGTGGAGAGTGAGTGAGATGATGATGAGTGATGTAGAGGTAGAATGGTCCCTAAATTGTTGTTAGATTGTGTTGTGTGGAGAGTGAGTGAGATGATGATGAGTGATGTAGAGGTAGAATGGTCCCTAAATTGTTGTTAGATTGTGTTGTGTGGAGAGTGAGTGAGATGATGATGAGTGATGTAGAGGTAGAATGGTCCCTAAATTGTTGTTAGATTGTGTTGTGTGGAGAGTGAGTGAGATGATGATGAGTGATGTAGAGGTAGAATGGTCCCTAAATTGTTGTTAGATTGTGTTGTGTGGAGAGTGAGTGAGATGATGATGAGTGATGTAGAGGTAGAATGGTCCCTAAATTGTTGTTAGATTGTGTTGTGTGGAGAGTGAGTGAGATGATGATGAGTGATGTAGAGGTAGAATGGTCCCTAAATTGTTGTTAGATTGTGTTGTGTGGAGAGTGAGTGAGATGATGATGAGTGATGTAGAGGTAGAATGGTCCCTAAATTGTTGTTAGATTGTGTTGTGTGGAGAGTGAGTGAGATGATGATGAGTGATGTAGAGGTAGAATGGTCCCTAAATTGTTGTTAGATTGTGTTGTGTGGAGAGTGAGTGAGATGATGATGAGTGATGTAGAGGTAGAATGGTCCCTAAATTGTTGTTAGATTGTGTTGTGTGGAGAGTGAGTGAGATGATGATGAGTGATGTAGAGGTAGAATGGTCCCTAAATTGTTGTTAGATTGTGTTGTGTGGAGAGTGAGTGAGATGATGATGAGTGATGTAGAGGTAGAATGGTCCCTAAATTGTTGTTAGATTGTGTTGTGTGGAGAGTGAGTGAGATGATGATGAGTGATGTAGAGGTAGA";
    translateSequence(dnaSequence);

    return 0;
}