#include <stdio.h>

#define height 100000
#define width 100000

int main() {
    // Assuming image is a 2D array representing pixel values
    int image[height][width];
    int threshold = 128; // Adjust this value as needed

    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            image[i][j] = (image[i][j] < threshold) ? 0 : 255;
        }
    }

    // Code for saving the thresholded image goes here

    return 0;
}