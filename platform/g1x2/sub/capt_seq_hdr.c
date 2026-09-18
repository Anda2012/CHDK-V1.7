#include "lolevel.h"
#include "platform.h"
#include "core.h"

#define USE_STUBS_NRFLAG 1
#define NR_AUTO (0)

#include "../../../generic/capt_seq.c"

// first parameter matches active_raw_buffer (raw_index), second is pointer to structure
extern int _captseq_raw_addr_init(int raw_index, char **ptr);
char *current_raw_addr;

void captseq_raw_addr_init_my(int raw_index, char **ptr)
{
    _captseq_raw_addr_init(raw_index, ptr);
    current_raw_addr = *(ptr + 0x50/4); // @fc13aa5a, ptr+0x50
}

void clear_current_raw_addr(void)
{
    current_raw_addr = NULL;
}
