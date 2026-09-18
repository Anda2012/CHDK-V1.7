// !!! THIS FILE IS GENERATED. DO NOT EDIT. !!!
#include "stubs_asm.h"

// Camera info:
//   Main firmware start: 0xfc020000
//   DRYOS R54 (DRYOS version 2.3, release #0054+p3) @ 0xfc58f9b0 ref @ 0xfc04c1c4
//   Firmware Ver GM1.20A   // Found @ 0xfc140fa0, "GM1.20A" @ 0xfc140fad

// Values for makefile.inc
//   PLATFORMOSVER = 54
//   DIGIC = 60
//   MEMISOSTART = 0x36c560
//   MEMBASEADDR = 0x8000
//   ARAM_HEAP_START = 0x006ce000#  Found @0xfc444d0c
//   ARAM_HEAP_SIZE = 0x00022000#  Found @0xfc444ce6

// Detected address ranges:
// ROM      0xfc000000 - 0xfe000000 (33554432 bytes)
// RAM code 0x010c1000 - 0x010df800 copied from 0xfcd61f00 ( 124928 bytes)
// RAM data 0x00008000 - 0x00035098 copied from 0xfcd34e68 ( 184472 bytes)
// EVEC     0x00000000 - 0x00000038 copied from 0xfc062b60 (     56 bytes)

// Zico Xtensa blobs:
// zico_0 0xbff20000 - 0xbff27400 copied from 0xfcb2685c (  29696 bytes)
// zico_1 0xbff00000 - 0xbff04a70 copied from 0xfcb2dc64 (  19056 bytes)
// zico_2 0x80a00000 - 0x80b09050 copied from 0xfcb326dc (1085520 bytes)

// Omar ARM blobs:
// omar_0 0xdff00000 - 0xdff00eec copied from 0xfc58fbd8 (   3820 bytes)
// omar_1 0x40700000 - 0x4074fdd8 copied from 0xfc590ac4 ( 327128 bytes)

// Found DryOS versions:
// 0xfc58f9b0 main  "DRYOS version 2.3, release #0054+p3"
// 0xfc5a6008 other "DRYOS version 2.3, release #0054+p3"
// 0xfcb336bc other "DRYOS version 2.3, release #0054+p4"

// Values below go in 'platform_camera.h':
//#define CAM_DRYOS         1
//#define CAM_DRYOS_2_3_R39 1 // Defined for cameras with DryOS version R39 or higher
//#define CAM_DRYOS_2_3_R47 1 // Defined for cameras with DryOS version R47 or higher
//#define CAM_HAS_WIFI 1 // Firmware has wifi support (only define if camera has hardware)
//#undef  CAM_UNCACHED_BIT
//#define CAM_UNCACHED_BIT  0x40000000 // Found @0xfc14db84
//#define CAM_HAS_ND_FILTER 1 // Camera has ND filter
// Camera has an iris (CAM_HAS_IRIS_DIAPHRAGM default)

// physw_event_table 0xfc5e5978 Found @0xfc07474a
// Values below go in 'platform_kbd.h':
//#define SD_READONLY_FLAG    0x20000000 // Found @0xfc5e5a50, levent 0x20a
//#define SD_READONLY_IDX     1
//#define USB_MASK            0x10000000 // Found @0xfc5e5a90, levent 0x202
//#define USB_IDX             2
//#define BATTCOVER_FLAG      0x04000000 // Found @0xfc5e5a88, levent 0x205
//#define BATTCOVER_IDX       2
//#define HOTSHOE_FLAG        0x00000010 // Found @0xfc5e5a20, levent 0x204
//#define HOTSHOE_IDX         1
//#define ANALOG_AV_FLAG      0x00008000 // Found @0xfc5e5a38, levent 0x200 (non-inverted logic)
//#define ANALOG_AV_IDX       1

