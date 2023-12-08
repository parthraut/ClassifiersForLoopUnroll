#include <stdio.h>

double jaccardSimilarity(int set1[], int set2[], int size) {
    int intersection = 0, unionSize = 0;

    for (int i = 0; i < size; i++) {
        if (set1[i] && set2[i]) {
            intersection++;
        }
        if (set1[i] || set2[i]) {
            unionSize++;
        }
    }

    return (double)intersection / unionSize;
}

int main() {
    int set1[] = {1, 0, 1, 0, 1};
    int set2[] = {1, 1, 0, 1, 0};
    int size = sizeof(set1) / sizeof(set1[0]);

    double similarity = jaccardSimilarity(set1, set2, size);
    printf("Jaccard Similarity: %f\n", similarity);

    return 0;
}