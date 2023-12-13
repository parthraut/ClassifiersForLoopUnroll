#include <stdio.h>

#define height 100000
#define width 100000

int main() {
    // Assuming image is a 2D array representing pixel values
    int image[height][width];
    int scale_factor = 2; // Adjust this value as needed

    int scaled_image[height * scale_factor][width * scale_factor];

    for (int i = 0; i < height * scale_factor; i++) {
        for (int j = 0; j < width * scale_factor; j++) {
            scaled_image[i][j] = image[i / scale_factor][j / scale_factor];
        }
    }

    // Code for saving the scaled image goes here

    return 0;
}