// Keymap values for kbd.c. Additional keys may be present, only common values included here.
// WARNING: Key name / function may vary! Values for unknown DryOS versions should not be trusted!
//KeyMap keymap[] = {
//    { 0, KEY_SHOOT_FULL      ,0x00040001 }, // Found @0xfc5e5978, levent 0x01
//    { 0, KEY_SHOOT_HALF      ,0x00040000 }, // Found @0xfc5e5a00, levent 0x00
//    { 0, KEY_SHOOT_FULL_ONLY ,0x00000001 }, // Found @0xfc5e5978, levent 0x01
//    { 0, KEY_ZOOM_OUT        ,0x00000002 }, // Found @0xfc5e5980, levent 0x04
//    { 0, KEY_ZOOM_IN         ,0x00000004 }, // Found @0xfc5e5988, levent 0x03
//    { 0, KEY_VIDEO           ,0x00000008 }, // Found @0xfc5e5990, levent 0x02
//    { 0, KEY_MENU            ,0x00000010 }, // Found @0xfc5e5998, levent 0x0e
//    { 0, KEY_UP              ,0x00000020 }, // Found @0xfc5e59a0, levent 0x06
//    { 0, KEY_DOWN            ,0x00000040 }, // Found @0xfc5e59a8, levent 0x07
//    { 0, KEY_RIGHT           ,0x00000080 }, // Found @0xfc5e59b0, levent 0x09
//    { 0, KEY_LEFT            ,0x00000100 }, // Found @0xfc5e59b8, levent 0x08
//    { 0, KEY_SET             ,0x00000200 }, // Found @0xfc5e59c0, levent 0x0a
//    { 0, KEY_DISPLAY         ,0x00000400 }, // Found @0xfc5e59c8, levent 0x0d
//    { 0, KEY_PLAYBACK        ,0x00002000 }, // Found @0xfc5e59e0, levent 0x101
//    { 0, KEY_WIFI            ,0x00010000 }, // Found @0xfc5e59f0, levent 0x103
//    { 0, KEY_POWER           ,0x00020000 }, // Found @0xfc5e59f8, levent 0x100
//    { 0, 0, 0 }
//};

// canon_mode_list 0xfc955070 Found @0xfc0bb8ec
// Check modemap values from 'platform/CAMERA/shooting.c':
// 33295  0x820f In firmware but not in current modemap
//  4164  0x1044 In firmware but not in current modemap
//  4165  0x1045 In firmware but not in current modemap

// Known propcases
// //      PROPCASE_AFSTEP 13
// #define PROPCASE_FOCUS_STATE 18
// #define PROPCASE_AV 23
// #define PROPCASE_BV 34
// //      PROPCASE_DELTA_DIGITALGAIN 77
// #define PROPCASE_DELTA_SV 79
// //      PROPCASE_DELTA_ND 80
// //      PROPCASE_FELOCK 114
// #define PROPCASE_FLASH_ADJUST_MODE 121
// #define PROPCASE_FLASH_FIRE 122
// //      PROPCASE_HSCAPTURE 138
// #define PROPCASE_EV_CORRECTION_2 210
// #define PROPCASE_ORIENTATION_SENSOR 222
// #define PROPCASE_SV_MARKET 249
// //      PROPCASE_SVFIX 250
// #define PROPCASE_TV 265
// Guessed propset: 6

// EXMEM types:
// EXMEM_RAMDISK        0
// EXMEM_COM            1
// EXMEM_FORMATTER      2
// EXMEM_SHADING        3
// EXMEM_FAMODE         4
// EXMEM_FIRMUP         5
// EXMEM_FIRMUP_VRAM    6
// EXMEM_FIRMUP_INFLATE 7
// EXMEM_DVLPWORK       8
// EXMEM_EVF            9
// EXMEM_SCRIPT         10
// EXMEM_GPS            11
// EXMEM_FACEAUTH       12
// EXMEM_OHYEARLOG      13
// EXMEM_WIFI           14
// EXMEM_MULTI_PLY      15
// EXMEM_FEP            16
// EXMEM_FILESTORE      17
// EXMEM_MOVIE_REC      18
// EXMEM_MOVIE_PLY      19
// EXMEM_WIFI_RESIZE    20
// EXMEM_PCEVF          21
// EXMEM_WIDE           22
// EXMEM_NARROW         23
// EXMEM_AUTO_GIS_MODE  24
// EXMEM_NP_GIS_MODE    25
// EXMEM_TRIPODHDR_MODE 26
// EXMEM_HSHQ_MODE      27
// EXMEM_CRAW_REC       28
// EXMEM_CREATIVE_SHOT  29
// EXMEM_BACKBLUR       30
// EXMEM_ASTRO          31

