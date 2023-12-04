
    #include <bits/stdc++.h>
    #include <chrono>
    #include <cstdint>
    #include <cstdlib>
    extern void add_to_loop(uint64_t, uint64_t);
    extern void print_times();;
int main()
{
  atexit(print_times);
  int i;
  int j;
  int temp;
  int a[100000];
  auto start_0 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(64)
  for (int i = 0; i < 100000; ++i)
  {
    a[i] = rand() % 100000;
  }

  auto end_0 = std::chrono::high_resolution_clock::now();
            auto duration_0 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_0 - start_0);
            add_to_loop(0, duration_0.count());
  i = 2;
  #pragma clang loop unroll(disable)
  while (i <= 100000)
  {
    j = i;
    auto start_1 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(64)
    while (a[j] < a[j - 1])
    {
      temp = a[j];
      a[j] = a[j - 1];
      a[j - 1] = temp;
      j--;
    }

    auto end_1 = std::chrono::high_resolution_clock::now();
            auto duration_1 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_1 - start_1);
            add_to_loop(1, duration_1.count());
    i++;
  }

}

