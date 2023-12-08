#include <stdio.h>
#include <math.h>
#include <complex.h>

#define N 100000

void fft(complex double x[], int n) {
    if (n <= 1) {
        return;
    }

    // Divide
    complex double even[n / 2];
    complex double odd[n / 2];
    for (int i = 0; i < n / 2; i++) {
        even[i] = x[i * 2];
        odd[i] = x[i * 2 + 1];
    }

    // Recur
    fft(even, n / 2);
    fft(odd, n / 2);

    // Combine
    for (int i = 0; i < n / 2; i++) {
        complex double t = cexp(-2.0 * I * 3.14159 * i / n) * odd[i];
        x[i] = even[i] + t;
        x[i + n / 2] = even[i] - t;
    }
}

int main() {
    complex double x[N];

    for (int i = 0; i < N; i++) {
        x[i] = rand() % N;
    }

    fft(x, N);

    // Display FFT result
    printf("FFT Result:\n");
    for (int i = 0; i < N; i++) {
        printf("%.2f + %.2fi\n", creal(x[i]), cimag(x[i]));
    }

    return 0;
}