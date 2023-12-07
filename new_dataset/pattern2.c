#include <stdio.h>
int main()
{
   int i, j, spc, rows = 20000, k;
   // printf("Input number of rows : ");
   // scanf("%d",&rows);

   for (i = 1; i <= rows; i++)
   {
      int spc = rows - i;
      int something = 0;
      for (k = spc; k >= 1; k--)
      {
         // printf(" ");
         ++something;
      }

      for (j = 1; j <= i; j++)
      {
         // printf("$ ");
         ++something;
      }
      // printf("\n");
   }
   return 0;
}
