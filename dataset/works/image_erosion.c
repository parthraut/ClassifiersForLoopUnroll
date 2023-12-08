#include <stdio.h>

#define height 100000
#define width 100000

int main() {
    // Assuming image is a 2D array representing binary pixel values (0 or 255)
    int image[height][width];
    int eroded_image[height][width];

    for (int i = 1; i < height - 1; i++) {
        for (int j = 1; j < width - 1; j++) {
            // Erosion logic
            if (image[i][j] == 255 &&
                image[i - 1][j] == 255 && image[i + 1][j] == 255 &&
                image[i][j - 1] == 255 && image[i][j + 1] == 255) {
                eroded_image[i][j] = 255;
            } else {
                eroded_image[i][j] = 0;
            }
        }
    }

    // Code for saving the eroded image goes here

    return 0;
}