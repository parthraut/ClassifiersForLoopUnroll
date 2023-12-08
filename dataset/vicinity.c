#include <stdint.h>
#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h> //Header file for sleep(). man 3 sleep for details.
#include <pthread.h>

#define ID1 0
#define ID2 100

// A normal C function that is executed as a thread
// when its name is specified in pthread_create()
void *myThreadFun(void *vargp)
{
    // Store the value argument passed to this thread
    int *num = (int *)vargp;
    srand(time(NULL));
    for(int i = 0; i < 10000000; i++) {
        *num = *num + rand();
    }
	return NULL;
}

int main()
{
    unsigned int A[1000];
    A[ID1]=0;
    A[ID2]=0;
	pthread_t thread_id1, thread_id2;
	printf("Before Thread\n");
    clock_t start = clock();
	pthread_create(&thread_id1, NULL, myThreadFun, &A[ID1]);
	pthread_create(&thread_id2, NULL, myThreadFun, &A[ID2]);
	pthread_join(thread_id1, NULL);
	pthread_join(thread_id2, NULL);
    clock_t end = clock();
    printf("Loop1 took %lu clock cycles\n",  end - start);
	printf("After Thread\n");
    printf("\n %d %d\n", A[ID1],A[ID2]);
	exit(0);
}

