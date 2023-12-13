#include <stdio.h>

int isPalindrome(char str[]) {
    int length;
    for (length = 0; str[length] != '\0'; length++);

    for (int i = 0, j = length - 1; i < j; i++, j--) {
        if (str[i] != str[j]) {
            return 0;  // Not a palindrome
        }
    }
    return 1;  // Palindrome
}

int main() {
    char str[] = "aflwelrfh welrfhwleufrhwlefrh lwefrh wlefrhg lwefrhglwehrfwehflwehfrl";
    if (isPalindrome(str)) {
        printf("String is a palindrome.\n");
    } else {
        printf("String is not a palindrome.\n");
    }

    return 0;
}