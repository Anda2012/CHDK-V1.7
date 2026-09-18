#include "stubs_asm.h"

// BEWARE: thumb functions NEED the thumb bit in the below list

#define NULL_SUB	0xfc02040b	// bx lr
#define RET1		0xfc020409	// mov r0, #1 ; bx lr
#define RET0		0xfc02040d	// mov r0, #0 ; bx lr

// unused
NHSTUB(VTMLock,   0xfc3437f9)  // g1x2: push{r4,lr}; ldr r4,=cf54; add r4,#0x48; inc [r4]; logs "VTMLock"
NHSTUB(VTMUnlock, 0xfc3439c9)  // g1x2: ldr r2,=cf9c; dec [r2]; if==0: trigger pending (tail-call 0xfc3438f6)
//NHSTUB(LogCameraEvent, 0xfc30b6f3)

// Found by prior finsig run but not re-found in latest run - known address
NHSTUB(CreateBinarySemaphoreStrictly, 0x010c5b6b)

// Not found by finsig / stubs_entry.S
NHSTUB(captseq_raw_addr_init, 0xfc13aa1b) // confirmed in Ghidra
NHSTUB(GetImageFolder, 0xfc306c2b) // confirmed in Ghidra
// sub_fc55a1e6: calls CreateEventFlagStrictly, stores handle at *(0x0002e1ac)
NHSTUB(init_focus_eventflag, 0xfc55a1e7)    // thumb bit of sub_fc55a1e6
NHSTUB(reboot_fw_update, 0xfc3809d1) // Equivalent that has been identified in g5x 101d
NHSTUB(RenameFile_Fut, 0xfc33a1ec) // Equivalent that has been identified in g5x 101d
NHSTUB(Restart, 0xfc0c1c0d) // Equivalent that has been identified in g5x 101d
NHSTUB(SetFileAttributes, 0xfc33e7ad)
NHSTUB(SetFileTimeStamp, 0xfc33e765)
NHSTUB(init_nd_eventflag, 0xfc55a2f5) // PutInNdFilter / PutOutNdFilter reads DAT_0002e1bc -> sub_fc55a2f4 creates event flags strictly for it
// Nullsubs
NHSTUB(SetParameterData, NULL_SUB)
NHSTUB(SetZoomActuatorSpeedPercent, NULL_SUB)
NHSTUB(UnsetZoomForMovie, NULL_SUB)

// Jogdial internal functions (CAM_HAS_JOGDIAL)
// Called from kbd_p2_f_my / sub_fc074720_my
//NHSTUB(get_dial_hw_position,    0xfc379911) // confirmed in stubs_entry.S
