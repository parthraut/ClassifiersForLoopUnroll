#include <stdio.h>

int stringLength(char str[]) {
    int length = 0;
    for (int i = 0; str[i] != '\0'; i++) {
        length++;
    }
    return length;
}

int main() {
    char str[] = "erfghlweghlwehgelngtbengergt gerhgt ergther;gthu ergth ;ergth;erhg;erht ge;rtgh ;e";
    int length = stringLength(str);
    printf("Length of the string: %d\n", length);

    return 0;
}