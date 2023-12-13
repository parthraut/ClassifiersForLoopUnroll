/**
 * @addtogroup hash Hash algorithms
 * @{
 * @file hash_crc32.c
 * @author [Christian Bender](https://github.com/christianbender)
 * @brief 32-bit [CRC
 * hash](https://en.wikipedia.org/wiki/Cyclic_redundancy_check#CRC-32_algorithm)
 * algorithm
 */
#include <assert.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

/**
 * @brief 32-bit CRC algorithm implementation
 *
 * @param s NULL terminated ASCII string to hash
 * @return 32-bit hash result
 */
int crc32(const char* s)
{
    int crc = 0xffffffff;
    int i = 0;
    while (s[i] != '\0')
    {
        int byte = s[i];
        crc = crc ^ byte;
        for (int j = 8; j > 0; --j)
        {
            crc = (crc >> 1) ^ (0xEDB88320 & (-(crc & 1)));
        }

        i++;
    }
    return crc ^ 0xffffffff;
}

/**
 * @brief Test function for ::crc32
 * \returns None
 */
void test_crc32()
{
    int size = 1000000;
    const char characters[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    char s1[size];

    char test_01[size];
    for (int i = 0; i < size; i++) {
        int randomIndex = rand() % (sizeof(characters) - 1);
        s1[i] = characters[randomIndex];
    }

    crc32(s1);
}

/** @} */

/** Main function */
int main()
{
    test_crc32();
    return 0;
}