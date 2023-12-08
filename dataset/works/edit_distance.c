#include <stdio.h>
#include <string.h>

int min(int x, int y, int z) {
    return (x < y) ? ((x < z) ? x : z) : ((y < z) ? y : z);
}

int editDistance(char str1[], char str2[]) {
    int m = strlen(str1);
    int n = strlen(str2);
    int dp[m + 1][n + 1];

    for (int i = 0; i <= m; i++) {
        for (int j = 0; j <= n; j++) {
            if (i == 0)
                dp[i][j] = j;
            else if (j == 0)
                dp[i][j] = i;
            else if (str1[i - 1] == str2[j - 1])
                dp[i][j] = dp[i - 1][j - 1];
            else
                dp[i][j] = 1 + min(dp[i][j - 1],      // Insert
                                   dp[i - 1][j],      // Remove
                                   dp[i - 1][j - 1]); // Replace
        }
    }

    return dp[m][n];
}

int main() {
    char str1[] = "slhdfgweh gleuhg lehtglehtg letg erlghwerfhlwfrwerfhwe";
    char str2[] = "wfghkwerg flwefblwe rf lwef kweihfg wklfgklwergfklwegf";
    printf("Edit Distance: %d\n", editDistance(str1, str2));

    return 0;
}