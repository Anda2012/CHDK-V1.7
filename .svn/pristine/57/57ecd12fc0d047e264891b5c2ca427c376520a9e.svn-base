#include "lolevel.h"
#include "platform.h"

typedef struct {
    unsigned int address;
    unsigned int length;
} cam_ptp_data_chunk; //camera specific structure

#define MAX_CHUNKS_FOR_FWT 7

typedef struct {
    int unkn1;                // 00 message number
    int file_offset;          // 01
    int maybe_full_size;      // 02
    int unkn2, unkn3;         // 03, 04
    cam_ptp_data_chunk pdc[MAX_CHUNKS_FOR_FWT]; // 05-18
    int maybe_seek_flag;      // 19
    int unkn5, unkn6;         // 20, 21
    char name[32];            // 22
} fwt_data_struct;

#include "../../../generic/filewrite.c"
