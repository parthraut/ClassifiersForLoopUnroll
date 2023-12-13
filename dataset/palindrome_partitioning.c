#include <stdio.h>
#include <limits.h>
#include <string.h>

int min(int a, int b) {
    return (a < b) ? a : b;
}

int isPalindrome(char str[], int i, int j) {
    while (i < j) {
        if (str[i] != str[j])
            return 0; // Not a palindrome
        i++;
        j--;
    }
    return 1; // Palindrome
}

int minPalPartition(char str[], int n) {
    int dp[n][n];
    memset(dp, 0, sizeof(dp));

    for (int cl = 2; cl <= n; cl++) {
        for (int i = 0; i < n - cl + 1; i++) {
            int j = i + cl - 1;
            if (isPalindrome(str, i, j))
                dp[i][j] = 0;
            else {
                dp[i][j] = INT_MAX;
                for (int k = i; k < j; k++)
                    dp[i][j] = min(dp[i][j], dp[i][k] + dp[k + 1][j] + 1);
            }
        }
    }

    return dp[0][n - 1];
}

int main() {
    char str[] = "ldfhwflwherf lwehufrlwehufr lwehfrlwerhflwefhlwe rhflweh fleuwhflwehrfluwehf lwerfweulrfhlwhelwerfhu";
    int n = strlen(str);
    printf("Min cuts needed for Palindrome Partitioning: %d\n", minPalPartition(str, n));

    return 0;
}