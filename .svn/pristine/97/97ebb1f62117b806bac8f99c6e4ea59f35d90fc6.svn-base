#include "platform.h"
#include "lolevel.h"
#include "live_view.h"
#include "levent.h"

extern int active_bitmap_buffer;
extern volatile char *opacity_buffer[];

void vid_bitmap_refresh() {
    extern void _transfer_src_overlay(int);
    int n = active_bitmap_buffer;
    _transfer_src_overlay(n);
    _transfer_src_overlay(n^1);
}

void shutdown()
{
    debug_led(1);
    PostLogicalEventForNotPowerType(levent_id_for_name("PressPowerButton"),0);
    while(1) msleep(100);
}

#define LED_PR 0xd20b0884 // green LED on the back

void debug_led(int state) {
    volatile long *p = (void*)LED_PR;
    *p = ((state) ? 0x4d0002 : 0x4c0003);
}

// Power Led = first entry in table (led 0)
// AF Assist Lamp = second entry in table (led 1)
void camera_set_led(int led, int state, __attribute__ ((unused))int bright) {
    static char led_table[2]={0,4};
    _LEDDrive(led_table[led%sizeof(led_table)], state<=1 ? !state : state);
}

void shutdown_soft() {
    _PostLogicalEventForNotPowerType(0x1005,0); // PressOffButton
}

int get_flash_params_count(void) {
    return 0xa6; // @fc0961ac GetParameterData FFTM
}

void JogDial_CW(void) {
    _PostLogicalEventToUI(0x872, 1);    //RotateJogDialRight
}

void JogDial_CCW(void) {
    _PostLogicalEventToUI(0x873, 1);    //RotateJogDialLeft
}


// updated by captseq_raw_addr_init_my in capt_seq, valid between shot start and raw hook end
extern  char*   current_raw_addr;

char *hook_raw_image_addr()
{
    return current_raw_addr;
}

char *hook_alt_raw_image_addr()
{
    return current_raw_addr;
}



// ***  Viewport buffer handling ***

extern void* viewport_buffers[];
extern void *current_viewport_buffer;

void *vid_get_viewport_fb() {
    return (void*)0x43312300; // @0xfc02a016
}

/*
 * playback viewport
 */

void *vid_get_viewport_fb_d()    {
    // based on suggestion from 62ndidiot in https://chdk.setepontos.com/index.php?topic=12532.msg129914#msg129914
    extern void *current_fb_d;
    return current_fb_d;
}

void *vid_get_viewport_live_fb()
{
    // current_viewport_buffer assummed not most recent, like g7x
    int i;
    for(i=0;i<4;i++) {
        if(current_viewport_buffer == viewport_buffers[i]) {
            return viewport_buffers[(i+1)&3];
        }
    }
    return 0;
}

static int vp_full_width = 720;
static int vp_full_buf_width = 736;
static int vp_full_height = 480;
static int lv_aspect = LV_ASPECT_4_3;

int vid_get_viewport_width() {
    extern int _GetVRAMHPixelsSize();
    if (camera_info.state.mode_play)
        return vp_full_width;
    return _GetVRAMHPixelsSize();
}

long vid_get_viewport_height() {
    extern int _GetVRAMVPixelsSize();
    if (camera_info.state.mode_play)
        return vp_full_height;
    return _GetVRAMVPixelsSize();
}

int vid_get_viewport_yoffset() {
    return 0;
}

// 0 = 4:3, 1 = 16:9, 2 = 3:2, 3 = 1:1
static long vp_xo[4] = { 0, 0, 0, 80 };

int vid_get_viewport_display_xoffset() {
    if (camera_info.state.mode_play)
        return 0;
    if(camera_info.state.mode_video || is_video_recording())
        return 0;
    return vp_xo[shooting_get_prop(PROPCASE_ASPECT_RATIO)];
}

// 0 = 4:3, 1 = 16:9, 2 = 3:2, 3 = 1:1
static long vp_yo[4] = { 0, 60, 28, 0 };

