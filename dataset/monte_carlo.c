#include <stdio.h>
#include <stdlib.h>
#include <time.h>

double monteCarloPi(int numPoints)
{
    int insideCircle = 0;
    srand(time(NULL));

    for (int i = 0; i < numPoints; ++i)
    {
        double x = (double)rand() / RAND_MAX;
        double y = (double)rand() / RAND_MAX;
        double distance = x * x + y * y;

        if (distance <= 1)
        {
            insideCircle++;
        }
    }

    return 4.0 * insideCircle / numPoints;
}

int main()
{
    double result = monteCarloPi(100000);
    printf("Monte Carlo Pi: %lf\n", result);
    return 0;
}
