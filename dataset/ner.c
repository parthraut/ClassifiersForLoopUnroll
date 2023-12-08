#include <stdio.h>
#include <string.h>

int main() {
    char text[] = "Apple Inc. is a technology company.";

    // This is a simplified example; a real implementation would use a library.
    // Assume the named entities are provided externally.
    char entities[] = "B-ORG I-ORG O O O O O O O O";

    char *token = strtok(text, " ");
    char *entityToken = strtok(entities, " ");

    while (token != NULL) {
        printf("%s (%s)\n", token, entityToken);
        token = strtok(NULL, " ");
        entityToken = strtok(NULL, " ");
    }

    return 0;
}