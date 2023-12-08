#include <stdio.h>

#define LEARNING_RATE 0.01
#define ITERATIONS 1000

float compute_cost(float m, float b, float x[], float y[], int n) {
    float total_cost = 0;
    for (int i = 0; i < n; i++) {
        float prediction = m * x[i] + b;
        total_cost += (prediction - y[i]) * (prediction - y[i]);
    }
    return total_cost / (2 * n);
}

void gradient_descent(float x[], float y[], int n, float *m, float *b) {
    for (int iteration = 0; iteration < ITERATIONS; iteration++) {
        float m_gradient = 0, b_gradient = 0;

        for (int i = 0; i < n; i++) {
            float prediction = *m * x[i] + *b;
            m_gradient += x[i] * (prediction - y[i]);
            b_gradient += prediction - y[i];
        }

        *m -= (LEARNING_RATE * m_gradient) / n;
        *b -= (LEARNING_RATE * b_gradient) / n;

        if (iteration % 100 == 0) {
            printf("Iteration %d, Cost: %f\n", iteration, compute_cost(*m, *b, x, y, n));
        }
    }
}

int main() {
    int n = 100000;
    float x[n];
    float y[n];
    for (int i = 0; i < n; i++) {
        x[i] = rand() % n;
        y[i] = rand() % n;
    }
    // int n = sizeof(x) / sizeof(x[0]);

    float slope = 0, intercept = 0;
    gradient_descent(x, y, n, &slope, &intercept);

    printf("Final slope: %f, Final intercept: %f\n", slope, intercept);

    return 0;
}