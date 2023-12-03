#include <vector>
#include <cstdint>
#include <iostream>

#include <unordered_map>

#include <chrono>

#include <nlohmann/json.hpp>

// time[i] = {} for the ith loop
std::unordered_map<uint64_t, std::vector<uint64_t>> times;

using json = nlohmann::json;
/*

x86 instr: RDTSCP/RDTSC
    - reads number of clock cycle
    - must more precise
    - just like an instruction


for every unnested loop and innermost nested loop, add:

before loop:
auto start_X = std::chrono::high_resolution_clock::now();
#pragma clang loop unroll_count(N)

end of loop:
auto end = std::chrono::high_resolution_clock::now();
auto duration = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();
add_to_loop(X, duration);


for every nested loop that is not innermost, add

before loop:
#pragma clang loop unroll_count(1)
*/

void add_to_loop(uint64_t loop_num, uint64_t duration)
{
    times[loop_num].push_back(duration);
}

// print times
void print_times()
{
    json j;

    // fill json and dump
    for(auto& [loop_num, durations] : times){
        j[std::to_string(loop_num)] = durations;
    }

    std::cerr << j.dump();
}