// Values below can be overridden in 'stubs_min.S':
DEF(ctypes                            ,0xfc58fa58) // Found @0xfc03e1e4
DEF(physw_run                         ,0x000082c8) // Found @0xfc080c06
DEF(physw_sleep_delay                 ,0x000082d0) // (0x82c8+0x8) Found @0xfc080c0a
DEF(physw_status                      ,0x0003696c) // Found @0xfc080f08
DEF(fileio_semaphore                  ,0x00013d60) // Found @0xfc072596
DEF(levent_table                      ,0xfc6c1504) // Found @0xfc0cb528
DEF(FlashParamsTable                  ,0xfc95532c) // Found @0xfc0bb900
DEF(playrec_mode                      ,0x0000c2c8) // (0xc2c4+0x4) Found @0xfc2e3a2a
DEF(jpeg_count_str                    ,0x0015f850) // Found @0xfc201bcc
DEF(zoom_busy                         ,0x000141d0) // (0x141b0+0x20) Found @0xfc1a8ac2
DEF(focus_busy                        ,0x00013f4c) // (0x13f44+0x8) Found @0xfc34143e
DEF(imager_active                     ,0x000086c4) // (0x86c0+0x4) Found @0xfc11fe22
DEF(canon_menu_active                 ,0x0000cfc8) // (0xcfc0+0x8) Found @0xfc307832
DEF(file_counter_var                  ,0x00013c24) // Found @0xfc19fe44
DEF(cameracon_state                   ,0x00008994) // (0x8984+0x10) Found @0xfc0add0a
DEF(_nrflag                           ,0x0001f90c) // (0x1f908+0x4) Found @0xfc22f054
DEF(av_override_semaphore             ,0x00027140) // Found @0xfc54f418
DEF(active_bitmap_buffer              ,0x0000cf88) // (0xcf54+0x34) Found @0xfc343ff0
DEF(displaytype                       ,0x00009358) // (0x9318+0x40) Found @0xfc3367d6
DEF(bitmap_buffer                     ,0x0000cf8c) // (0xcf54+0x38) Found @0xfc343ff6
DEF(palette_control                   ,0x0001539c) // Found @0xfc331b56
DEF(palette_buffer_ptr                ,0x000153b4) // (0x1539c+0x18) Found @0xfc331b72
DEF(active_palette_buffer             ,0x000153ac) // (0x1539c+0x10) Found @0xfc331b5a
DEF(live_free_cluster_count           ,0x001684f8) // (0x1684c0+0x38) Found @0xfc0671c0
DEF_CONST(uiprop_count                      ,0x0000009d) // Found @0xfc095860
DEF(exmem_alloc_table                 ,0x0003e3d8) // Found @0xfc074dae
DEF(exmem_types_table                 ,0xfcd391fc) // Found @0xfc074db2
DEF_CONST(exmem_type_count                  ,0x00000020) // Found @0xfcd391fc
DEF(debug_logging_ptr                 ,0x0001f710) // Found @0xfc22974a
DEF(debug_logging_flag                ,0x0001f708) // Found @0xfc229744
DEF(mzrm_sendmsg_ret_adr              ,0xfc31410f)
DEF_CONST(fw_yuv_layer_buf                  ,0x418a1000) // Found @0xfc094e9c
// focus_len_table contains zoom focus lengths for use in 'get_focal_length' (main.c).
// each entry contains 2 int value(s), the first is the zoom focus length.
// there are 101 entries in the table - set NUM_FL to 101
DEF(focus_len_table                         ,0xfdf2be34) // Found @0xfdf2be34

//NHSTUB(GetImageFolder                       ,0x00000000) //  0        *** != 0xfc306c2b
//NHSTUB(RenameFile_Fut                       ,0x00000000) //  0        *** != 0xfc33a1ec
//NHSTUB(Restart                              ,0x00000000) //  0        *** != 0xfc0c1c0d
//NHSTUB(SetFileAttributes                    ,0x00000000) //  0        *** != 0xfc33e7ad
//NHSTUB(SetFileTimeStamp                     ,0x00000000) //  0        *** != 0xfc33e765
//NHSTUB(reboot_fw_update                     ,0x00000000) //  0        *** != 0xfc3809d1

