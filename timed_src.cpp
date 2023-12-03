
    #include <bits/stdc++.h>
    #include <chrono>
    #include <cstdint>
    #include <cstdlib>
    extern void add_to_loop(uint64_t, uint64_t);
    extern void print_times();;
int main()
{
  atexit(print_times);
  int v[1000] = {0};
  auto start_0 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(64)
  for (int i = 0; i < 100; ++i)
  {
    v[i] = i;
  }

  auto end_0 = std::chrono::high_resolution_clock::now();
            auto duration_0 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_0 - start_0);
            add_to_loop(0, duration_0.count());
  auto start_1 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(64)
  for (int j = 101; j < 200; ++j)
  {
    v[j] = v[j - 1] + j;
  }

  auto end_1 = std::chrono::high_resolution_clock::now();
            auto duration_1 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_1 - start_1);
            add_to_loop(1, duration_1.count());
  auto start_2 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(64)
  for (int k = 201; k < 300; ++k)
  {
    v[k] = (v[k - 1] + v[k - 2]) - v[22];
  }

  auto end_2 = std::chrono::high_resolution_clock::now();
            auto duration_2 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_2 - start_2);
            add_to_loop(2, duration_2.count());
  auto start_3 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(64)
  for (int l = 301; l < 1000; ++l)
  {
    v[l] = (v[l / 2] * v[l / 4]) + v[l / 6];
  }

  auto end_3 = std::chrono::high_resolution_clock::now();
            auto duration_3 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_3 - start_3);
            add_to_loop(3, duration_3.count());
  int sum = 0;
  auto start_4 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(64)
  for (int m = 0; m < 1000; ++m)
  {
    sum += v[m];
  }

  auto end_4 = std::chrono::high_resolution_clock::now();
            auto duration_4 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_4 - start_4);
            add_to_loop(4, duration_4.count());
  printf("%d", sum);
}

