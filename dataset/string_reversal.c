#include <stdio.h>

void stringReverse(char str[]) {
    int length;
    for (length = 0; str[length] != '\0'; length++);

    for (int i = 0, j = length - 1; i < j; i++, j--) {
        char temp = str[i];
        str[i] = str[j];
        str[j] = temp;
    }
}

int main() {
    char str[] = ",dfgwelfrg wlfrgwelrf wlefrygwlerfg wlerygflwerfgy lwerg";
    stringReverse(str);
    printf("Reversed string: %s\n", str);

    return 0;
}