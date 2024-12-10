/*
* Copyright 2024 NXP
* NXP Confidential and Proprietary. This software is owned or controlled by NXP and may only be used strictly in
* accordance with the applicable license terms. By expressly accepting such terms or by downloading, installing,
* activating and/or otherwise using the software, you are agreeing that you have read, and that you agree to
* comply with and are bound by, such license terms.  If you do not agree to be bound by the applicable license
* terms, then you may not retain, install, activate or otherwise use the software.
*/

#ifndef GUI_GUIDER_H
#define GUI_GUIDER_H
#ifdef __cplusplus
extern "C" {
#endif

#include "lvgl.h"

typedef struct
{
  
	lv_obj_t *screen;
	bool screen_del;
	lv_obj_t *screen_list;
	lv_obj_t *screen_list_tab_1;
	lv_obj_t *screen_list_tab_2;
	lv_obj_t *screen_list_tab_3;
	lv_obj_t *screen_list_tab_4;
	lv_obj_t *screen_list_tab_5;
	lv_obj_t *screen_list_tab_6;
	lv_obj_t *screen_list_tab_7;
	lv_obj_t *screen_canvas_1;
	lv_obj_t *screen_label_2;
	lv_obj_t *screen_test_btn;
	lv_obj_t *screen_test_btn_label;
	lv_obj_t *screen_canvas_2;
	lv_obj_t *screen_canvas_4;
	lv_obj_t *screen_label_5;
	lv_obj_t *screen_eth_pass;
	lv_obj_t *screen_tf_pass;
	lv_obj_t *screen_gpio_pass;
	lv_obj_t *screen_label_7;
	lv_obj_t *screen_tf_no_pass;
	lv_obj_t *screen_eth_no_pass;
	lv_obj_t *screen_gpio_no_pass;
	lv_obj_t *screen_eth_btn;
	lv_obj_t *screen_eth_btn_label;
	lv_obj_t *screen_tf_btn;
	lv_obj_t *screen_tf_btn_label;
	lv_obj_t *screen_gpio_btn;
	lv_obj_t *screen_gpio_btn_label;
	lv_obj_t *screen_label_3;
	lv_obj_t *screen_label_8;
	lv_obj_t *screen_label_4;
	lv_obj_t *screen_label_11;
	lv_obj_t *screen_label_14;
	lv_obj_t *screen_label_15;
	lv_obj_t *screen_eth_send;
	lv_obj_t *screen_tf_write;
	lv_obj_t *screen_eth_rcv;
	lv_obj_t *screen_tf_read;
	lv_obj_t *screen_eth_status;
	lv_obj_t *screen_tf_status;
	lv_obj_t *screen_eth_test;
	lv_obj_t *screen_gpio_test;
	lv_obj_t *screen_tf_test;
	lv_obj_t *screen_single_test_sw;
	lv_obj_t *screen_label_20;
	lv_obj_t *screen_adc_key;
	lv_obj_t *screen_rec_key;
	lv_obj_t *screen_label_17;
	lv_obj_t *screen_label_18;
	lv_obj_t *screen_key_no_pass_btn;
	lv_obj_t *screen_key_no_pass_btn_label;
	lv_obj_t *screen_key_use;
	lv_obj_t *screen_key_use_item0;
	lv_obj_t *screen_use_key;
	lv_obj_t *screen_sound_pass_btn;
	lv_obj_t *screen_sound_pass_btn_label;
	lv_obj_t *screen_sound_no_pass_mic_btn;
	lv_obj_t *screen_sound_no_pass_mic_btn_label;
	lv_obj_t *screen_start_btn;
	lv_obj_t *screen_start_btn_label;
	lv_obj_t *screen_use_sound;
	lv_obj_t *screen_sound_use;
	lv_obj_t *screen_sound_use_item0;
	lv_obj_t *screen_sound_no_pass_spk_btn;
	lv_obj_t *screen_sound_no_pass_spk_btn_label;
	lv_obj_t *screen_cam_no_pass_btn;
	lv_obj_t *screen_cam_no_pass_btn_label;
	lv_obj_t *screen_cam_pass_btn;
	lv_obj_t *screen_cam_pass_btn_label;
	lv_obj_t *screen_cam_btn;
	lv_obj_t *screen_cam_btn_label;
	lv_obj_t *screen_use_cam;
	lv_obj_t *screen_cam_use;
	lv_obj_t *screen_cam_use_item0;
	lv_obj_t *screen_screen_pass_btn;
	lv_obj_t *screen_screen_pass_btn_label;
	lv_obj_t *screen_screen_no_pass_btn;
	lv_obj_t *screen_screen_no_pass_btn_label;
	lv_obj_t *screen_red;
	lv_obj_t *screen_green;
	lv_obj_t *screen_blue;
	lv_obj_t *screen_use_screen;
	lv_obj_t *screen_screen_use;
	lv_obj_t *screen_screen_use_item0;
	lv_obj_t *screen_bee_no_pass_btn;
	lv_obj_t *screen_bee_no_pass_btn_label;
	lv_obj_t *screen_bee_pass_btn;
	lv_obj_t *screen_bee_pass_btn_label;
	lv_obj_t *screen_bee_btn;
	lv_obj_t *screen_bee_btn_label;
	lv_obj_t *screen_use_bee;
	lv_obj_t *screen_bee_use;
	lv_obj_t *screen_bee_use_item0;
	lv_obj_t *screen_table_1;
	lv_obj_t *screen_seaa;
	lv_obj_t *screen_label_19;
	lv_obj_t *screen_serial;
	lv_obj_t *screen_pass_result;
	lv_obj_t *screen_no_pass_result;
	lv_obj_t *screen_label_1;
}lv_ui;

typedef void (*ui_setup_scr_t)(lv_ui * ui);

void ui_init_style(lv_style_t * style);

void ui_load_scr_animation(lv_ui *ui, lv_obj_t ** new_scr, bool new_scr_del, bool * old_scr_del, ui_setup_scr_t setup_scr,
                           lv_scr_load_anim_t anim_type, uint32_t time, uint32_t delay, bool is_clean, bool auto_del);

void ui_move_animation(void * var, int32_t duration, int32_t delay, int32_t x_end, int32_t y_end, lv_anim_path_cb_t path_cb,
                       uint16_t repeat_cnt, uint32_t repeat_delay, uint32_t playback_time, uint32_t playback_delay,
                       lv_anim_start_cb_t start_cb, lv_anim_ready_cb_t ready_cb, lv_anim_deleted_cb_t deleted_cb);

void ui_scale_animation(void * var, int32_t duration, int32_t delay, int32_t width, int32_t height, lv_anim_path_cb_t path_cb,
                        uint16_t repeat_cnt, uint32_t repeat_delay, uint32_t playback_time, uint32_t playback_delay,
                        lv_anim_start_cb_t start_cb, lv_anim_ready_cb_t ready_cb, lv_anim_deleted_cb_t deleted_cb);

void ui_img_zoom_animation(void * var, int32_t duration, int32_t delay, int32_t zoom, lv_anim_path_cb_t path_cb,
                           uint16_t repeat_cnt, uint32_t repeat_delay, uint32_t playback_time, uint32_t playback_delay,
                           lv_anim_start_cb_t start_cb, lv_anim_ready_cb_t ready_cb, lv_anim_deleted_cb_t deleted_cb);

void ui_img_rotate_animation(void * var, int32_t duration, int32_t delay, lv_coord_t x, lv_coord_t y, int32_t rotate,
                   lv_anim_path_cb_t path_cb, uint16_t repeat_cnt, uint32_t repeat_delay, uint32_t playback_time,
                   uint32_t playback_delay, lv_anim_start_cb_t start_cb, lv_anim_ready_cb_t ready_cb, lv_anim_deleted_cb_t deleted_cb);

void init_scr_del_flag(lv_ui *ui);

void setup_ui(lv_ui *ui);


extern lv_ui guider_ui;


void setup_scr_screen(lv_ui *ui);
LV_IMG_DECLARE(_pass_alpha_100x100);
LV_IMG_DECLARE(_pass_alpha_100x100);
LV_IMG_DECLARE(_pass_alpha_100x100);
LV_IMG_DECLARE(_no_pass_alpha_100x100);
LV_IMG_DECLARE(_no_pass_alpha_100x100);
LV_IMG_DECLARE(_no_pass_alpha_100x100);
LV_IMG_DECLARE(_test_alpha_100x100);
LV_IMG_DECLARE(_test_alpha_100x100);
LV_IMG_DECLARE(_test_alpha_100x100);
LV_IMG_DECLARE(_use_2_alpha_50x50);
LV_IMG_DECLARE(_use_2_alpha_50x50);
LV_IMG_DECLARE(_use_2_alpha_50x50);
LV_IMG_DECLARE(_use_2_alpha_50x50);
LV_IMG_DECLARE(_use_2_alpha_50x50);
LV_IMG_DECLARE(_pass_alpha_160x160);
LV_IMG_DECLARE(_no_pass_alpha_160x160);

LV_FONT_DECLARE(lv_font_SourceHanSerifCN2_20)
LV_FONT_DECLARE(lv_font_SourceHanSerifCN2_12)
LV_FONT_DECLARE(lv_font_SourceHanSerifCN2_16)
LV_FONT_DECLARE(lv_font_SourceHanSerifCN2_36)
LV_FONT_DECLARE(lv_font_SourceHanSerifCN2_24)
LV_FONT_DECLARE(lv_font_SourceHanSerifCN2_23)
LV_FONT_DECLARE(lv_font_Amiko_Regular_16)


#ifdef __cplusplus
}
#endif
#endif