int vid_get_viewport_display_yoffset() {
    if (camera_info.state.mode_play)
        return 0;
    if(camera_info.state.mode_video || is_video_recording()) {
        if(shooting_get_prop(PROPCASE_VIDEO_RESOLUTION) == 2)
            return 0;
        else
            return 60;
    }
    return vp_yo[shooting_get_prop(PROPCASE_ASPECT_RATIO)];
}

extern char* bitmap_buffer[];

void *vid_get_bitmap_fb() {
    return bitmap_buffer[0];
}

int vid_get_viewport_byte_width() {
    return vp_full_buf_width * 2;
}

// Functions for PTP Live View system
int vid_get_viewport_display_xoffset_proper()   { return vid_get_viewport_display_xoffset(); }
int vid_get_viewport_display_yoffset_proper()   { return vid_get_viewport_display_yoffset(); }
int vid_get_viewport_fullscreen_width()         { return vp_full_width; }
int vid_get_viewport_fullscreen_height()        { return vp_full_height; }
int vid_get_viewport_buffer_width_proper()      { return vp_full_buf_width; }
int vid_get_aspect_ratio()                      { return lv_aspect; }
int vid_get_viewport_type()                     { return LV_FB_YUV8B; }

void *vid_get_bitmap_active_buffer() {
    return bitmap_buffer[active_bitmap_buffer&1];
}

// the opacity buffer defines opacity for the bitmap overlay's pixels
// found at 0xfc094eb0: cmp bitmap_buf 0x41421000 -> opacity 0x41721000 else 0x417e1000
// confirmed from sub_fc094e0e literal pool at 0xfc094f90/f94/f98
volatile char *opacity_buffer[2] = {(char*)0x41721000, (void*)0x417e1000};

// 0x10108 also appears to contain the active buffer
void *vid_get_opacity_active_buffer() {
    return (void *)opacity_buffer[active_bitmap_buffer&1];
}


// ---------------------------------------------------------------------------
// XIMR compositor hook for CAM_DRAW_RGBA
// ---------------------------------------------------------------------------

extern int displaytype;
#define hdmi_out     ((displaytype == 6) || (displaytype == 7))
#define hdmi_low_res (displaytype == 8)
#define analog_out   ((displaytype == 1) || (displaytype == 2))

// Ximr layer descriptor
typedef struct {
    unsigned char   unk1[7];
    unsigned char   scale;
    unsigned int    unk2;
    unsigned short  color_type;
    unsigned short  visibility;
    unsigned short  unk3;
    unsigned short  src_y;
    unsigned short  src_x;
    unsigned short  src_h;
    unsigned short  src_w;
    unsigned short  dst_y;
    unsigned short  dst_x;
    unsigned short  enabled;
    unsigned int    marv_sig;
    unsigned int    bitmap;
    unsigned int    opacity;
    unsigned int    color;
    unsigned int    width;
    unsigned int    height;
    unsigned int    unk4;
} ximr_layer;

// Ximr context block passed to update_ui
typedef struct {
    unsigned short  unk1;
    unsigned short  width1;
    unsigned short  height1;
    unsigned short  unk2[17];
    unsigned int    output_marv_sig;
    unsigned int    output_buf;
    unsigned int    output_opacitybuf;
    unsigned int    output_color;
    int             buffer_width;
    int             buffer_height;
    unsigned int    unk3[2];
    ximr_layer      layers[8];
    unsigned int    unk4[24];
    unsigned char   denomx;
    unsigned char   numerx;
    unsigned char   denomy;
    unsigned char   numery;
    unsigned int    unk5;
    short           width;
    short           height;
    unsigned int    unk6[27];
} ximr_context;

int display_needs_refresh = 0;

// fw_yuv_layer_buf: address of Canon's YUV compositor output buffer.
// CHDK RGBA buffer is placed immediately after it.
// Size = 960*270*2 (same as sx710hs; half-height YUV at compositor resolution).
extern const unsigned fw_yuv_layer_buf;
#define FW_YUV_LAYER_SIZE   (960*270*2)

