#include "stubs_asm.h"

#define NULL_SUB 0xFF81030C

// org s80 nov 2
NHSTUB(free, 0xffb05c10) // updated

NHSTUB(SetZoomActuatorSpeedPercent, NULL_SUB)

NHSTUB(TurnOffMic,                  NULL_SUB)
NHSTUB(TurnOnMic,                   NULL_SUB)
NHSTUB(ExpCtrlTool_StopContiAE,     0xFF8F87F8)
NHSTUB(ExpCtrlTool_StartContiAE,    0xFF8F87E0)

// find_eventproc
NHSTUB(PutInNdFilter,               0xffab6858) // note: there's no ND filter // updated

NHSTUB(platformsub_kbd_fetch_data, 0xFF82784C) //S80 org
NHSTUB(kbd_read_keys_r2, 0xFF82737C) //s80 org
NHSTUB(taskcreate_JogDial, 0xFF8283b8)
NHSTUB(task_JogDial, 0xFF8287a8)
NHSTUB(taskNameToId, 0xffb13764) // updated

NHSTUB(orig_MoveFocusLensToDistance, 0xffab8a70) // updated
IGNORE(MoveFocusLensToDistance)  // Custom version in lib.c, ignore firmware version

NHSTUB(LEDDrive, 0xFF82DBB8)
NHSTUB(PostLEDMessage, 0xFF82D8FC)

// New finsig_vxworks differences?
NHSTUB(kbd_pwr_off, 0xff828fec)
