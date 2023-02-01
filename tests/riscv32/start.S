/*
 * Startup for OpenTitan ROM
 */

  .option push
  .option norvc
  .option norelax
  .section .vectors, "ax"
  .balign 256
  .global _rom_interrupt_vectors
  .type _rom_interrupt_vectors, @function
_rom_interrupt_vectors:
    .rept 32
    j _exception_handler
    .endr
    j _reset_start
  .size _rom_interrupt_vectors, .-_rom_interrupt_vectors
  .option pop

  .section .crt, "ax"
  .balign 4
  .global _reset_start
  .type _reset_start, @function
_reset_start:
  /* Clobber all writeable registers. */
  li  x1, 0x0
  li  x2, 0x0
  li  x3, 0x0
  li  x4, 0x0
  li  x5, 0x0
  li  x6, 0x0
  li  x7, 0x0
  li  x8, 0x0
  li  x9, 0x0
  li  x10, 0x0
  li  x11, 0x0
  li  x12, 0x0
  li  x13, 0x0
  li  x14, 0x0
  li  x15, 0x0
  li  x16, 0x0
  li  x17, 0x0
  li  x18, 0x0
  li  x19, 0x0
  li  x20, 0x0
  li  x21, 0x0
  li  x22, 0x0
  li  x23, 0x0
  li  x24, 0x0
  li  x25, 0x0
  li  x26, 0x0
  li  x27, 0x0
  li  x28, 0x0
  li  x29, 0x0
  li  x30, 0x0
  li  x31, 0x0

  /* Set up the stack. */
  la  sp, _stack_end

  /*
  ** Set up the global pointer. This requires that we disable linker relaxations
  ** (or it will be relaxed to `mv gp, gp`).
  */
  .option push
  .option norelax
  la  gp, __global_pointer
  .option pop

  li a0, 0x411C0000     /* SRAM_CTRL main base addr */
  li t0, 2              /* CTRL_INIT bit */
  sw t0, 0x14(a0)       /* CTRL register is at 0x14 */

  /*
  ** Remove address space protections by configuring entry 15 as
  ** read-write-execute for the entire address space and then clearing
  ** all other entries.
  */
  li   t0, (0x9f << 24) /* Locked NAPOT read-write-execute. */
  csrw pmpcfg3, t0
  li   t0, -1           /* NAPOT encoded region covering entire 32-bit address space. */
  csrw pmpaddr15, t0
  csrw pmpcfg0, zero
  csrw pmpcfg1, zero
  csrw pmpcfg2, zero

  /* Zero out the `.bss` segment. */
/*
  la   a0, _bss_start
  la   a1, _bss_end
  call crt_section_clear
*/

  /* Initialize the `.data` segment from the `.idata` segment. */
/*
  la   a0, _data_start
  la   a1, _data_end
  la   a2, _data_init_start
  call crt_section_copy
*/

  /* Clobber all temporary registers. */
  li t0, 0x0
  li t1, 0x0
  li t2, 0x0
  li t3, 0x0
  li t4, 0x0
  li t5, 0x0
  li t6, 0x0

  /* Clobber all argument registers. */
  li a0, 0x0
  li a1, 0x0
  li a2, 0x0
  li a3, 0x0
  li a4, 0x0
  li a5, 0x0
  li a6, 0x0
  li a7, 0x0

  /* Jump into the C program entry point. */
  call _boot_start

  /* semihost exit syscall */
  li a0, 0x18
  li a1, 0x20026
  .option norvc
  .option norelax
  .global semihost_call
  .type semihost_call, @function
semihost_call:
    slli zero, zero, 0x1f
    ebreak
    srai zero, zero, 0x7
    ret

  .global _exception_handler
  .type _exception_handler, @function
_exception_handler:
    wfi
