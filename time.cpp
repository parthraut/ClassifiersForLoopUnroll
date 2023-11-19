
#include <vector>
#include <cstdint>
#include <iostream>

#include <unordered_map>

#include <chrono>


// time[i] = {} for the ith loop
std::unordered_map<uint64_t, std::vector<uint64_t>> times;



/*

To modify in IR:
before loop, add auto start_X = std::chrono::high_resolution_clock::now();




*/

void add_to_loop(uint64_t loop_num, uint64_t start_time, uint64_t end_time){
    uint64_t duration = end_time - start_time;

    times[loop_num].push_back(duration);
}

// print times
void print_times(){
    for(auto& [key, vals] : times){
        std::cout << "Loop: " << key << " Vals: ";
        for(auto& val : vals){
            std::cout << val << " ";
        }
        std::cout << "\n";
    }
}

// check online, try to find an online implementation