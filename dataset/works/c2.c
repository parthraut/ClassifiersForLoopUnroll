#include <stdint.h>
#include <time.h>
#include <stdio.h>
#include <stdlib.h>

#define BUF_SIZE 100000000


int main() {
  srand(time(NULL));
  int *buf1 = (int *)malloc(BUF_SIZE);
  // Fill the buf with random data
  for (int i = 0; i < BUF_SIZE; ++i) {
    buf1[i] = rand();
    buf1[(i+BUF_SIZE/1000)%BUF_SIZE] = rand();
  }


  int sum = 0;

  for (int i = 0; i < BUF_SIZE; ++i) {
    sum += buf1[i];
    sum += buf1[(i+BUF_SIZE/1000)%BUF_SIZE];
  }


  printf("sum: %llu\n", sum);
  free(buf1);
}
