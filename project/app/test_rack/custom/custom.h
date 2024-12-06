/*
* Copyright 2023 NXP
* NXP Confidential and Proprietary. This software is owned or controlled by NXP and may only be used strictly in
* accordance with the applicable license terms. By expressly accepting such terms or by downloading, installing,
* activating and/or otherwise using the software, you are agreeing that you have read, and that you agree to
* comply with and are bound by, such license terms.  If you do not agree to be bound by the applicable license
* terms, then you may not retain, install, activate or otherwise use the software.
*/

#ifndef __CUSTOM_H_
#define __CUSTOM_H_
#ifdef __cplusplus
extern "C" {
#endif

#include "gui_guider.h"


// 创建各个项目是否通过的结构体
typedef struct project_pass_t {
    int bee_pass;
    int cam_pass;
    int eth_pass;
    int key_pass;
    int sound_pass;
    int screen_pass;
    int tf_pass;
    int gpio_pass;
} project_pass_t;

void custom_init(lv_ui *ui);
void set_eth_pass_status(int status);
void set_eth_attr(int type,double value);
void set_eth_dect(int value);
void set_usb_dect(int value);
void set_tf_dect(int value);
void set_tf_attr(int type,double value);
void set_usb_attr(int type,double value);
void set_tf_pass_status(int status);
void set_usb_pass_status(int status);
void set_gpio_pass_status(int status);
int next_page();
void init_result();
void update_eth_result(int status,double send,double rcv);
void update_tf_result(int status,double write,double read);
void update_gpio_result(int status);
void update_key_result(int status);
void update_sound_result(int status);
void update_cam_result(int status);
void update_screen_result(int status);
void update_bee_result(int status);


#ifdef __cplusplus
}
#endif
#endif /* EVENT_CB_H_ */
