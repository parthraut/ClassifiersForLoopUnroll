#include <stdio.h>

#define height 100000
#define width 100000

int main() {
    // Assuming image is a 2D array representing pixel values
    int image[height][width];

    int rotated_image[width][height];

    for (int i = 0; i < width; i++) {
        for (int j = 0; j < height; j++) {
            rotated_image[i][j] = image[height - 1 - j][i];
        }
    }

    // Code for saving the rotated image goes here

    return 0;
}