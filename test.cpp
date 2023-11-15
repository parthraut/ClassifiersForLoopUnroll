
#include <iostream>
// #pragma clang loop unroll_count(1)

#include <iostream>

int main() {
    int v[1000] = {0};

    // #pragma clang loop unroll_count(1)
    for(int i = 0; i < 1000; i++){
        v[i] = i;
    }

    // Iterate through the array and double each element
    // #pragma clang loop unroll_count(1)
    for (int i = 0; i < 1000; i++) {
        // #pragma clang loop unroll_count(1)
        for(int j = 0; j < 1000; j++){
            // #pragma clang loop unroll_count(1)
            for(int k = 0; k < 1000; k++){
                v[i] *= 2 + j + k;
            }
        }
    }

    

    std::cout << v[0] << std::endl;

    return 0;
}