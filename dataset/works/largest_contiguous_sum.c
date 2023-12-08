#include <stdio.h>

int max(int a, int b) {
    return (a > b) ? a : b;
}

int lis(int arr[], int n) {
    int lis[n];
    for (int i = 0; i < n; i++) {
        lis[i] = arr[i];
        for (int j = 0; j < i; j++)
            if (arr[i] > arr[j] && lis[i] < lis[j] + arr[i])
                lis[i] = lis[j] + arr[i];
    }

    int maxSum = 0;
    for (int i = 0; i < n; i++)
        maxSum = max(maxSum, lis[i]);

    return maxSum;
}

int main() {
    int n = 100000;
    int arr[n];
    for (int i = 0; i < n; i++) {
        arr[i] = rand() % n;
    }

    printf("Largest Sum Contiguous Increasing Subarray is %d\n", lis(arr, n));

    return 0;
}