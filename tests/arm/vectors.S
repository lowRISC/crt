
.cpu cortex-m0
.thumb

.thumb_func
.global _start
_start:
stacktop: .word 0x20001000
.word reset
.word hang
.word hang
.word hang
.word hang
.word hang
.word hang
.word hang
.word hang
.word hang
.word hang
.word hang
.word hang
.word hang
.word hang

.thumb_func
reset:
    bl notmain

    mov r0, #0x18           // angel_SWIreason_ReportException
    ldr r1, =0x20026        // ADP_Stopped_ApplicationExit
    // This instruction should be "svc 0xab" on all ARMs in Thumb mode
    // except for ARMv6-M and ARMv7-M, where it is "bkpt 0xab".
    bkpt 0xab

.thumb_func
hang:   b .

.thumb_func
.globl PUT32
PUT32:
    str r1,[r0]
    bx lr
