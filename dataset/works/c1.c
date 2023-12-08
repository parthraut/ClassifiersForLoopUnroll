#include <stdint.h>
#include <time.h>
#include <stdio.h>
#include <stdlib.h>

#define BUF_SIZE 100000000
#define BACKWARDS

int main() {
  srand(time(NULL));
  int *buf1 = (int *)malloc(BUF_SIZE);
  // Fill the buf with random data
  for (int i = 0; i < BUF_SIZE; ++i) {
    buf1[i] = rand();
  }

#ifdef BACKWARDS
  printf("Backward Iterating...");
#else
  printf("Forward Iterating...");
#endif

  int sum = 0;

#ifdef BACKWARDS
  for (int i = BUF_SIZE - 1; i != ~0; --i) {
#else
  for (int i = 0; i < BUF_SIZE; ++i) {
#endif
    sum += buf1[i];
  }

  printf("sum: %llu\n", sum);
  free(buf1);
}
