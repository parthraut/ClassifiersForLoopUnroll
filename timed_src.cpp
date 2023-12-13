
    #include <bits/stdc++.h>
    #include <chrono>
    #include <cstdint>
    #include <cstdlib>
    extern void add_to_loop(uint64_t, uint64_t);
    extern void print_times();
    extern void init_loops(int);;
float arr[100000000];
float select(unsigned long k, unsigned long n)
{
  unsigned long i;
  unsigned long ir;
  unsigned long j;
  unsigned long l;
  unsigned long mid;
  float a;
  float temp;
  int flag;
  int flag2;
  l = 1;
  ir = n;
  flag = (flag2 = 0);
  #pragma clang loop unroll(disable)
  while (!flag)
  {
    if (ir <= (l + 1))
    {
      if (ir == (l + 1))
        if (arr[ir] < arr[l])
      {
        temp = arr[l];
        arr[l] = arr[ir];
        arr[ir] = temp;
      }
      flag = 1;
    }
    else
      if (!flag)
    {
      mid = (l + ir) >> 1;
      temp = arr[mid];
      arr[mid] = arr[l + 1];
      arr[l + 1] = temp;
      if (arr[l + 1] > arr[ir])
      {
        temp = arr[l + 1];
        arr[l + 1] = arr[ir];
        arr[ir] = temp;
      }
      if (arr[l] > arr[ir])
      {
        temp = arr[l];
        arr[l] = arr[ir];
        arr[ir] = temp;
      }
      if (arr[l + 1] > arr[l])
      {
        temp = arr[l + 1];
        arr[l + 1] = arr[l];
        arr[l] = temp;
      }
      i = l + 1;
      j = ir;
      a = arr[l];
      #pragma clang loop unroll(disable)
      while (!flag2)
      {
        i++;
        auto start_0 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(1)
        while (arr[i] < a)
          i++;

        auto end_0 = std::chrono::high_resolution_clock::now();
            auto duration_0 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_0 - start_0);
            add_to_loop(0, duration_0.count());
        j--;
        auto start_1 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(1)
        while (arr[j] > a)
          j--;

        auto end_1 = std::chrono::high_resolution_clock::now();
            auto duration_1 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_1 - start_1);
            add_to_loop(1, duration_1.count());
        if (j < i)
          flag2 = 1;
        if (!flag2)
          temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
        ;
      }

      arr[l] = arr[j];
      arr[j] = a;
      if (j >= k)
        ir = j - 1;
      if (j <= k)
        l = i;
    }
  }

  return arr[k];
}

float getRandomFloat()
{
  return ((float) rand()) * 0.00005;
}

int main()
{
  atexit(print_times);
  init_loops(3);
  auto start_2 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(1)
  for (int i = 0; i < 100000000; i++)
  {
    arr[i] = getRandomFloat();
  }

  auto end_2 = std::chrono::high_resolution_clock::now();
            auto duration_2 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_2 - start_2);
            add_to_loop(2, duration_2.count());
  select(100000000 / 2, 100000000);
}

