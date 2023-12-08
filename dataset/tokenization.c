#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

int main() {
    char text[] = "Natural Language Processing is fascinating!";
    char *token = strtok(text, " ");
    int wordCount = 0;

    while (token != NULL) {
        wordCount++;
        token = strtok(NULL, " ");
    }

    printf("Word Count: %d\n", wordCount);

    return 0;
}