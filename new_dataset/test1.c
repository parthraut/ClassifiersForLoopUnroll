#include <stdio.h>

int main()
{
    int number = 10000, i, k, count = 1, something = 1;

    // printf("Enter number of rows\n");
    // scanf("%d", &number);
    count = number - 1;
    for (k = 1; k <= number; k++)
    {
        for (i = 1; i <= count; i++)
            // printf(" ");
            ++something;
        count--;
        for (i = 1; i <= k; i++)
            // printf("$");
            ++something;

        for (i = 1; i <= k; i++)
            // printf("#");
            ++something;
        // printf("\n");
    }
    count = 1;
    something = 0;
    for (k = 1; k <= number - 1; k++)
    {
        for (i = 1; i <= count; i++)
            // printf(" ");
            ++something;
        count++;
        for (i = 1; i <= (number - k); i++)
            // printf("$");
            ++something;
        for (i = 1; i <= (number - k); i++)
            // printf("#");
            ++something;
        // printf("\n");
    }
    return 0;
}
