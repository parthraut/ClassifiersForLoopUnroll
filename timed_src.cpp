
    #include <bits/stdc++.h>
    #include <chrono>
    #include <cstdint>
    #include <cstdlib>
    extern void add_to_loop(uint64_t, uint64_t);
    extern void print_times();
    extern void init_loops(int);;
void mehar_deep_singh(int *mehar_is_cool)
{
  auto start_0 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(64)
  for (int i = 0; i < 1000; ++i)
  {
    mehar_is_cool[i] += 69;
  }

  auto end_0 = std::chrono::high_resolution_clock::now();
            auto duration_0 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_0 - start_0);
            add_to_loop(0, duration_0.count());
}

int main()
{
  atexit(print_times);
  init_loops(5);
  int v[1000];
  #pragma clang loop unroll(disable)
  for (int i = 1; i < 1000; i++)
  {
    #pragma clang loop unroll(disable)
    for (int j = 0; j < 1000; j++)
    {
      auto start_1 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(64)
      for (int k = 0; k < 1000; k++)
      {
        v[i - 1] *= (2 + j) + k;
      }

      auto end_1 = std::chrono::high_resolution_clock::now();
            auto duration_1 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_1 - start_1);
            add_to_loop(1, duration_1.count());
      auto start_2 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(64)
      for (int z = 0; z < 345; ++z)
      {
        v[i - 1]++;
      }

      auto end_2 = std::chrono::high_resolution_clock::now();
            auto duration_2 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_2 - start_2);
            add_to_loop(2, duration_2.count());
    }

    auto start_3 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(64)
    for (int mehar = 0; mehar < 384; ++mehar)
    {
      v[i - 1] += mehar;
    }

    auto end_3 = std::chrono::high_resolution_clock::now();
            auto duration_3 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_3 - start_3);
            add_to_loop(3, duration_3.count());
    auto start_4 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(64)
    for (int mehar = 1; mehar < 500; ++mehar)
    {
      v[mehar] = v[mehar - 1] + 69;
    }

    auto end_4 = std::chrono::high_resolution_clock::now();
            auto duration_4 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_4 - start_4);
            add_to_loop(4, duration_4.count());
  }

  return 0;
}

