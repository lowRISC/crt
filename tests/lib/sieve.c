#include <stdint.h>
#include "lib/sieve.h"

uint8_t primes[SIEVE_SZ];

void sieve(void) {
    for(int i=2; i<sizeof(primes); i++) {
        primes[i] = 1;
    }

    for(int p=2; p<sizeof(primes); p++) {
        if (primes[p]) {
            int multiple = p * 2;
            while(multiple < sizeof(primes)) {
                primes[multiple] = 0;
                multiple += p;
            }
        }
    }
}
