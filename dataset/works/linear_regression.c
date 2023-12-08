#include <stdio.h>

float predict(float x, float slope, float intercept) {
    return slope * x + intercept;
}

int main() {
    int n = 100000;
    float x[n];
    float y[n];

    for (int i = 0; i < n; i++) {
        x[i] = rand() % n;
        y[i] = rand() % n;
    }
    // float x[] = {1, 2, 3, 4, 5};
    // float y[] = {2, 4, 5, 4, 5};

    // int n = sizeof(x) / sizeof(x[0]);

    // Calculate mean of x and y
    float mean_x = 0, mean_y = 0;
    for (int i = 0; i < n; i++) {
        mean_x += x[i];
        mean_y += y[i];
    }
    mean_x /= n;
    mean_y /= n;

    // Calculate slope (m) and y-intercept (b)
    float numerator = 0, denominator = 0;
    for (int i = 0; i < n; i++) {
        numerator += (x[i] - mean_x) * (y[i] - mean_y);
        denominator += (x[i] - mean_x) * (x[i] - mean_x);
    }
    float slope = numerator / denominator;
    float intercept = mean_y - slope * mean_x;

    // Predict for a new value of x
    float new_x = 6;
    float predicted_y = predict(new_x, slope, intercept);

    printf("Predicted value for x = %.2f: %.2f\n", new_x, predicted_y);

    return 0;
}