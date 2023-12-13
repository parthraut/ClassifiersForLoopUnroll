
    #include <bits/stdc++.h>
    #include <chrono>
    #include <cstdint>
    #include <cstdlib>
    extern void add_to_loop(uint64_t, uint64_t);
    extern void print_times();
    extern void init_loops(int);;
void needlemanWunsch(char seq1[], char seq2[])
{
  int len1 = strlen(seq1);
  int len2 = strlen(seq2);
  int matrix[len1 + 1][len2 + 1];
  auto start_0 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(8)
  for (int i = 0; i <= len1; ++i)
  {
    matrix[i][0] = i * (-2);
  }

  auto end_0 = std::chrono::high_resolution_clock::now();
            auto duration_0 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_0 - start_0);
            add_to_loop(0, duration_0.count());
  auto start_1 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(8)
  for (int j = 0; j <= len2; ++j)
  {
    matrix[0][j] = j * (-2);
  }

  auto end_1 = std::chrono::high_resolution_clock::now();
            
  #pragma clang loop unroll(disable)
  for (int i = 1; i <= len1; ++i)
  {
    auto start_2 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(8)
    for (int j = 1; j <= len2; ++j)
    {
      int match = matrix[i - 1][j - 1] + ((seq1[i - 1] == seq2[j - 1]) ? (1) : (-1));
      int del = matrix[i - 1][j] + (-2);
      int insert = matrix[i][j - 1] + (-2);
      matrix[i][j] = (match > del) ? (match) : (del);
      matrix[i][j] = (insert > matrix[i][j]) ? (insert) : (matrix[i][j]);
    }

    auto end_2 = std::chrono::high_resolution_clock::now();
            auto duration_2 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_2 - start_2);
            add_to_loop(2, duration_2.count());
  }

  printf("Alignment Matrix:\n");
  #pragma clang loop unroll(disable)
  for (int i = 0; i <= len1; ++i)
  {
    auto start_3 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(8)
    for (int j = 0; j <= len2; ++j)
    {
      printf("%d\t", matrix[i][j]);
    }

    auto end_3 = std::chrono::high_resolution_clock::now();
            auto duration_3 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_3 - start_3);
            add_to_loop(3, duration_3.count());
    printf("\n");
  }

  int i = len1;
  int j = len2;
  printf("\nAligned Sequences:\n");
  auto start_4 = std::chrono::high_resolution_clock::now();
            #pragma clang loop unroll_count(8)
  while ((i > 0) || (j > 0))
  {
    if (((i > 0) && (j > 0)) && (matrix[i][j] == (matrix[i - 1][j - 1] + ((seq1[i - 1] == seq2[j - 1]) ? (1) : (-1)))))
    {
      printf("%c", seq1[i - 1]);
      i--;
      j--;
    }
    else
      if ((i > 0) && (matrix[i][j] == (matrix[i - 1][j] + (-2))))
    {
      printf("%c", seq1[i - 1]);
      i--;
    }
    else
    {
      printf("%c", seq2[j - 1]);
      j--;
    }
  }

  auto end_4 = std::chrono::high_resolution_clock::now();
            auto duration_4 = std::chrono::duration_cast<std::chrono::nanoseconds>(end_4 - start_4);
            add_to_loop(4, duration_4.count());
  printf("\n");
}

int main()
{
  atexit(print_times);
  init_loops(5);
  char sequence1[] = "ACGTACGT";
  char sequence2[] = "ACGTGACGT";
  needlemanWunsch(sequence1, sequence2);
  return 0;
}

