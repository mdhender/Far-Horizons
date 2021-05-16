#include <stdio.h>

unsigned long last_random = 1924085713L;

int rnd(unsigned int max) {
    #ifndef FH_32BIT_64BIT_COMPATIBLE_RND
    unsigned long a, b, c, cong_result, shift_result;
    #else
    unsigned int a, b, c, cong_result, shift_result;
    #endif

    /* For congruential method, multiply previous value by the prime number 16417. */
    a           = last_random;
    b           = last_random << 5;
    c           = last_random << 14;
    cong_result = a + b + c;            /* Effectively multiply by 16417. */

    /* For shift-register method, use shift-right 15 and shift-left 17 with no-carry addition (i.e., exclusive-or). */
    a             = last_random >> 15;
    shift_result  = a ^ last_random;
    a             = shift_result << 17;
    shift_result ^= a;

    last_random = cong_result ^ shift_result;

    a = last_random & 0x0000FFFF;

    return((int)((a * max) >> 16) + 1L);
}

int main() {
    printf("sizeof(int) %ld sizeof(long) %ld\n", sizeof(int), sizeof(long));
    int i, r;
    for (i = 0; i < 1000000; i++) {
        r = rnd(1024*1024);
        if (i < 10) {
            printf("%9d %9d\n", i, r);
        } else if (1000 < i && i < 1010) {
            printf("%9d %9d\n", i, r);
        } else if ((i % 85713) == 0) {
            printf("%9d %9d\n", i, r);
        }
    }
}

