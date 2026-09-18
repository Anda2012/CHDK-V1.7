#include "lolevel.h"
#include "platform.h"
#include "core.h"
#include "conf.h"
#include "keyboard.h"

#define PARAM_FILE_COUNTER      0x1        // see comments in ixus140 port

// aperture values recorded at wide angle
const ApertureSize aperture_sizes_table[] = {
    {  9, 192, "2.0" },
    { 10, 224, "2.2" },
    { 11, 256, "2.5" },
    { 12, 288, "2.8" },
    { 13, 320, "3.2" },
    { 14, 352, "3.5" },
// (at narrow angles, F/3.9 is an additional minimum option)
    { 15, 384, "4.0" },
    { 16, 416, "4.5" },
    { 17, 448, "5.0" },
    { 18, 480, "5.6" },
    { 19, 499, "6.3" },
    { 20, 529, "7.1" },
    { 21, 561, "8.0" },
    { 22, 593, "9.0" },
    { 23, 625, "10.0" },
    { 24, 657, "11.0" },
    { 25, 689, "13.0" },
    { 26, 721, "14.0" },
    { 27, 753, "16.0" },
};

const ShutterSpeed shutter_speeds_table[] = {
    { -18, -576, "60",   60000000 },
    { -17, -544, "50",   50000000 },
    { -16, -512, "40",   40000000 },
    { -15, -480, "30",   30000000 },
    { -14, -448, "25",   25000000 },
    { -13, -416, "20",   20000000 },
    { -12, -384, "15",   15000000 },
    { -11, -352, "13",   13000000 },
    { -10, -320, "10",   10000000 },
    {  -9, -288, "8",     8000000 },
    {  -8, -256, "6",     6000000 },
    {  -7, -224, "5",     5000000 },
    {  -6, -192, "4",     4000000 },
    {  -5, -160, "3.2",   3200000 },
    {  -4, -128, "2.5",   2500000 },
    {  -3,  -96, "2",     2000000 },
    {  -2,  -64, "1.6",   1600000 },
    {  -1,  -32, "1.3",   1300000 },
    {   0,    0, "1",     1000000 },
    {   1,   32, "0.8",    800000 },
    {   2,   64, "0.6",    600000 },
    {   3,   96, "0.5",    500000 },
    {   4,  128, "0.4",    400000 },
    {   5,  160, "0.3",    300000 },
    {   6,  192, "1/4",    250000 },
    {   7,  224, "1/5",    200000 },
    {   8,  256, "1/6",    166667 },
    {   9,  288, "1/8",    125000 },
    {  10,  320, "1/10",   100000 },
    {  11,  352, "1/13",    76923 },
    {  12,  384, "1/15",    66667 },
    {  13,  416, "1/20",    50000 },
    {  14,  448, "1/25",    40000 },
    {  15,  480, "1/30",    33333 },
    {  16,  512, "1/40",    25000 },
    {  17,  544, "1/50",    20000 },
    {  18,  576, "1/60",    16667 },
    {  19,  608, "1/80",    12500 },
    {  20,  640, "1/100",   10000 },
    {  21,  672, "1/125",    8000 },
    {  22,  704, "1/160",    6250 },
    {  23,  736, "1/200",    5000 },
    {  24,  768, "1/250",    4000 },
    {  25,  800, "1/320",    3125 },
    {  26,  832, "1/400",    2500 },
    {  27,  864, "1/500",    2000 },
    {  28,  896, "1/640",    1563 },
    {  29,  928, "1/800",    1250 },
    {  30,  960, "1/1000",   1000 },
    {  31,  992, "1/1250",    800 },
    {  32, 1024, "1/1600",    625 },
    {  33, 1056, "1/2000",    500 },
    {  34, 1088, "1/2500",    400 },
    {  35, 1120, "1/3200",    313 },
    {  36, 1152, "1/4000",    250 },
};

const ISOTable iso_table[] = {
    {  0,      0, " Auto", -1},
    {  1,    100,   "100", -1},
    {  2,    125,   "125", -1},
    {  3,    160,   "160", -1},
    {  4,    200,   "200", -1},
    {  5,    250,   "250", -1},
    {  6,    320,   "320", -1},
    {  7,    400,   "400", -1},
    {  8,    500,   "500", -1},
    {  9,    640,   "640", -1},
    { 10,    800,   "800", -1},
    { 11,   1000,  "1000", -1},
    { 12,   1250,  "1250", -1},
    { 13,   1600,  "1600", -1},
    { 14,   2000,  "2000", -1},
    { 15,   2500,  "2500", -1},
    { 16,   3200,  "3200", -1},
    { 17,   4000,  "4000", -1},
    { 18,   5000,  "5000", -1},
    { 19,   6400,  "6400", -1},
    { 20,   8000,  "8000", -1},
    { 21,  10000, "10000", -1},
    { 22,  12800, "12800", -1},
};

