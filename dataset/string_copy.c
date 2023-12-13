#include <stdio.h>

void stringCopy(char dest[], char src[]) {
    int i;
    for (i = 0; src[i] != '\0'; i++) {
        dest[i] = src[i];
    }
    dest[i] = '\0';
}

int main() {
    char source[] = "sfrglusgh leghle rtghlwe rtgh;wrhfglwe gwgh wl;gh w;gh uwg hw;gh woul;egh ;wehg leuwthg";
    char destination[20];
    stringCopy(destination, source);
    printf("Copied string: %s\n", destination);

    return 0;
}