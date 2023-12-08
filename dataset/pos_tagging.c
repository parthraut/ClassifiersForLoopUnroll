#include <stdio.h>
#include <string.h>

int main() {
    char text[] = "Natural Language Processing is powerful.";

    // This is a simplified example; a real implementation would use a library.
    // Assume the part-of-speech tags are provided externally.
    char posTags[] = "NNP NNP NNP VBZ JJ.";

    char *token = strtok(text, " ");
    char *posToken = strtok(posTags, " ");

    while (token != NULL) {
        printf("%s (%s)\n", token, posToken);
        token = strtok(NULL, " ");
        posToken = strtok(NULL, " ");
    }

    return 0;
}