const CapturemodeMap modemap[] = {
{ MODE_AUTO                      ,32768 },
{ MODE_M                         ,32769 },
{ MODE_AV                        ,32770 },
{ MODE_TV                        ,32771 },
{ MODE_P                         ,32772 },
// Creative filters (scene/effect dial submodes)
{ MODE_NOSTALGIC                 ,8748  }, // g16 offset +1: NOSTALGIC=8747
{ MODE_SUPER_VIVID               ,8749  },
{ MODE_POSTER_EFFECT             ,8750  },
{ MODE_FISHEYE                   ,8754  },
{ MODE_MINIATURE                 ,8755  },
{ MODE_TOY_CAMERA                ,8758  },
{ MODE_BACKGROUND_DEFOCUS        ,8759  }, // g16 offset +1: BACKGROUND_DEFOCUS=8758
{ MODE_SOFTFOCUS                 ,8760  },
{ MODE_MONOCHROME                ,8762  },
{ MODE_HDR | MODE_DISABLE_RAW   ,8770  }, // g16 offset +1: HDR=8769
// Portrait / scene modes
{ MODE_PORTRAIT                  ,16404 },
{ MODE_SNOW                      ,16412 },
{ MODE_FIREWORK                  ,16414 },
// Star scene modes
{ MODE_STAR_NIGHTSCAPE | MODE_DISABLE_RAW ,16447 }, // g16=16447 (same)
{ MODE_STAR_TRAILS     | MODE_DISABLE_RAW ,16448 }, // g16=16448 (same)
{ MODE_STAR_PORTRAIT   | MODE_DISABLE_RAW ,16449 }, // inferred: follows NIGHTSCAPE/TRAILS pattern
// Video star / underwater
{ MODE_VIDEO_STAR_TIME_LAPSE | MODE_DISABLE_RAW ,16466 }, // g16 offset +1: VIDEO_STAR_TIME_LAPSE=16465
{ MODE_UNDERWATER              ,16927 }, // g16 offset +1: UNDERWATER=16926
// Smart shutter submodes
{ MODE_FACE_SELF_TIMER         ,16943 }, // g16 offset +1: FACE_SELF_TIMER=16942
{ MODE_SMART_SHUTTER           ,16944 }, // smile detection
{ MODE_WINK_SELF_TIMER         ,16945 }, // g16 offset +1: WINK_SELF_TIMER=16944
{ MODE_NIGHT_SCENE | MODE_DISABLE_RAW ,16948 }, // handheld night scene
// Auto-assist / creative shot
{ MODE_HYBRID_AUTO | MODE_DISABLE_RAW ,33296 }, // movie digest
{ MODE_CREATIVE_EFFECT         ,33297 }, // Creative shot (various sub modes same value)
//{ MODE_???                   ,33295 }, // reported crash on some cameras — do not enable
// Video modes
{ MODE_VIDEO_STD               ,2634  }, // standard video on dial
{ MODE_VIDEO_IFRAME_MOVIE      ,2641  },
// Unknown / unsafe modes (from stubs_entry.S canon_mode_list):
//{ MODE_???                   ,4164  }, // g16: "invokes C2" — unsafe
//{ MODE_???                   ,4165  }, // unknown video sub-mode
};

#include "../generic/shooting.c"

long get_file_next_counter() {
    return get_file_counter();
}

long get_target_file_num() {
    return get_exposure_counter();
}
/*
CAM_DATE_FOLDER_NAMING values
0x000   A/DCIM/1nn___nn/MRK_nnnn.MRK
0x001   A/DCIM/1nn___nn/ETC_nnnn.TMP
0x002   A/DCIM/1nn___nn/IMG_nnnn.JPG
0x004   A/DCIM/1nn___nn/MVI_nnnn.THM
0x008   A/DCIM/1nn___nn/SND_nnnn.WAV
0x010   A/DCIM/1nn___nn/IMG_nnnn.CR2
0x020   A/DCIM/1nn___nn/MVI_nnnn.MOV
0x040   A/DCIM/1nn___nn/MVI_nnnn.MP4
0x080   A/DCIM/1nn___nn
0x100   A/DCIM/1nn___nn/ETC_nnnn.TMP
larger values and multiple bits also seem to be ETC_nnnn.TMP
*/
#if defined(CAM_DATE_FOLDER_NAMING)
void get_target_dir_name(char *out)
{
    extern void _GetImageFolder(char*,int,int,int);
    _GetImageFolder(out,get_file_next_counter(),CAM_DATE_FOLDER_NAMING,time(NULL));
}
#else
long get_target_dir_num() 
{
    return 0;
}
#endif
