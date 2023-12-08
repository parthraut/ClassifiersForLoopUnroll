#include <stdio.h>
#include <string.h>

int main() {
    char text[] = "I love Natural Language Processing!";

    // This is a simplified example; a real implementation would use a machine learning model.
    // Assume sentiment scores are provided externally.
    int sentimentScores[] = {4, 3, 2, 1, 5};

    char *token = strtok(text, " ");
    int i = 0;

    while (token != NULL) {
        printf("%s (%d)\n", token, sentimentScores[i]);
        token = strtok(NULL, " ");
        i++;
    }

    return 0;
}