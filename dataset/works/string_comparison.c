#include <stdio.h>

int stringCompare(char str1[], char str2[]) {
    int i = 0;
    while (str1[i] != '\0' && str2[i] != '\0') {
        if (str1[i] != str2[i]) {
            return 0;  // Not equal
        }
        i++;
    }
    return str1[i] == str2[i];  // Check if both are null-terminated
}

int main() {
    char str1[] = "fslufghliserghlweglwr fgweulgh wleg";
    char str2[] = "fwegrkfwg efwkefrglf wegwfbwlefb wefb";
    if (stringCompare(str1, str2)) {
        printf("Strings are equal.\n");
    } else {
        printf("Strings are not equal.\n");
    }

    return 0;
}