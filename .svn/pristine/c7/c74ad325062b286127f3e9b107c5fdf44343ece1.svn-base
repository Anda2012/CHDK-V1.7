
// Values below go in 'platform_camera.h':

#define CAM_PROPSET       6
#define CAM_DRYOS         1
#define CAM_DRYOS_2_3_R39 1 // Defined for cameras with DryOS version R39 or higher
#define CAM_DRYOS_2_3_R47 1 // Defined for cameras with DryOS version R47 or higher

#define CAM_HAS_CMOS                        1

#undef  CAM_UNCACHED_BIT
#define CAM_UNCACHED_BIT  0x40000000 // Found @0xfc14db84

#define CAM_HAS_ND_FILTER           1   // Camera has built-in ND filter (in addition to iris)
#define CAM_HAS_NATIVE_ND_FILTER    1   // Camera has built-in ND filter with Canon menu support for enable/disable
#define CAM_HAS_IRIS_DIAPHRAGM      1   // Camera has an iris (CAM_HAS_IRIS_DIAPHRAGM is the default)
#define CAM_AV_OVERRIDE_IRIS_FIX    1   // required for Av bracketing on cameras with iris diaphragm

#define CAM_HAS_JOGDIAL             1   // G1X Mark II has rear control dial
#define CAM_HAS_VIDEO_BUTTON        1   // dedicated video record button
#define CAM_HAS_WIFI                1   // Camera has wifi support

#undef  CAM_CAN_UNLOCK_OPTICAL_ZOOM_IN_VIDEO   // unlocked by default
#undef  CAM_USE_ZOOM_FOR_MF                    // not needed

// Alt button
    // Various buttons used as ALT in other CHDK ports
    #define CAM_ADJUSTABLE_ALT_BUTTON           1
    #define CAM_ALT_BUTTON_NAMES                { "Shortcut", "Display", "Video", "Wifi" }
    #define CAM_ALT_BUTTON_OPTIONS              { KEY_PRINT, KEY_DISPLAY, KEY_VIDEO, KEY_WIFI }

// not implemented
#undef  CAM_CHDK_HAS_EXT_VIDEO_MENU
#undef  CAM_VIDEO_CONTROL

// minimal recording or not only
#define CAM_SIMPLE_MOVIE_STATUS             1
#define CAM_IS_VID_REC_WORKS                1   // Define if the 'is_video_recording()' function works

#define CAM_DRIVE_MODE_FROM_TIMER_MODE      1

// RAW / sensor — dimensions confirmed from Canon CR2 analysis (rawpy)
#define CAM_RAW_ROWPIX                      4480    // full raw frame width
#define CAM_RAW_ROWS                        3366    // full raw frame height
#define CAM_HAS_FILEWRITETASK_HOOK          1
#define CAM_MULTIPART                       1
#define CAM_HAS_CANON_RAW                   1   // native CR2 raw support
#define CAM_EXT_TV_RANGE                    1   // supports bulb and long native exposures

// Sensor bit depth: ISP raw buffer is 14-bit (white_level=16383, confirmed from CR2 and DNG decode)
// rev16 (reverse_bytes_order2) converts ISP 14-bit native format to 14-bit BE packed for DNG
#undef  CAM_SENSOR_BITS_PER_PIXEL
#define CAM_SENSOR_BITS_PER_PIXEL           14

// CFA pattern — RGGB confirmed from rawpy: raw_pattern=[[0,1],[3,2]], color_desc=RGBG
#define cam_CFAPattern                      0x02010100  // RGGB

// Black level — confirmed from CR2: 512 per channel
#undef  CAM_BLACK_LEVEL
#define CAM_BLACK_LEVEL                     512

// JPEG crop dimensions — confirmed from CR2 (rawpy crop_width/height)
#define CAM_JPEG_WIDTH                      4352
#define CAM_JPEG_HEIGHT                     2904

// Active sensor area — confirmed from CR2 (rawpy sizes: top_margin=50, left_margin=80)
#define CAM_ACTIVE_AREA_X1                  80
#define CAM_ACTIVE_AREA_Y1                  50
#define CAM_ACTIVE_AREA_X2                  4480
#define CAM_ACTIVE_AREA_Y2                  3366

