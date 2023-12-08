#include <stdint.h>
#include <time.h>
#include <stdio.h>
#include <stdlib.h>

#define BUF_SIZE 1000


int main() {
  srand(time(NULL));
  int d2[BUF_SIZE][BUF_SIZE];

  int sum = 0;

  for (int i=0; i<BUF_SIZE; i++)
      for (int j=0; j<BUF_SIZE; j++)
          d2[i][j] = rand();

  for (int i=0; i<BUF_SIZE; i++)
      for (int j=0; j<BUF_SIZE; j++)
          sum += d2[i][j];



  printf("sum: %llu\n", sum);

  int d3[BUF_SIZE][BUF_SIZE];

  sum = 0;

  for (int i=0; i<BUF_SIZE; i++)
      for (int j=0; j<BUF_SIZE; j++)
          d3[j][i] = rand();

  for (int i=0; i<BUF_SIZE; i++)
      for (int j=0; j<BUF_SIZE; j++)
          sum += d3[j][i];



  printf("sum: %llu\n", sum);
}
