

int N = 4;

int main() {
    int v[1000] = {0};

    // #pragma clang loop unroll_count(1)

    // auto start_X = timer.start()
    auto start_1 = std::chrono::high_resolution_clock::now();
    #pragma clang loop unroll_count(N)
    for(int i = 0; i < 1000; i++){
        v[i] = i;
    }
    auto end_1 = std::chrono::high_resolution_clock::now();
    auto duration_1 = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();
    add_to_loop(1, duration_1);
    // auto end_X = timer.end()
    // call add_to_loop(0, end_x-start_x)

    // Iterate through the array and double each element
    #pragma clang loop unroll_count(1)
    for (int i = 0; i < 1000; i++) {
        #pragma clang loop unroll_count(1)
        for(int j = 0; j < 1000; j++){
            auto start_2 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(N)
            for(int k = 0; k < 1000; k++){
                v[i] *= 2 + j + k;
            }
        }
    }

    // output_times()
    return 0;
}