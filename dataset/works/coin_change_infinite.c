#include <stdio.h>

int countWays(int coins[], int m, int n) {
    int dp[n + 1];
    memset(dp, 0, sizeof(dp));

    dp[0] = 1;

    for (int i = 0; i < m; i++)
        for (int j = coins[i]; j <= n; j++)
            dp[j] += dp[j - coins[i]];

    return dp[n];
}

int main() {
    int m = 100000;
    int coins[m];
    for (int i = 0; i < m; i++) {
        coins[i] = rand() % m;
    }
    int n = 12;
    printf("Number of ways to make change = %d\n", countWays(coins, m, n));

    return 0;
}