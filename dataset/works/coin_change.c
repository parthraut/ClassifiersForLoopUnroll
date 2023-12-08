#include <stdio.h>

int countWays(int coins[], int m, int n) {
    int table[n + 1];
    table[0] = 1;

    for (int i = 0; i < m; i++)
        for (int j = coins[i]; j <= n; j++)
            table[j] += table[j - coins[i]];

    return table[n];
}

int main() {
    int n = 100000;
    int coins[n];

    for (int i = 0; i < n; i++) {
        coins[i] = i;
    }

    int m = sizeof(coins) / sizeof(coins[0]);
    n = 12;
    printf("Number of ways to make change = %d\n", countWays(coins, m, n));

    return 0;
}