NHSTUB(AllocateUncacheableMemory              ,0xfc14db55) //  0
NHSTUB(Close                                  ,0xfc33e519) //  0
NHSTUB(CreateBinarySemaphore                  ,0x010c5919) //  0
NHSTUB(CreateTask                             ,0x010c5075) //  0
NHSTUB(DebugAssert                            ,0x010c5c6d) //  0
NHSTUB(DeleteDirectory_Fut                    ,0xfc33a299) //  0
NHSTUB(DeleteFile_Fut                         ,0xfc33a24f) //  0
NHSTUB(DeleteSemaphore                        ,0x010c599d) //  0
NHSTUB(DoAELock                               ,0xfc27cfad) //  0
NHSTUB(DoAFLock                               ,0xfc27cd23) //  0
NHSTUB(EnterToCompensationEVF                 ,0xfc27cf23) //  0
NHSTUB2(ExecuteEventProcedure                  ,0xfc33a781) //  0
NHSTUB(ExitFromCompensationEVF                ,0xfc27cf5f) //  0
NHSTUB(ExitTask                               ,0x010c5249) //  0
NHSTUB(ExpCtrlTool_StartContiAE               ,0xfc26b51f) //  0
NHSTUB(ExpCtrlTool_StopContiAE                ,0xfc26b5ff) //  0
NHSTUB(Fclose_Fut                             ,0xfc33a2fb) //  0
NHSTUB(Feof_Fut                               ,0xfc33a43d) //  0
NHSTUB(Fflush_Fut                             ,0xfc33a465) //  0
NHSTUB(Fgets_Fut                              ,0xfc33a3d9) //  0
NHSTUB(Fopen_Fut                              ,0xfc33a2d3) //  0
NHSTUB(Fread_Fut                              ,0xfc33a36d) //  0
NHSTUB(FreeUncacheableMemory                  ,0xfc14db81) //  0
NHSTUB(Fseek_Fut                              ,0xfc33a40b) //  0
NHSTUB(Fwrite_Fut                             ,0xfc33a3a3) //  0
NHSTUB(GetBatteryTemperature                  ,0xfc127fd5) //  0
NHSTUB(GetCCDTemperature                      ,0xfc127f79) //  0
NHSTUB(GetCurrentAvValue                      ,0xfc131fed) //  0
NHSTUB(GetCurrentShutterSpeed                 ,0xfc14e773) //  0
NHSTUB(GetUsableMaxAv                         ,0xfc544ebf) //  0
NHSTUB(GetUsableMinAv                         ,0xfc544ead) //  0
NHSTUB(get_nd_value                           ,0xfc483267) //  0
NHSTUB(get_current_nd_value                   ,0xfc483243) //  0
NHSTUB(get_current_deltasv                    ,0xfc14f08f) //  0
NHSTUB(GetCurrentDriveBaseSvValue             ,0xfc14f821) //  0
NHSTUB(GetDrive_ClusterSize                   ,0xfc33dae3) //  0
NHSTUB(GetDrive_TotalClusters                 ,0xfc33dfed) //  0
NHSTUB(GetFocusLensSubjectDistance            ,0xfc34202b) //  0
NHSTUB(GetFocusLensSubjectDistanceFromLens    ,0xfc342325) //  0
NHSTUB(GetKbdState                            ,0xfc0748a5) //  0
NHSTUB(GetMemInfo                             ,0xfc58a671) //  0
NHSTUB(GetOpticalTemperature                  ,0xfc12802f) //  0
NHSTUB(GetParameterData                       ,0xfc096179) //  0
NHSTUB(GetPropertyCase                        ,0xfc3315bb) //  0
NHSTUB(GetSystemTime                          ,0xfc55104d) //  0
NHSTUB(GetVRAMHPixelsSize                     ,0xfc123277) //  0
NHSTUB(GetVRAMVPixelsSize                     ,0xfc12327f) //  0
NHSTUB(GetZoomLensCurrentPoint                ,0xfc1a8d0d) //  0
NHSTUB(GetZoomLensCurrentPosition             ,0xfc37bb09) //  0
NHSTUB(GiveSemaphore                          ,0x010c5a85) //  0
NHSTUB(IsStrobeChargeCompleted                ,0xfc11f90d) //  0
NHSTUB(LEDDrive                               ,0xfc5454d9) //  0
NHSTUB(LocalTime                              ,0x010c6281) //  0
NHSTUB(LockMainPower                          ,0xfc141373) //  0
NHSTUB(MakeDirectory_Fut                      ,0xfc33e803) //  0
NHSTUB(MakeSDCardBootable                     ,0xfc33e3fb) //  0
NHSTUB(MoveFocusLensToDistance                ,0xfc559fb3) //  0
NHSTUB(MoveIrisWithAv                         ,0xfc54f405) //  0
NHSTUB(MoveZoomLensWithPoint                  ,0xfc54fcbd) //  0
NHSTUB(Open                                   ,0xfc33e495) //  0
NHSTUB(PB2Rec                                 ,0xfc0ac905) //  0
NHSTUB(PT_MoveDigitalZoomToWide               ,0xfc27c7d7) //  0
NHSTUB(PT_MoveOpticalZoomAt                   ,0xfc54636d) //  0
NHSTUB(MoveOpticalZoomAt                      ,0xfc27c5ff) //  0
NHSTUB(PT_PlaySound                           ,0xfc1439b5) //  0
NHSTUB(PostLogicalEventForNotPowerType        ,0xfc332355) //  0
NHSTUB(PostLogicalEventToUI                   ,0xfc332381) //  0
NHSTUB(PutInNdFilter                          ,0xfc55a29d) //  0
NHSTUB(PutOutNdFilter                         ,0xfc55a2c3) //  0
NHSTUB(Read                                   ,0xfc11b959) //  0
NHSTUB(ReadFastDir                            ,0xfc111da9) //  0
NHSTUB(Rec2PB                                 ,0xfc0ac947) //  0
NHSTUB(ScreenLock                             ,0xfc343f5b) //  0
NHSTUB(ScreenUnlock                           ,0xfc343f99) //  0
NHSTUB(SetAE_ShutterSpeed                     ,0xfc556981) //  0
NHSTUB(SetAutoShutdownTime                    ,0xfc1413bf) //  0
NHSTUB(SetCurrentCaptureModeType              ,0xfc311c85) //  0
NHSTUB(SetDate                                ,0xfc557dfd) //  0
NHSTUB(SetLogicalEventActive                  ,0xfc32a899) //  0
//NHSTUB(SetParameterData                     ,0x00000000) //  0            == 0x00000000
NHSTUB(SetPropertyCase                        ,0xfc331485) //  0
NHSTUB(SetScriptMode                          ,0xfc32a8d1) //  0
NHSTUB(SleepTask                              ,0x010c4fdd) //  0
NHSTUB(TakeSemaphore                          ,0x010c5a0d) //  0
NHSTUB(TurnOffBackLight                       ,0xfc337299) //  0
NHSTUB(TurnOnBackLight                        ,0xfc33723f) //  0
NHSTUB(TurnOnDisplay                          ,0xfc0c9055) //  0
NHSTUB(TurnOffDisplay                         ,0xfc0c9067) //  0
NHSTUB(UnlockAE                               ,0xfc27cfcb) //  0
NHSTUB(UnlockAF                               ,0xfc27cd53) //  0
NHSTUB(UnlockMainPower                        ,0xfc14130f) //  0
//NHSTUB(UnsetZoomForMovie                    ,0x00000000) //  0            == 0x00000000
NHSTUB(VbattGet                               ,0xfc11c317) //  0
NHSTUB(Write                                  ,0xfc33e551) //  0
NHSTUB(WriteSDCard                            ,0xfc1a5b43) //  0
NHSTUB(_log                                   ,0x010daf50) //  0
NHSTUB(_log10                                 ,0x010db470) //  0
NHSTUB(_pow                                   ,0x010db5d8) //  0
NHSTUB(_sqrt                                  ,0x010dd658) //  0
NHSTUB(add_ptp_handler                        ,0xfc0eb177) //  0
NHSTUB(apex2us                                ,0xfc22e073) //  0
NHSTUB(close                                  ,0xfc11b853) //  0
NHSTUB(err_init_task                          ,0xfc062cd1) //  0
NHSTUB(exmem_alloc                            ,0xfc075277) //  0
NHSTUB(exmem_ualloc                           ,0xfc075063) //  0
NHSTUB(exmem_ufree                            ,0xfc07523b) //  0
NHSTUB(free                                   ,0xfc3444ab) //  0
NHSTUB(kbd_p1_f                               ,0xfc080f01) //  0
NHSTUB(kbd_p1_f_cont                          ,0xfc080f09) //  0
NHSTUB(kbd_p2_f                               ,0xfc0809d1) //  0
NHSTUB(kbd_read_keys                          ,0xfc080ecb) //  0
NHSTUB(kbd_read_keys_r2                       ,0xfc074747) //  0
NHSTUB(lseek                                  ,0xfc33e675) //  0
NHSTUB(malloc                                 ,0xfc344475) //  0
NHSTUB(memcmp                                 ,0xfc34463d) //  0
NHSTUB(memcpy                                 ,0xfc145f91) //  0
NHSTUB(memset                                 ,0xfc105611) //  0
NHSTUB(mktime_ext                             ,0xfc145b61) //  0
NHSTUB(open                                   ,0xfc11b7e3) //  0
NHSTUB(OpenFastDir                            ,0xfc111d09) //  0
NHSTUB(closedir                               ,0xfc111cd1) //  0
NHSTUB(get_fstype                             ,0xfc33da7d) //  0
NHSTUB(qsort                                  ,0xfc211d29) //  0
NHSTUB(rand                                   ,0xfc1055f3) //  0
NHSTUB(set_control_event                      ,0xfc32a5dd) //  0
NHSTUB(srand                                  ,0xfc1055ed) //  0
NHSTUB(stat                                   ,0xfc33e6ad) //  0
NHSTUB(strcat                                 ,0xfc3443d9) //  0
NHSTUB(strchr                                 ,0xfc146079) //  0
NHSTUB(strcmp                                 ,0xfc344501) //  0
NHSTUB(strcpy                                 ,0xfc3444dd) //  0
NHSTUB(strftime                               ,0xfc145b91) //  0
NHSTUB(strlen                                 ,0xfc344595) //  0
NHSTUB(strncmp                                ,0xfc14604f) //  0
NHSTUB(strncpy                                ,0xfc33ebe5) //  0
NHSTUB(strrchr                                ,0xfc14608b) //  0
NHSTUB(strtol                                 ,0xfc0ddb9f) //  0
NHSTUB(strtolx                                ,0xfc0dda5d) //  0
   DEF(task_CaptSeq                           ,0xfc1383b3) //  0
   DEF(task_DvlpSeqTask                       ,0xfc1af9bb) //  0
   DEF(task_ExpDrv                            ,0xfc297889) //  0
   DEF(task_FileWrite                         ,0xfc069ab5) //  0
   DEF(task_InitFileModules                   ,0xfc0ae2b5) //  0
   DEF(task_MovieRecord                       ,0xfc134f05) //  0
   DEF(task_PhySw                             ,0xfc080c05) //  0
   DEF(task_TouchPanel                        ,0xfc1287d5) //  0
   DEF(task_TricInitTask                      ,0xfc4ebb3d) //  0
   DEF(hook_CreateTask                        ,0x010c5074) //  0
