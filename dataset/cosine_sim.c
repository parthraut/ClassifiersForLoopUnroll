#include <stdio.h>
#include <math.h>

double cosineSimilarity(int vector1[], int vector2[], int size) {
    double dotProduct = 0, magnitude1 = 0, magnitude2 = 0;

    for (int i = 0; i < size; i++) {
        dotProduct += vector1[i] * vector2[i];
        magnitude1 += vector1[i] * vector1[i];
        magnitude2 += vector2[i] * vector2[i];
    }

    return dotProduct / (sqrt(magnitude1) * sqrt(magnitude2));
}

int main() {
    int vector1[] = {1, 2, 3, 4, 5};
    int vector2[] = {2, 3, 4, 5, 6};
    int size = sizeof(vector1) / sizeof(vector1[0]);

    double similarity = cosineSimilarity(vector1, vector2, size);
    printf("Cosine Similarity: %f\n", similarity);

    return 0;
}