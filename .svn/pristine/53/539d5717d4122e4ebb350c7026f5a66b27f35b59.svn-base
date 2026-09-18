#include "stubs_asm.h"

DEF(current_fb_d                  ,0x000104cc+0x24)  // g1x2 found: str r4, [r3, #0x24] at 0xfc18cdac in ImgDDev.c function
DEF(current_viewport_buffer       ,0x00038da4+0x114) // g1x2 found: VTM struct at 0x38da4 (lit pool 0xfc1226e6), cycling fn 0xfc121a22 stores [r4,#0x114]; display params struct at 0x8790 is separate
DEF(viewport_buffers              ,0xfc5e4d24)       // g1x2 found: {0x43312300,0x43492300,0x43612300,0x43792300} delta=0x180000

FAKEDEF(video_compression_rate, 1)
FAKEDEF(canon_shoot_menu_active, 1)

DEF(recreview_hold                ,0x000091ec) // g1x2 found
DEF(simple_movie_status           ,0x0000bfd4) // g1x2 found @task_MovieRecord:fc13502a matching DAT_0000bfd0 of sx700v100e
DEF(zoom_status                   ,0x00010164) // g1x2 found @fc1868f0 using references of UIFS_GetNumOfOptZoomPos_F and matching function to FUN_fc3425ca of sx700v100e

DEF(dial_positions                ,0x000de2d0) // g1x2: found in FUN_fc072478 (scrollwheel handler)

// unused or found by finsig
//DEF(focus_len_table               ,0xfdf2be34)       // g1x2 found: by searching `64 00 00 00 64 00 00 00 [?? ?? ?? ?? 64 00 00 00 REPEATING PATTERN]` data block is similar to sx700v100e
//DEF(raw_buffers                   ,0xfc6542ac)       // g1x2 found: {0x43e4f680,0x4577df80} delta=0x1993100, finsig pattern match at 0xfc6542ac
//DEF(active_raw_buffer             ,0x0000c21c)       // g1x2 found @fc13a9a0 by matching @fc13a9a0 from sx700v100e via TryTakeSemaphore
