#include "lolevel.h"
#include "platform.h"
#include "core.h"

const char * const new_sa = &_end;

extern void handle_jogdial();

void spytask(long ua, long ub, long uc, long ud, long ue, long uf)
{
    (void)ua; (void)ub; (void)uc; (void)ud; (void)ue; (void)uf;
    core_spytask();
}

void CreateTask_spytask()
{
    _CreateTask("SpyTask", 0x19, 0x2000, spytask, 0);
}

void __attribute__((naked,noinline))
debug_logging_my(char* fmt, ...)
{
    (void)fmt;
    asm volatile (
            "    ldr     r0, =mzrm_sendmsg_ret_adr\n"
            "    cmp     r0, lr\n"
            "    beq     chk_msg_type\n"
            "exit_debug_logging_my:\n"
            "    bx      lr\n"

            "chk_msg_type:\n"
            "    ldr     r1, [r11]\n"
            "    cmp     r1, 0x21\n"
            "    beq     do_ui_update\n"
            "    cmp     r1, 0x22\n"
            "    bne     exit_debug_logging_my\n"
            "do_ui_update:\n"
            "    ldr     r0, [r11,0x0c]\n"
            "    b       update_ui\n"
    );
}

void patch_mzrm_sendmsg()
{
    extern int debug_logging_flag;
    extern void (*debug_logging_ptr)(char* fmt, ...);
    debug_logging_flag = 0x200;
    debug_logging_ptr = debug_logging_my;
}

void __attribute__((naked,noinline)) CreateTask_my()
{
    asm volatile (
        "    push   {r0}\n"

        "    ldr     r0, =task_CaptSeq\n"
        "    cmp     r0, r3\n"
        "    itt     eq\n"
        "    ldreq   r3, =capt_seq_task\n"
        "    orreq   r3, #1\n"
        "    beq     exitHook\n"

        "    LDR     R0, =task_ExpDrv\n"
        "    CMP     R0, R3\n"
        "    itt     eq\n"
        "    LDREQ   R3, =exp_drv_task\n"
        "    orreq   r3, #1\n"
        "    BEQ     exitHook\n"

        "    ldr     r0, =task_FileWrite\n"
        "    cmp     r0, r3\n"
        "    itt     eq\n"
        "    ldreq   r3, =filewritetask\n"
        "    orreq   r3, #1\n"
        "    beq     exitHook\n"

        "    ldr     r0, =task_TricInitTask\n"
        "    cmp     r0, r3\n"
        "    itt     eq\n"
        "    ldreq   r3, =task_TricInitTask_my\n"
        "    orreq   r3, #1\n"
        "    BEQ     exitHook\n"

        "    ldr     r0, =task_InitFileModules\n"
        "    cmp     r0, r3\n"
        "    itt     eq\n"
        "    ldreq   r3, =init_file_modules_task\n"
        "    orreq   r3, #1\n"

        "exitHook:\n"
        "    pop    {r0}\n"
        "    stmdb   sp!, {r1, r2, r3, r4, r5, r6, r7, r8, r9, lr}\n"
        "    mov     r4, r0\n"
        "    ldr     r0, =0x0000815c\n"
        "    ldr.w   pc, =(hook_CreateTask + 8 + 1)\n"
        ".ltorg\n"
    );
}

/*
 * ** TEMPORARY? workaround ***
 * Init stuff to avoid asserts on cameras running DryOS r54+
 * https://chdk.setepontos.com/index.php?topic=12516.0
 * Execute this only once
 */
void init_required_fw_features(void)
{
    extern void _init_focus_eventflag();
    extern void _init_nd_eventflag();
    extern int av_override_semaphore;
    extern int _CreateBinarySemaphoreStrictly(int x, int y);
    _init_focus_eventflag();
    _init_nd_eventflag();
    av_override_semaphore = _CreateBinarySemaphoreStrictly(0, 0);
}
