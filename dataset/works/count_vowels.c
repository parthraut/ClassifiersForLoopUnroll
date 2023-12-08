#include <stdio.h>

void countVowelsConsonants(char str[]) {
    int vowels = 0, consonants = 0;

    for (int i = 0; str[i] != '\0'; i++) {
        if (isalpha(str[i])) {
            switch (tolower(str[i])) {
                case 'a':
                case 'e':
                case 'i':
                case 'o':
                case 'u':
                    vowels++;
                    break;
                default:
                    consonants++;
            }
        }
    }

    printf("Vowels: %d\nConsonants: %d\n", vowels, consonants);
}

int main() {
    char str[] = "ALWEFgh wilerfh lweirghuf wlehrgf lhegfihuw weelhlweurfgh lwehfrlwe hrfliwehrg lwefhlwefrhlwehrfl wefr";
    countVowelsConsonants(str);

    return 0;
}