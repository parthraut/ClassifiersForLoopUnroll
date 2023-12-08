#include <stdio.h>

#define N 100000

void sieve_of_eratosthenes() {
    int is_prime[N + 1];
    for (int i = 2; i <= N; i++) {
        is_prime[i] = 1;
    }

    for (int p = 2; p * p <= N; p++) {
        if (is_prime[p]) {
            for (int i = p * p; i <= N; i += p) {
                is_prime[i] = 0;
            }
        }
    }

    // Display prime numbers
    printf("Prime numbers up to %d: ", N);
    for (int i = 2; i <= N; i++) {
        if (is_prime[i]) {
            printf("%d ", i);
        }
    }
    printf("\n");
}

int main() {
    sieve_of_eratosthenes();
    return 0;
}