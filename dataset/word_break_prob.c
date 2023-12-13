#include <stdio.h>
#include <string.h>

int dictionaryContains(char *word) {
    char *dictionary[] = {"mobile", "samsung", "sam", "sung", "man", "mango",
                          "icecream", "and", "go", "i", "like", "ice", "cream"};
    int n = sizeof(dictionary) / sizeof(dictionary[0]);

    for (int i = 0; i < n; i++)
        if (strcmp(dictionary[i], word) == 0)
            return 1;

    return 0;
}

int wordBreak(char *str) {
    int size = strlen(str);
    if (size == 0)
        return 1;

    int dp[size + 1];
    memset(dp, 0, sizeof(dp));

    for (int i = 1; i <= size; i++) {
        if (dp[i] == 0 && dictionaryContains(str + i)) {
            dp[i] = 1;
        }

        if (dp[i] == 1) {
            if (i == size)
                return 1;

            for (int j = i + 1; j <= size; j++) {
                if (dp[j] == 0 && dictionaryContains(str + j))
                    dp[j] = 1;

                if (j == size && dp[j] == 1)
                    return 1;
            }
        }
    }

    return 0;
}

int main() {
    if (wordBreak("ilikesamsung"))
        printf("Yes\n");
    else
        printf("No\n");

    return 0;
}