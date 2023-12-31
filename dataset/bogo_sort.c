#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

int check_sorted(int *a, int n)
{
    while (--n >= 1)
    {
        if (a[n] < a[n - 1])
            return false;
    }
    return true;
}

void shuffle(int *a, int n)
{
    int i, t, r;
    for (i = 0; i < n; i++)
    {
        t = a[i];
        r = rand() % n;
        a[i] = a[r];
        a[r] = t;
    }
}

void sort(int *a, int n)
{
    while (!check_sorted(a, n))
        shuffle(a, n);
}

int main()
{
    int numbers[2000000];
    int i;
    // printf("Enter 6 numbers unsorted \n\n");
    for (i = 0; i < 6; i++)
    {
        // scanf("%d", &numbers[i]);
        numbers[i] = rand() % 301;
    }
    sort(numbers, 6);
    // for (i = 0; i < 6; i++)
    //     printf("%d ", numbers[i]);
    // printf("\n");
}
