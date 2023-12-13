#include <stdio.h>
#include <limits.h>

int max(int a, int b) {
    return (a > b) ? a : b;
}

int maxSubArraySum(int arr[], int n) {
    int max_so_far = INT_MIN, max_ending_here = 0;

    for (int i = 0; i < n; i++) {
        max_ending_here = max_ending_here + arr[i];
        if (max_so_far < max_ending_here)
            max_so_far = max_ending_here;
        if (max_ending_here < 0)
            max_ending_here = 0;
    }

    return max_so_far;
}

int main() {
    int n = 100000;
    int arr[n];
    for (int i = 0; i < n; i++) {
        if (i % 2 == 0) {
            arr[i] = rand() % n;
        } else {
            arr[i] = -1 * (rand() % n);
        }
        
    }
    // int arr[] = {-2, -3, 4, -1, -2, 1, 5, -3};
    // int n = sizeof(arr) / sizeof(arr[0]);
    printf("Maximum Subarray Sum is %d\n", maxSubArraySum(arr, n));

    return 0;
}