#include <stdio.h>

int max(int a, int b) {
    return (a > b) ? a : b;
}

int cutRod(int price[], int n) {
    int val[n + 1];
    val[0] = 0;

    for (int i = 1; i <= n; i++) {
        int max_val = -1;
        for (int j = 0; j < i; j++)
            max_val = max(max_val, price[j] + val[i - j - 1]);
        val[i] = max_val;
    }

    return val[n];
}

int main() {
    int n = 100000;
    int price[n];
    for (int i = 0; i < n; i++) {
        price[i] = rand() % n;
    }
    // int n = sizeof(price) / sizeof(price[0]);
    printf("Maximum Obtainable Value is %d\n", cutRod(price, n));

    return 0;
}