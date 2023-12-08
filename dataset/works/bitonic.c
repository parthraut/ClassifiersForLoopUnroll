#include <stdio.h>
#include <stdlib.h>

int lbs(int arr[], int n) {
    int *lis = (int *)malloc(n * sizeof(int));
    for (int i = 0; i < n; i++)
        lis[i] = 1;

    for (int i = 1; i < n; i++)
        for (int j = 0; j < i; j++)
            if (arr[i] > arr[j] && lis[i] < lis[j] + 1)
                lis[i] = lis[j] + 1;

    int *lds = (int *)malloc(n * sizeof(int));
    for (int i = 0; i < n; i++)
        lds[i] = 1;

    for (int i = n - 2; i >= 0; i--)
        for (int j = n - 1; j > i; j--)
            if (arr[i] > arr[j] && lds[i] < lds[j] + 1)
                lds[i] = lds[j] + 1;

    int max = lis[0] + lds[0] - 1;
    for (int i = 1; i < n; i++)
        if (lis[i] + lds[i] - 1 > max)
            max = lis[i] + lds[i] - 1;

    free(lis);
    free(lds);
    return max;
}

int main() {
    int n = 100000;
    int arr[n];
    for (int i = 0; i < n; i++) {
        arr[i] = rand() % n;
    }
    // int arr[] = {1, 11, 2, 10, 4, 5, 2, 1};
    // int n = sizeof(arr) / sizeof(arr[0]);
    printf("Length of Longest Bitonic Subsequence is %d\n", lbs(arr, n));

    return 0;
}