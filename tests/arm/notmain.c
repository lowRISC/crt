#include <stdarg.h>
#include "lib/sieve.h"

#define UART0BASE 0x4000C000
void PUT32 ( unsigned int, unsigned int );

void print_integer(int val) {
    char buf[10], *b = buf+sizeof(buf);
    while(val) {
        int digit = val % 10;
        val = val / 10;

        *--b = digit < 10 ? '0'+digit : 'A'+digit-10;
    }
    while (b < buf+sizeof(buf)) {
        PUT32(UART0BASE+0x00, *b++);
    }

}
void fake_printf(const char *fmt, ...) {
    va_list ap;
    va_start(ap, fmt);

    for(;*fmt; fmt++) {
        if (*fmt == '%') {
            switch(*++fmt) {
                case 'd':
                    print_integer(va_arg(ap, int));
                    break;
                default:
                    PUT32(UART0BASE+0x00, *fmt);
            }
        } else {
            PUT32(UART0BASE+0x00, *fmt);
        }
    }
    va_end(ap);
}


void puts(const char *str) {
    while(*str) 
        PUT32(UART0BASE+0x00, *str++);
}

int notmain ( void )
{
    puts("Hello world\n");

    sieve();

    for(int i=0; i<SIEVE_SZ; i++) {
        if (primes[i]) {
            fake_printf("%d is prime\n", i);
        }
    }
    return 0;
}
