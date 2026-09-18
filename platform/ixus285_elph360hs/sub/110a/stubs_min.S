#include "stubs_asm.h"

DEF(playrec_mode,                   0x00003b40) // FUN_ff09ffb4

DEF(file_counter_var,               0x00008bdc) // FUN_ff1f1718

DEF(active_palette_buffer,          0x71E8+0x8)     // FUN_ff19afc4 = 100c ff19aed8 (ghidra version tracking)
DEF(palette_buffer_ptr,             0x71E8+0x2C)    // FUN_ff19ad88 = 100c ff19ac9c


DEF(active_viewport_buffer,         0x21500)       // FUN_ff04eff4 @ff04f4d0, Ghidra version tracking

DEF(viewport_buffers,               0xff6ac9b8)    // FUN_ff04eab4, Ghidra version tracking

DEF(active_bitmap_buffer,           0x4020+0x28)   // FUN_ff0b4114 = 100c FF0B40E8
DEF(bitmap_buffer,                  0x4020+0x30)   // FUN_ff0b4e90 = 100c FF0B4E64

DEF(recreview_hold,                 0xCCB4+0x1C)   // FUN_ff2966dc = 100c FF2965C4

DEF(_nrflag, 0xe094) // FUN_ff2ebbcc = 100c FF2EB814


