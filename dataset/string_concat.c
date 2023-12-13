#include <stdio.h>

void stringConcat(char dest[], char src[]) {
    int i, j;
    for (i = 0; dest[i] != '\0'; i++);

    for (j = 0; src[j] != '\0'; j++) {
        dest[i + j] = src[j];
    }
    dest[i + j] = '\0';
}

int main() {
    char str1[100] = "wlerhflwurflwefr";
    char str2[] = "wlerhflwurflwefr";
    stringConcat(str1, str2);
    printf("Concatenated string: %s\n", str1);

    return 0;
}