NHSTUB(time                                   ,0x010c5f21) //  0
NHSTUB(vsprintf                               ,0xfc0c7457) //  0
NHSTUB(EngDrvRead                             ,0xfc344319) //  0
NHSTUB(PTM_GetCurrentItem                     ,0xfc3365d1) //  0
NHSTUB(DisableISDriveError                    ,0xfc550261) //  0
NHSTUB(CancelHPTimer                          ,0xfc140ae1) //  0
NHSTUB(SetHPTimerAfterNow                     ,0xfc140a49) //  0
NHSTUB(SetEventFlag                           ,0x010c547b) //  0
NHSTUB(transfer_src_overlay                   ,0xfc3435fb) //  0
NHSTUB(bzero                                  ,0x010d879c) //  0
NHSTUB(memset32                               ,0x010d87a0) //  0
NHSTUB(get_dial_hw_position                   ,0xfc379911) //  0
NHSTUB(PT_MFOn                                ,0xfc27e18f) //  0
NHSTUB(PT_MFOff                               ,0xfc27e1c3) //  0
NHSTUB(GetAdChValue                           ,0xfc126793) //  0
NHSTUB(EnableHDMIPower                        ,0xfc0c2a6b) //  0
NHSTUB(DisableHDMIPower                       ,0xfc0c2a9b) //  0
NHSTUB(SetVideoOutType                        ,0xfc556f11) //  0
NHSTUB(GetVideoOutType                        ,0xfc556e7d) //  0
NHSTUB(IsWirelessConnect                      ,0xfc308387) //  0
