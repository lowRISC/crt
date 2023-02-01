ENTRY(_start)
MEMORY
{
  ram_ret_aon(rwx) : ORIGIN = 0x40600000, LENGTH = 0x1000
  eflash(rx) : ORIGIN = 0x20000000, LENGTH = 0x100000
  /* 
   * This length for RAM is incorrect.  The opentitan chip has 128k,
   * but qemu appears to only support 64k.
   */
  ram(rwx) : ORIGIN = 0x10000000, LENGTH = 0x10000
  /*ram(rwx) : ORIGIN = 0x10000000, LENGTH = 0x20000*/
  rom(rx) : ORIGIN = 0x00008000, LENGTH = 0x8000
}

/**
 * The boot address, which indicates the location of the initial interrupt
 * vector.
 */
_boot_address = ORIGIN(rom);
_stack_end = ORIGIN(ram) + LENGTH(ram);
__global_pointer = ORIGIN(ram);
ENTRY(_reset_start);

SECTIONS
{
    .vectors _boot_address : ALIGN(4) {
        KEEP(*(.vectors))
    } > rom
    .crt : ALIGN(4) {
        KEEP(*(.crt))
    } > rom

    .text : { *(.text*) } > rom
    .rodata : { *(.rodata*) } > rom
    .bss : { *(.bss*) } > ram
}

