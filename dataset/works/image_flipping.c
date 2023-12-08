#include <stdio.h>

#define height 100000
#define width 100000

int main() {
    // Assuming image is a 2D array representing pixel values
    int image[height][width];

    int flipped_image[height][width];

    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            flipped_image[i][j] = image[i][width - 1 - j];
        }
    }

    // Code for saving the flipped image goes here

    return 0;
}