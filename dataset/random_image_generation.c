#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    srand(time(NULL));

    int width = 800;
    int height = 600;

    // Assuming image is a 2D array representing pixel values
    int image[height][width];

    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            image[i][j] = rand() % 256; // Random pixel value between 0 and 255
        }
    }

    // Code for saving the random image goes here

    return 0;
}