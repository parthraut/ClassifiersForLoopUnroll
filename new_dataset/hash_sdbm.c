/**
 * @addtogroup hash Hash algorithms
 * @{
 * @file hash_sdbm.c
 * @author [Christian Bender](https://github.com/christianbender)
 * @brief [SDBM hash algorithm](http://www.cse.yorku.ca/~oz/hash.html)
 */
#include <assert.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

/**
 * @brief SDBM algorithm implementation
 *
 * @param s NULL terminated string to hash
 * @return 64-bit hash result
 */
uint64_t sdbm(const char* s)
{
    uint64_t hash = 0;
    size_t i = 0;
    while (s[i] != '\0')
    {
        hash = s[i] + (hash << 6) + (hash << 16) - hash;
        i++;
    }
    return hash;
}

/**
 * @brief Test function for ::sdbm
 * \returns None
 */
void test_sdbm()
{
    int size = 1000000;
    const char characters[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    char s1[size];

    char test_01[size];
    for (int i = 0; i < size; i++) {
        int randomIndex = rand() % (sizeof(characters) - 1);
        s1[i] = characters[randomIndex];
    }

    sdbm(s1);
}

/** @} */

/** Main function */
int main()
{
    test_sdbm();
    return 0;
}