#include <chrono>
    #include <cstdint>
    #include <cstdlib>
    extern void add_to_loop(uint64_t, uint64_t);
    extern void print_times();;
int main()
{
  atexit(print_times);
  int sum = 0;
  auto start_0 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(32)
  for (int i = 0; i < 100; ++i)
  {
    sum += i;
  }

  auto end_0 = std::chrono::high_resolution_clock::now();
            auto duration_0 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_0 - start_0);
            add_to_loop(0, duration_0.count());
  #pragma clang loop unroll(disable)
  for (int j = 0; j < 100; ++j)
  {
    #pragma clang loop unroll(disable)
    for (int k = 0; k < 100; ++k)
    {
      auto start_1 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(32)
      for (int l = 0; l < 100; ++l)
      {
        sum += l;
      }

      auto end_1 = std::chrono::high_resolution_clock::now();
            auto duration_1 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_1 - start_1);
            add_to_loop(1, duration_1.count());
    }

  }

}

