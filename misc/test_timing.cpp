#include <iostream>
#include <chrono>



int main(){

    int sum = 0;

    auto start = std::chrono::high_resolution_clock::now();
    
    for(int i = 0; i < 1000; ++i){
        sum += i;
    }

    auto end = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();

    // Output the results
    std::cout << "Sum: " << sum << std::endl;
    std::cout << "Time taken by loop: " << duration << " nanoseconds" << std::endl;

    return 0;
}