// CHDK bitmap dimensions (half of 720x480, scaled x2 by XIMR)
#define CB_W    480
#define CB_H    270

unsigned char *chdk_rgba = 0;
static int chdk_rgba_init = 0;
static int bm_w = CB_W;
static int bm_h = CB_H;

void vid_bitmap_erase()
{
    extern void _bzero(void *s, int n);
    _bzero(chdk_rgba, CB_W * bm_h * 4);
}

static int last_displaytype = -1;

/*
 * Called from debug_logging_my() (boot.c) each time Canon's XIMR compositor
 * fires an XimrExe / XimrExeGain message.  Sets up the CHDK RGBA layer and
 * updates camera_screen dimensions on display-type changes.
 */
void update_ui(ximr_context *ximr)
{
    // One-time init: allocate CHDK RGBA buffer after the firmware YUV buffer
    if (chdk_rgba_init == 0) {
        chdk_rgba_init = 1;
        chdk_rgba = (unsigned char *)(fw_yuv_layer_buf + FW_YUV_LAYER_SIZE);
        vid_bitmap_erase();
        last_displaytype = -1;
    }

    if (ximr->output_buf != fw_yuv_layer_buf) {
        // Update CHDK bitmap/screen dimensions when display type changes
        if (last_displaytype != displaytype) {
            last_displaytype = displaytype;

            if (hdmi_out) {
                bm_w = 480;
                bm_h = 240;
                vp_full_width = 1920;
                vp_full_buf_width = 1920;
                vp_full_height = 1080;
                lv_aspect = LV_ASPECT_16_9;
            } else {
                // LCD (720×480, 3:2) or TV/analog out
                lv_aspect = LV_ASPECT_4_3;
                bm_w = 360;
                bm_h = 240;
                vp_full_width = 720;
                vp_full_buf_width = 736;
                vp_full_height = 480;
            }

            camera_screen.width = bm_w;
            camera_screen.height = bm_h;
            camera_screen.buffer_width = CB_W;
            camera_screen.buffer_height = bm_h;
            camera_screen.physical_width = bm_w;
            camera_screen.disp_right = bm_w - 1;
            camera_screen.disp_width = bm_w;
            camera_screen.size = bm_w * bm_h;
            camera_screen.buffer_size = CB_W * bm_h;

            camera_screen.yuvbm_width = ximr->width;
            camera_screen.yuvbm_height = ximr->height;
            camera_screen.yuvbm_buffer_width = ximr->buffer_width;
            camera_screen.yuvbm_buffer_size = camera_screen.yuvbm_buffer_width * camera_screen.yuvbm_height;

            extern void gui_set_need_redraw();
            gui_set_need_redraw();
            vid_bitmap_erase();
            display_needs_refresh = 1;
        }

        // Canon YUV layer: enable x2 vertical scaling
        if (ximr->layers[1].bitmap == fw_yuv_layer_buf && ximr->layers[1].enabled) {
            ximr->layers[1].scale = 4;
        }

        if (chdk_rgba != 0) {
            // Attach CHDK RGBA overlay as layer 3 (copy geometry from Canon layer 0)
            memcpy(&ximr->layers[3], &ximr->layers[0], sizeof(ximr_layer));
            ximr->layers[3].scale  = 6;      // x2 in both axes
            ximr->layers[3].src_w  = bm_w;
            ximr->layers[3].src_h  = bm_h;
            ximr->layers[3].dst_x  = 0;
            ximr->layers[3].dst_y  = 0;
            ximr->layers[3].bitmap = (unsigned int)chdk_rgba;
            ximr->layers[3].width  = CB_W;
            ximr->layers[3].height = bm_h;
            ximr->unk2[0] = 0x500;
        }
    } else {
        ximr->height = ximr->buffer_height = 240;
        ximr->denomy = 30;
    }
}

char *camera_jpeg_count_str()
{
    extern char jpeg_count_str[];
    return jpeg_count_str;
}
