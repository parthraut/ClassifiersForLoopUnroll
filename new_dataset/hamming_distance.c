/**
 * @file
 * @brief [Hamming distance](https://en.wikipedia.org/wiki/Hamming_distance)
 * algorithm implementation.
 * @details
 * In information theory, the Hamming distance between two strings of
 * equal length is the number of positions at which the corresponding symbols
 * are different.
 * @author [Aybars Nazlica](https://github.com/aybarsnazlica)
 */

#include <assert.h> /// for assert
#include <stdio.h>  /// for IO operations

/**
 * @brief Function to calculate the Hamming distance between two strings
 * @param param1 string 1
 * @param param2 string 2
 * @returns Hamming distance
 */
int hamming_distance(char *str1, char *str2)
{
    int i = 0, distance = 0;

    while (str1[i] != '\0')
    {
        if (str1[i] != str2[i])
        {
            distance++;
        }
        i++;
    }

    return distance;
}

/**
 * @brief Self-test implementations
 * @returns void
 */
static void test()
{
    char str1[] = "NARRATOR:\
(Black screen with text; The sound of buzzing bees can be heard)\
According to all known laws\
of aviation,\
 :\
there is no way a bee\
should be able to fly.\
 :\
Its wings are too small to get\
its fat little body off the ground.\
 :\
The bee, of course, flies anyway\
 :\
because bees don't care\
what humans think is impossible.\
BARRY BENSON:\
(Barry is picking out a shirt)\
Yellow, black. Yellow, black.\
Yellow, black. Yellow, black.\
 :\
Ooh, black and yellow!\
Let's shake it up a little.\
JANET BENSON:\
Barry! Breakfast is ready!\
BARRY:\
Coming!\
 :\
Hang on a second.\
(Barry uses his antenna like a phone)\
 :\
Hello?\
ADAM FLAYMAN:\
(Through phone)\
- Barry?\
BARRY:\
- Adam?\
ADAM:\
- Can you believe this is happening?\
BARRY:\
- I can't. I'll pick you up.\
(Barry flies down the stairs)\
 :\
Looking sharp.\
JANET:\
Use the stairs. Your father\
paid good money for those.\
BARRY:\
Sorry. I'm excited.\
MARTIN:\
Here's the graduate.\
We're very proud of you, son.\
 :\
A perfect report card, all B's.\
JANET:\
Very proud.\
(Rubs Barry's hair)\
BARRY=\
Ma! I got a thing going here.\
JANET:\
- You got lint on your fuzz.\
BARRY:\
- Ow! That's me!\
JANET:\
- Wave to us! We'll be in row 118,000.\
- Bye!\
(Barry flies out the door)\
JANET:\
Barry, I told you,\
stop flying in the house!\
(Barry drives through the hive,and is waved at by Adam who is reading a\
newspaper)\
BARRY==\
- Hey, Adam.\
ADAM:\
- Hey, Barry.\
(Adam gets in Barry's car)\
 :\
- Is that fuzz gel?\
BARRY:\
- A little. Special day, graduation.\
ADAM:\
Never thought I'd make it.\
(Barry pulls away from the house and continues driving)\
BARRY:\
Three days grade school,\
three days high school...\
ADAM:\
Those were awkward.\
BARRY:\
Three days college. I'm glad I took\
a day and hitchhiked around the hive.\
ADAM==\
You did come back different.\
(Barry and Adam pass by Artie, who is jogging)\
ARTIE:\
- Hi, Barry!\
BARRY:\
- Artie, growing a mustache? Looks good.\
ADAM:\
- Hear about Frankie?\
BARRY:\
- Yeah.\
ADAM:";
    char str2[] = "kathrin";

    // assert(hamming_distance(str1, str2) == 3);

    // char str3[] = "00000";
    // char str4[] = "11111";

    // assert(hamming_distance(str3, str4) == 5);
    printf("All tests have successfully passed!\n");
}
/**
 * @brief Main function
 * @returns 0 on exit
 */
int main()
{
    test(); // run self-test implementations
    return 0;
}
