#include <stdio.h>
#include <limits.h>

int max(int a, int b) {
    return (a > b) ? a : b;
}

int eggDrop(int eggs, int floors) {
    int dp[eggs + 1][floors + 1];

    for (int i = 1; i <= eggs; i++) {
        dp[i][0] = 0;
        dp[i][1] = 1;
    }

    for (int j = 1; j <= floors; j++)
        dp[1][j] = j;

    for (int i = 2; i <= eggs; i++) {
        for (int j = 2; j <= floors; j++) {
            dp[i][j] = INT_MAX;
            for (int x = 1; x <= j; x++)
                dp[i][j] = fmin(dp[i][j], 1 + max(dp[i - 1][x - 1], dp[i][j - x]));
        }
    }

    return dp[eggs][floors];
}

int main() {
    int eggs = 2000, floors = 10000;
    printf("Minimum number of trials in worst case: %d\n", eggDrop(eggs, floors));

    return 0;
}