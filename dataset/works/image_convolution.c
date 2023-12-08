#include <stdio.h>

#define ROWS 3
#define COLS 3

void convolution(int image[5][5], int kernel[ROWS][COLS], int result[5][5]) {
    for (int i = 1; i < 4; i++) {
        for (int j = 1; j < 4; j++) {
            int sum = 0;
            for (int k = -1; k <= 1; k++) {
                for (int l = -1; l <= 1; l++) {
                    sum += image[i + k][j + l] * kernel[k + 1][l + 1];
                }
            }
            result[i - 1][j - 1] = sum;
        }
    }
}

int main() {
    int image[5][5] = {{1, 2, 3, 4, 5},
                       {6, 7, 8, 9, 10},
                       {11, 12, 13, 14, 15},
                       {16, 17, 18, 19, 20},
                       {21, 22, 23, 24, 25}};

    int kernel[ROWS][COLS] = {{-1, -1, -1},
                              {-1,  8, -1},
                              {-1, -1, -1}};

    int result[5][5];

    convolution(image, kernel, result);

    // Print or use the result matrix

    return 0;
}