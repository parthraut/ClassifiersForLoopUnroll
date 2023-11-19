
#include <iostream>

int main() {
    int v[1000];

    // Iterate through the array and double each element
    
    for (int i = 1; i < 1000; i++) {
    
        for(int j = 0; j < 1000; j++){
        
            for(int k = 0; k < 1000; k++){
                v[i-1] *= 2 + j + k;
            }
        }
    }

    return 0;
}