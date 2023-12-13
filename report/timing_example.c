int main(){
    for(int i = 0; i < 100; ++i){
        //...
    }

    for(int i = 0; i < 100; ++i){
        for(int j = 0; j < 100; ++j){
            //..
        }
    }
}

extern void add_to_loop(uint64_t, uint64_t);
extern void print_times();

int main(){
    atexit(print_times);

    auto start_0 = std::chrono::high_resolution_clock::now();
    #pragma clang loop unroll_count(8)
    for(int i = 0; i < 100; ++i){
        //...
    }
    auto end_0 = std::chrono::high_resolution_clock::now();
    auto duration_0 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_0 - start_0);
    add_to_loop(0, duration_0.count());

    #pragma clang loop unroll(disable)
    for(int i = 0; i < 100; ++i){
        auto start_1 = std::chrono::high_resolution_clock::now();
        #pragma clang loop unroll_count(8)
        for(int j = 0; j < 100; ++j){
            //..
        }
        auto end_1 = std::chrono::high_resolution_clock::now();
        auto duration_1 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_1 - start_1);
        add_to_loop(1, duration_1.count());
    }
}