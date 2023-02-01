#include <stdarg.h>
#include "lib/sieve.h"

extern int semihost_call(int, int);

#define UART0_BASE 0x40000000
//void PUT32 ( unsigned int, unsigned int );

#define PUT32(addr, val) do { \
        *((volatile uint32_t*)(addr)) = (val); \
    } while(0)

#define GET32(addr) \
        *((volatile uint32_t*)(addr))

void uart_init(void) {
    // Enable uart TX and RX        
    PUT32(UART0_BASE+0x10, 3);
}

void uart_putc(unsigned char ch) {
    PUT32(UART0_BASE+0x1C, ch);
    while(!(GET32(UART0_BASE+0x14) & 4)) {
        // Wait for TXEMPTY
    }
}

void print_integer(int val) {
    char buf[10], *b = buf+sizeof(buf);
    while(val) {
        int digit = val % 10;
        val = val / 10;

        *--b = digit < 10 ? '0'+digit : 'A'+digit-10;
    }
    while (b < buf+sizeof(buf)) {
        uart_putc(*b++);
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
                    uart_putc(*fmt);
            }
        } else {
            uart_putc(*fmt);
        }
    }
    va_end(ap);
}

void puts(const char *str) {
    while(*str) 
        uart_putc(*str++);
}


int _boot_start ( void )
{
    uart_init();
    puts("Hello world\n");

    sieve();

    for(int i=0; i<SIEVE_SZ; i++) {
        if (primes[i]) {
            fake_printf("%d is prime\n", i);
        }
    }
    return 0;
}
