#include <stdio.h>

int substringSearch(char str[], char substr[]) {
    int i, j;

    for (i = 0; str[i] != '\0'; i++) {
        j = 0;
        while (substr[j] != '\0' && str[i + j] == substr[j]) {
            j++;
        }

        if (substr[j] == '\0') {
            return 1;  // Substring found
        }
    }

    return 0;  // Substring not found
}

int main() {
    char str[] = "wflh wlrhfglwerh flwehrf lwehflwehfilhwrflhw lrfhwefrhlewffwlherflwehfwl welfrhwlefrh wl";
    char substr[] = "werflhuwerlfg welrgh welhg lwehglwethglwwt;gn";
    if (substringSearch(str, substr)) {
        printf("Substring found.\n");
    } else {
        printf("Substring not found.\n");
    }

    return 0;
}