
    #include <bits/stdc++.h>
    #include <chrono>
    #include <cstdint>
    #include <cstdlib>
    extern void add_to_loop(uint64_t, uint64_t);
    extern void print_times();
    extern void init_loops(int);;
float fir_filter(float input, float *coef, int n, float *history);
static float gaussian(void);
float fir_lpf37[37] = {-6.51000e-04, -3.69500e-03, -6.28000e-04, 6.25500e-03, 4.06300e-03, -8.18900e-03, -1.01860e-02, 7.84700e-03, 1.89680e-02, -3.05100e-03, -2.96620e-02, -9.06500e-03, 4.08590e-02, 3.34840e-02, -5.07550e-02, -8.61070e-02, 5.75690e-02, 3.11305e-01, 4.40000e-01, 3.11305e-01, 5.75690e-02, -8.61070e-02, -5.07550e-02, 3.34840e-02, 4.08590e-02, -9.06500e-03, -2.96620e-02, -3.05100e-03, 1.89680e-02, 7.84700e-03, -1.01860e-02, -8.18900e-03, 4.06300e-03, 6.25500e-03, -6.28000e-04, -3.69500e-03, -6.51000e-04};
int Cnt1;
int Cnt2;
int Cnt3;
int Cnt4;
int rand()
{
  static unsigned long next = 1;
  next = (next * 1103515245) + 12345;
  return ((unsigned int) (next / 65536)) % 32768;
}

static float fabs(float n)
{
  float f;
  if (n >= 0)
    f = n;
  else
    f = -n;
  return f;
}

static float sin(float rad)
{
  float app;
  float diff;
  int inc = 1;
  auto start_0 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(2)
  while (rad > (2 * 3.14159265358979323846))
    rad -= 2 * 3.14159265358979323846;

  auto end_0 = std::chrono::high_resolution_clock::now();
            auto duration_0 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_0 - start_0);
            add_to_loop(0, duration_0.count());
  auto start_1 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(2)
  while (rad < ((-2) * 3.14159265358979323846))
    rad += 2 * 3.14159265358979323846;

  auto end_1 = std::chrono::high_resolution_clock::now();
            auto duration_1 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_1 - start_1);
            add_to_loop(1, duration_1.count());
  app = (diff = rad);
  diff = (diff * (-(rad * rad))) / ((2.0 * inc) * ((2.0 * inc) + 1.0));
  app = app + diff;
  inc++;
  auto start_2 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(2)
  while (fabs(diff) >= 0.00001)
  {
    diff = (diff * (-(rad * rad))) / ((2.0 * inc) * ((2.0 * inc) + 1.0));
    app = app + diff;
    inc++;
  }

  auto end_2 = std::chrono::high_resolution_clock::now();
            auto duration_2 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_2 - start_2);
            add_to_loop(2, duration_2.count());
  return app;
}

static float log(float r)
{
  return 4.5;
}

static float sqrt(float val)
{
  float x = val / 10;
  float dx;
  double diff;
  double min_tol = 0.00001;
  int i;
  int flag;
  flag = 0;
  if (val == 0)
    x = 0;
  else
  {
    auto start_3 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(2)
    for (i = 1; i < 20; i++)
    {
      if (!flag)
      {
        dx = (val - (x * x)) / (2.0 * x);
        x = x + dx;
        diff = val - (x * x);
        if (fabs(diff) <= min_tol)
          flag = 1;
      }
      else
        x = x;
    }

    auto end_3 = std::chrono::high_resolution_clock::now();
            auto duration_3 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_3 - start_3);
            add_to_loop(3, duration_3.count());
  }
  return x;
}

float fir_filter(float input, float *coef, int n, float *history)
{
  int i;
  float *hist_ptr;
  float *hist1_ptr;
  float *coef_ptr;
  float output;
  hist_ptr = history;
  hist1_ptr = hist_ptr;
  coef_ptr = (coef + n) - 1;
  output = (*(hist_ptr++)) * (*(coef_ptr--));
  auto start_4 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(2)
  for (i = 2; i < n; i++)
  {
    *(hist1_ptr++) = *hist_ptr;
    output += (*(hist_ptr++)) * (*(coef_ptr--));
  }

  auto end_4 = std::chrono::high_resolution_clock::now();
            auto duration_4 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_4 - start_4);
            add_to_loop(4, duration_4.count());
  output += input * (*coef_ptr);
  *hist1_ptr = input;
  return output;
}

static float gaussian()
{
  static int ready = 0;
  static float gstore;
  static float rconst1 = (float) (2.0 / 32768);
  static float rconst2 = (float) (32768 / 2.0);
  float v1;
  float v2;
  float r;
  float fac;
  float gaus;
  if (ready == 0)
  {
    v1 = ((float) rand()) - rconst2;
    v2 = ((float) rand()) - rconst2;
    v1 *= rconst1;
    v2 *= rconst1;
    r = (v1 * v1) + (v2 * v2);
    auto start_5 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(2)
    while (r > 1.0f)
    {
      v1 = ((float) rand()) - rconst2;
      v2 = ((float) rand()) - rconst2;
      v1 *= rconst1;
      v2 *= rconst1;
      r = (v1 * v1) + (v2 * v2);
    }

    auto end_5 = std::chrono::high_resolution_clock::now();
            auto duration_5 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_5 - start_5);
            add_to_loop(5, duration_5.count());
    fac = sqrt((-2.0f) * 0.1);
    gstore = v1 * fac;
    gaus = v2 * fac;
    ready = 1;
  }
  else
  {
    ready = 0;
    gaus = gstore;
  }
  return gaus;
}

float sigma = 0.2;
float getRandomFloat()
{
  return ((float) rand()) / 32768;
}

int main()
{
  atexit(print_times);
  init_loops(9);
  float fir_lpf35[1000000];
  auto start_6 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(2)
  for (int i = 0; i < 1000000; ++i)
  {
    fir_lpf35[i] = getRandomFloat();
  }

  auto end_6 = std::chrono::high_resolution_clock::now();
            auto duration_6 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_6 - start_6);
            add_to_loop(6, duration_6.count());
  int i;
  int j;
  float x;
  static float hist[34];
  auto start_7 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(2)
  for (i = 0; i < 100000; i++)
  {
    x = sin(((0.05 * 2) * 3.14159265358979323846) * i) + (sigma * gaussian());
    x *= 25000.0;
    fir_filter(x, fir_lpf35, 35, hist);
  }

  auto end_7 = std::chrono::high_resolution_clock::now();
            auto duration_7 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_7 - start_7);
            add_to_loop(7, duration_7.count());
  auto start_8 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(2)
  for (i = 0; i < 100000; i++)
  {
    x = sin(((0.05 * 2) * 3.14159265358979323846) * i) + (sigma * gaussian());
    x *= 25000.0;
  }

  auto end_8 = std::chrono::high_resolution_clock::now();
            auto duration_8 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_8 - start_8);
            add_to_loop(8, duration_8.count());
}

