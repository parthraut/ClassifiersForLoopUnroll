#include <stdio.h>

int main(){
    int v[1000] = {0};

    #pragma clang loop unroll_count(69)
    for(int i = 0; i < 100; ++i){
        v[i] = i;
        int a = 5;
    }

    #pragma clang loop unroll_count(69)
    for(int j = 101; j < 200; ++j){
        v[j] = v[j-1] + j;
    }

    #pragma clang loop unroll_count(69)
    for(int k = 201; k < 300; ++k){
        v[k] = v[k-1] + v[k-2] - v[22];
    }

    #pragma clang loop unroll_count(69)
    for(int l = 301; l < 1000; ++l){
        v[l] = v[l/2] * v[l/4] + v[l/6];
    }

    int sum = 0;

    // #pragma clang loop unroll_count(69)
    for(int m = 0; m < 1000; ++m){
        sum += v[m];
    }

    printf("%d", sum);
}