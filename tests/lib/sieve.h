#ifndef CROSS_COMPILE_EMBEDDED_DEMO_LIB_SIEVE_H
#define CROSS_COMPILE_EMBEDDED_DEMO_LIB_SIEVE_H
#include <stdint.h>

#define SIEVE_SZ 256
extern uint8_t primes[SIEVE_SZ];
void sieve(void);

#endif // CROSS_COMPILE_EMBEDDED_DEMO_LIB_SIEVE_H
