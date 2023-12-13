#include <stdio.h>

#define height 100000
#define width 100000

int main() {
    // Assuming image is a 2D array representing pixel values
    int image[height][width];
    int filtered_image[height][width];

    for (int i = 1; i < height - 1; i++) {
        for (int j = 1; j < width - 1; j++) {
            // Median filtering logic
            int values[9] = {
                image[i - 1][j - 1], image[i - 1][j], image[i - 1][j + 1],
                image[i][j - 1], image[i][j], image[i][j + 1],
                image[i + 1][j - 1], image[i + 1][j], image[i + 1][j + 1]
            };

            // Sort values
            for (int k = 0; k < 9; k++) {
                for (int l = k + 1; l < 9; l++) {
                    if (values[k] > values[l]) {
                        int temp = values[k];
                        values[k] = values[l];
                        values[l] = temp;
                    }
                }
            }

            filtered_image[i][j] = values[4]; // Median value
        }
    }

    // Code for saving the filtered image goes here

    return 0;
}