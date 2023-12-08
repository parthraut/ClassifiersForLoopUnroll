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

  int steps = 256 * 1024 * 1024;

  int sum = 0;

  // Loop 1
  for (int i=0; i<steps; i++) { buf1[0]++; buf1[0]++; }


  // Loop 2

  for (int i=0; i<steps; i++) { buf1[0]++; buf1[1]++; }


  free(buf1);
}
