#include <chrono>
#include <iostream>

extern int test();

// executable name is going to be key in json file
int main(int argc, char** argv){
    auto start = std::chrono::high_resolution_clock::now();
    // Code to be timed
    test();
    auto end = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start);

    std::cout << duration.count() << std::endl;
    
    return 0;
}