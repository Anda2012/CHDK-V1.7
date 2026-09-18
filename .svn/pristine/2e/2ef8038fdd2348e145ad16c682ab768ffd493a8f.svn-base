#include "lolevel.h"
#include "platform.h"
#include "core.h"
#include "keyboard.h"


extern long link_bss_start;
extern long link_bss_end;
extern void boot();

void startup() {
    long *bss = &link_bss_start;
//    *(int*)0xd20b0994 = 0x4d0002;

    // sanity check
    if ((long)&link_bss_end > (MEMISOSTART + MEMISOSIZE)) {
        started();
        shutdown();
    }
    // initialize .bss senment
    while (bss<&link_bss_end)
        *bss++ = 0;
//    *(int*)0xd20b0994 = 0x4d0002;
    boot();
}

#define NUM_FL      113 // From physw_status
#define NUM_DATA    2   // 2 words each entry, first is FL
extern int focus_len_table[NUM_FL*NUM_DATA];

// Conversion factor lens FL --> 35mm equiv
// G1X2 lens: 12.5-62.5mm real, 24-120mm 35mm equiv
// ratio = 24/12.5 = 120/62.5 = 1.92 = 192/100
// lens      35mm     CF
// ----      ----     --
// 12.5      24       (24/12.5) * 100 = 192  (min FL)
// 62.5     120       (120/62.5) * 100 = 192  (max FL)

#define CF_EFL      192
#define CF_EFL_DIV  100

const int zoom_points = NUM_FL;


int get_effective_focal_length(int zp) {
    return (CF_EFL*get_focal_length(zp))/CF_EFL_DIV;
}

int get_focal_length(int zp) {
    if (zp < 0) zp = 0;
    else if (zp >= NUM_FL) zp = NUM_FL-1;
    return focus_len_table[zp*NUM_DATA];
}

int get_zoom_x(int zp) {
    return get_focal_length(zp)*10/focus_len_table[0];
}


// ((int(*)(int))0xfc1659e7)(n) returns for
// 0 => 3200, 1 => 3500, 2 => 3700, 3 => 3900, 4 => 4000
// these are good approximations for battery level

long get_vbatt_min()
{
    return 3200;
}


long get_vbatt_max()
{
    return 4000;
}
