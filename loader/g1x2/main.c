#include "../generic/check_compat.c"

extern long *blob_chdk_core;
extern long blob_chdk_core_size;

void __attribute__((noreturn)) my_restart()
{
    check_compat();

    long *dst = (long*)MEMISOSTART;
    const long *src = blob_chdk_core;
    long length = (blob_chdk_core_size + 3) >> 2;

    core_copy(src, dst, length);

    // on G7X allows boot on short press without fiddling variables in startup code
    // on g1x2, appears to be needed for correct startup when using fi2 boot
    *(volatile unsigned *)(0x4ffc)=0x12345678;

    asm volatile (
    "mov     r1, %1\n"
    "mov     r0, %0\n"
    "ldr     r2, =0xfc11b1e3\n" // dcache_clean_range, g1x2 120a (single fw version, no need to inline)
    "blx     r2\n"

    // start execution at MEMISOSTART in thumb mode
    "mov     r0, %0\n"
    "add     r0, r0, #1\n"
    "bx      r0\n"
    : : "r"(MEMISOSTART), "r"(((blob_chdk_core_size+3)>>2)<<2) : "memory","r0","r1","r2","r3","r4"
    );
    while(1);
}
