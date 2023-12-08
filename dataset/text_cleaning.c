#include <stdio.h>
#include <string.h>
#include <ctype.h>

int main() {
    char text[] = "NLP is, a. popular field!";

    for (int i = 0; text[i]; i++) {
        if (isalpha(text[i]) || isspace(text[i])) {
            printf("%c", tolower(text[i]));
        }
    }

    return 0;
}