#include <stdio.h>

void toggleCase(char str[]) {
    for (int i = 0; str[i] != '\0'; i++) {
        if (isalpha(str[i])) {
            str[i] = isupper(str[i]) ? tolower(str[i]) : toupper(str[i]);
        }
    }
}

int main() {
    char str[] = "WLerhlwgehrt lWLH ELRHflE LH TLEWH FGhlswerfgjhe gtlehr tglLWJTHLE HT";
    toggleCase(str);
    printf("Toggled Case: %s\n", str);

    return 0;
}