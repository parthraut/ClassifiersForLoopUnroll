#include <stdio.h>

#define K 5
#define N 10000

float data[N];
float centroids[K];
int cluster_assignment[N];

void kmeans() {
    // Iterative algorithm for K-Means clustering
    int max_iterations = 100;
    for (int iteration = 0; iteration < max_iterations; iteration++) {
        // Assignment step
        for (int i = 0; i < N; i++) {
            float min_distance = 1e9;
            int closest_centroid = -1;
            for (int j = 0; j < K; j++) {
                float distance = data[i] - centroids[j];
                distance = distance * distance;
                if (distance < min_distance) {
                    min_distance = distance;
                    closest_centroid = j;
                }
            }
            cluster_assignment[i] = closest_centroid;
        }

        // Update step
        float sum[K] = {0};
        int count[K] = {0};
        for (int i = 0; i < N; i++) {
            sum[cluster_assignment[i]] += data[i];
            count[cluster_assignment[i]]++;
        }
        for (int j = 0; j < K; j++) {
            centroids[j] = sum[j] / count[j];
        }
    }
}

int main() {
    for (int i = 0; i < N; i++) {
        data[i] = rand() % N;
    }
    for (int i = 0; i < K; i++) {
        centroids[i] = rand() % K;
    }

    kmeans();

    // Display cluster assignments
    for (int i = 0; i < N; i++) {
        printf("Data point %.2f belongs to cluster %d\n", data[i], cluster_assignment[i]);
    }

    return 0;
}