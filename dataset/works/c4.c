#include <stdint.h>
#include <time.h>
#include <stdio.h>
#include <stdlib.h>

#define BUF_SIZE (64*1024*1024)


int main() {
  srand(time(NULL));
  int *buf1 = (int *)malloc(BUF_SIZE);
  // Fill the buf with random data
  for (int i = 0; i < BUF_SIZE; ++i) {
    buf1[i] = rand();
  }


  int sum = 0;
  // Loop 1
  for (int K=1; K<1024; K++) {
    for (int i = 0; i < BUF_SIZE; i +=K) {
      buf1[i] *= 3;
    }
  }
  free(buf1);
}
