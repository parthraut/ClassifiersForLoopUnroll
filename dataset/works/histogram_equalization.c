#include <stdio.h>

#define height 100000
#define width 100000

int main() {
    // Assuming image is a 2D array representing pixel values
    int image[height][width];
    int histogram[256] = {0};

    // Calculate histogram
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            histogram[image[i][j]]++;
        }
    }

    // Perform histogram equalization
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            int sum = 0;
            for (int k = 0; k <= image[i][j]; k++) {
                sum += histogram[k];
            }
            image[i][j] = (sum * 255) / (height * width);
        }
    }

    // Code for saving the equalized image goes here

    return 0;
}