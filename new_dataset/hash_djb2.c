/**
 * @addtogroup hash Hash algorithms
 * @{
 * @file hash_djb2.c
 * @author [Christian Bender](https://github.com/christianbender)
 * @brief [DJB2 hash algorithm](http://www.cse.yorku.ca/~oz/hash.html)
 */
#include <assert.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

/**
 * @brief DJB2 algorithm implementation
 *
 * @param s NULL terminated string to hash
 * @return 64-bit hash result
 */
uint64_t djb2(const char* s)
{
    uint64_t hash = 5381; /* init value */
    size_t i = 0;
    while (s[i] != '\0')
    {
        hash = ((hash << 5) + hash) + s[i];
        i++;
    }
    return hash;
}

/**
 * Test function for ::djb2
 * \returns none
 */
void test_djb2(void)
{
    int size = 1000000;
    const char characters[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    char s1[size];

    char test_01[size];
    for (int i = 0; i < size; i++) {
        int randomIndex = rand() % (sizeof(characters) - 1);
        s1[i] = characters[randomIndex];
    }

    djb2(s1);
}

/** @} */

/** Main function */
int main()
{
    test_djb2();
    return 0;
}