// DNG color matrices — confirmed from LibRaw + Adobe DNG Converter (all versions agree)
// Illuminant1 = Standard Light A (2856K), Illuminant2 = D65 (6504K)
#define cam_CalibrationIlluminant1          17  // Standard Light A
#define cam_CalibrationIlluminant2          21  // D65
#define CAM_COLORMATRIX1 \
8138, 10000, -2281, 10000,  -659, 10000, \
-3453, 10000, 11006, 10000,  2816, 10000, \
-297, 10000,  1118, 10000,  6471, 10000
#define CAM_COLORMATRIX2 \
7378, 10000, -1255, 10000, -1043, 10000, \
-4088, 10000, 12251, 10000,  2048, 10000, \
-876, 10000,  1946, 10000,  5805, 10000
#define CAM_FORWARDMATRIX1 \
7310, 10000,   833, 10000,  1500, 10000, \
2013, 10000,  8875, 10000,  -888, 10000, \
34, 10000, -4122, 10000, 12339, 10000
#define CAM_FORWARDMATRIX2 \
7010, 10000,  1653, 10000,   980, 10000, \
2351, 10000,  9551, 10000, -1902, 10000, \
177, 10000, -2144, 10000, 10218, 10000
#define CAM_DNG_LENS_INFO                   { 125, 10, 625, 10, 20, 10, 39, 10 }

// Folder/file naming
#define PARAM_CAMERA_NAME           3   // parameter table entry 3, max_size=32 (matches cam_name[32] in dng.c)
#define CAM_FILE_COUNTER_IS_VAR     1   // use file_counter_var (0x00013c24) directly, not GetParameterData
#define CAM_DATE_FOLDER_NAMING      0x80    // GetImageFolder bit flag (0x80 = standard DCIM subfolder)

// Display
    // Digic 6 XIMR compositor; update_ui() in lib.c handles dimensions dynamically.
    // Buffer stride is 736 (hardware requirement), CHDK OSD is 360×240 (half-LCD, scaled ×2 by XIMR).
    #define DRAW_ON_ACTIVE_BITMAP_BUFFER_ONLY   1   // Draw pixels on active bitmap buffer only.
    #define CAM_HAS_DISPLAY_REFRESH_FLAG        1   // display_needs_refresh in lib.c triggers CHDK UI update
    #undef  CAM_BITMAP_WIDTH
    #undef  CAM_BITMAP_HEIGHT
    #undef  CAM_SCREEN_WIDTH
    #undef  CAM_SCREEN_HEIGHT
    #define CAM_BITMAP_WIDTH                    736 // Physical buffer stride
    #define CAM_BITMAP_HEIGHT                   480 // Actual height of bitmap screen in rows
    #define CAM_SCREEN_WIDTH                    360 // CHDK logical OSD width
    #define CAM_SCREEN_HEIGHT                   240 // CHDK logical OSD height

#define CAM_HAS_ERASE_BUTTON                1 // Manual Focus is identified by its secondary function since this mapping is more useful
#define CAM_SHOW_OSD_IN_SHOOT_MENU          1
#define CAM_CLEAN_OVERLAY                   1

#undef  EDGE_HMARGIN
#define EDGE_HMARGIN                        10

#define CAM_ZEBRA_NOBUF                     1

// Focus distance — verified on-camera MF sweep
// Min is wide-end macro; at full zoom min rises to ~400 (zoom-dependent, not modeled)
// Max deliberately omitted: encoder is unreliable near infinity (varies 50k-373k),
// Canon returns -1 for true infinity. DryOS default of 2000000 applies (camera.h:364).
#undef  CAMERA_MIN_DIST
#define CAMERA_MIN_DIST                     50

// Depth-of-field calculator
#undef  CAM_CIRCLE_OF_CONFUSION
#define CAM_CIRCLE_OF_CONFUSION             19  // 1.5"-type sensor (~18.7mm diagonal), ~19µm CoC

// Subject distance override for focus range
#define CAM_SD_OVER_IN_AFL                  1   // allow subject distance override in AF-Lock
#define CAM_SD_OVER_IN_MF                   1   // allow subject distance override in MF
//define CAM_SD_OVER_IN_AF deliberately omitted — confirmed to crash (as in g7x/sx710)

// AF assist lamp
#undef  CAM_AF_LED
#define CAM_AF_LED                          1

// USB remote
#undef  CAM_USB_EVENTID
#define CAM_USB_EVENTID                     0x202   // DryOS R49+ value; same as sx700hs (propset 6, R54)
#undef  REMOTE_SYNC_STATUS_LED
#define REMOTE_SYNC_STATUS_LED              -1      // -1 = use debug_led

// Filesystem
#define MKDIR_RETURN_ONE_ON_SUCCESS         1   // mkdir() returns 1 on success (DryOS R47+)
