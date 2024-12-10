/*
* Copyright 2024 NXP
* NXP Confidential and Proprietary. This software is owned or controlled by NXP and may only be used strictly in
* accordance with the applicable license terms. By expressly accepting such terms or by downloading, installing,
* activating and/or otherwise using the software, you are agreeing that you have read, and that you agree to
* comply with and are bound by, such license terms.  If you do not agree to be bound by the applicable license
* terms, then you may not retain, install, activate or otherwise use the software.
*/

#include "lvgl.h"
#include <stdio.h>
#include "gui_guider.h"
#include "events_init.h"
#include "widgets_init.h"
#include "custom.h"



void setup_scr_screen(lv_ui *ui)
{
	//Write codes screen
	ui->screen = lv_obj_create(NULL);
	lv_obj_set_size(ui->screen, 800, 480);
	lv_obj_set_scrollbar_mode(ui->screen, LV_SCROLLBAR_MODE_OFF);

	//Write style for screen, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen, lv_color_hex(0xe9e9e9), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_list
	ui->screen_list = lv_tabview_create(ui->screen, LV_DIR_TOP, 50);
	lv_obj_set_pos(ui->screen_list, 0, 38);
	lv_obj_set_size(ui->screen_list, 800, 440);
	lv_obj_set_scrollbar_mode(ui->screen_list, LV_SCROLLBAR_MODE_OFF);

	//Write style for screen_list, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_list, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_list, lv_color_hex(0xeaeff3), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_list, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_list, lv_color_hex(0x4d4d4d), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_list, &lv_font_SourceHanSerifCN2_20, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_list, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_letter_space(ui->screen_list, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_line_space(ui->screen_list, 20, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_border_width(ui->screen_list, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_list, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_list, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write style state: LV_STATE_DEFAULT for &style_screen_list_extra_btnm_main_default
	static lv_style_t style_screen_list_extra_btnm_main_default;
	ui_init_style(&style_screen_list_extra_btnm_main_default);
	
	lv_style_set_bg_opa(&style_screen_list_extra_btnm_main_default, 255);
	lv_style_set_bg_color(&style_screen_list_extra_btnm_main_default, lv_color_hex(0xffffff));
	lv_style_set_bg_grad_dir(&style_screen_list_extra_btnm_main_default, LV_GRAD_DIR_NONE);
	lv_style_set_border_width(&style_screen_list_extra_btnm_main_default, 0);
	lv_style_set_radius(&style_screen_list_extra_btnm_main_default, 0);
	lv_obj_add_style(lv_tabview_get_tab_btns(ui->screen_list), &style_screen_list_extra_btnm_main_default, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write style state: LV_STATE_DEFAULT for &style_screen_list_extra_btnm_items_default
	static lv_style_t style_screen_list_extra_btnm_items_default;
	ui_init_style(&style_screen_list_extra_btnm_items_default);
	
	lv_style_set_text_color(&style_screen_list_extra_btnm_items_default, lv_color_hex(0x4d4d4d));
	lv_style_set_text_font(&style_screen_list_extra_btnm_items_default, &lv_font_SourceHanSerifCN2_12);
	lv_style_set_text_opa(&style_screen_list_extra_btnm_items_default, 255);
	lv_obj_add_style(lv_tabview_get_tab_btns(ui->screen_list), &style_screen_list_extra_btnm_items_default, LV_PART_ITEMS|LV_STATE_DEFAULT);

	//Write style state: LV_STATE_CHECKED for &style_screen_list_extra_btnm_items_checked
	static lv_style_t style_screen_list_extra_btnm_items_checked;
	ui_init_style(&style_screen_list_extra_btnm_items_checked);
	
	lv_style_set_text_color(&style_screen_list_extra_btnm_items_checked, lv_color_hex(0x2195f6));
	lv_style_set_text_font(&style_screen_list_extra_btnm_items_checked, &lv_font_SourceHanSerifCN2_12);
	lv_style_set_text_opa(&style_screen_list_extra_btnm_items_checked, 255);
	lv_style_set_border_width(&style_screen_list_extra_btnm_items_checked, 4);
	lv_style_set_border_opa(&style_screen_list_extra_btnm_items_checked, 255);
	lv_style_set_border_color(&style_screen_list_extra_btnm_items_checked, lv_color_hex(0x2195f6));
	lv_style_set_border_side(&style_screen_list_extra_btnm_items_checked, LV_BORDER_SIDE_BOTTOM);
	lv_style_set_radius(&style_screen_list_extra_btnm_items_checked, 0);
	lv_style_set_bg_opa(&style_screen_list_extra_btnm_items_checked, 60);
	lv_style_set_bg_color(&style_screen_list_extra_btnm_items_checked, lv_color_hex(0x2195f6));
	lv_style_set_bg_grad_dir(&style_screen_list_extra_btnm_items_checked, LV_GRAD_DIR_NONE);
	lv_obj_add_style(lv_tabview_get_tab_btns(ui->screen_list), &style_screen_list_extra_btnm_items_checked, LV_PART_ITEMS|LV_STATE_CHECKED);

	//Write codes AUTO
	ui->screen_list_tab_1 = lv_tabview_add_tab(ui->screen_list,"AUTO");
	lv_obj_t * screen_list_tab_1_label = lv_label_create(ui->screen_list_tab_1);
	lv_label_set_text(screen_list_tab_1_label, "\n");

	//Write codes screen_canvas_1
	ui->screen_canvas_1 = lv_canvas_create(ui->screen_list_tab_1);
	static lv_color_t buf_screen_canvas_1[240*300*4];
	lv_canvas_set_buffer(ui->screen_canvas_1, buf_screen_canvas_1, 240, 300, LV_IMG_CF_TRUE_COLOR_ALPHA);
	lv_canvas_fill_bg(ui->screen_canvas_1, lv_color_hex(0xffffff), 255);
	lv_obj_set_pos(ui->screen_canvas_1, 0, 0);
	lv_obj_set_size(ui->screen_canvas_1, 240, 300);
	lv_obj_set_scrollbar_mode(ui->screen_canvas_1, LV_SCROLLBAR_MODE_OFF);

	//Write codes screen_label_2
	ui->screen_label_2 = lv_label_create(ui->screen_list_tab_1);
	lv_label_set_text(ui->screen_label_2, "网口测试");
	lv_label_set_long_mode(ui->screen_label_2, LV_LABEL_LONG_WRAP);
	lv_obj_set_pos(ui->screen_label_2, 40, 10);
	lv_obj_set_size(ui->screen_label_2, 160, 20);

	//Write style for screen_label_2, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_border_width(ui->screen_label_2, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_label_2, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_label_2, lv_color_hex(0x000000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_label_2, &lv_font_SourceHanSerifCN2_16, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_label_2, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_letter_space(ui->screen_label_2, 2, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_line_space(ui->screen_label_2, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_label_2, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_opa(ui->screen_label_2, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_top(ui->screen_label_2, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_right(ui->screen_label_2, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_bottom(ui->screen_label_2, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_left(ui->screen_label_2, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_label_2, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_test_btn
	ui->screen_test_btn = lv_btn_create(ui->screen_list_tab_1);
	ui->screen_test_btn_label = lv_label_create(ui->screen_test_btn);
	lv_label_set_text(ui->screen_test_btn_label, "一键测试");
	lv_label_set_long_mode(ui->screen_test_btn_label, LV_LABEL_LONG_WRAP);
	lv_obj_align(ui->screen_test_btn_label, LV_ALIGN_CENTER, 0, 0);
	lv_obj_set_style_pad_all(ui->screen_test_btn, 0, LV_STATE_DEFAULT);
	lv_obj_set_width(ui->screen_test_btn_label, LV_PCT(100));
	lv_obj_set_pos(ui->screen_test_btn, 301, 316);
	lv_obj_set_size(ui->screen_test_btn, 160, 40);

	//Write style for screen_test_btn, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_test_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_test_btn, lv_color_hex(0x2195f6), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_test_btn, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_border_width(ui->screen_test_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_test_btn, 5, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_test_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_test_btn, lv_color_hex(0xffffff), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_test_btn, &lv_font_SourceHanSerifCN2_16, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_test_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_test_btn, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_canvas_2
	ui->screen_canvas_2 = lv_canvas_create(ui->screen_list_tab_1);
	static lv_color_t buf_screen_canvas_2[240*300*4];
	lv_canvas_set_buffer(ui->screen_canvas_2, buf_screen_canvas_2, 240, 300, LV_IMG_CF_TRUE_COLOR_ALPHA);
	lv_canvas_fill_bg(ui->screen_canvas_2, lv_color_hex(0xffffff), 255);
	lv_obj_set_pos(ui->screen_canvas_2, 260, 0);
	lv_obj_set_size(ui->screen_canvas_2, 240, 300);
	lv_obj_set_scrollbar_mode(ui->screen_canvas_2, LV_SCROLLBAR_MODE_OFF);

	//Write codes screen_canvas_4
	ui->screen_canvas_4 = lv_canvas_create(ui->screen_list_tab_1);
	static lv_color_t buf_screen_canvas_4[240*300*4];
	lv_canvas_set_buffer(ui->screen_canvas_4, buf_screen_canvas_4, 240, 300, LV_IMG_CF_TRUE_COLOR_ALPHA);
	lv_canvas_fill_bg(ui->screen_canvas_4, lv_color_hex(0xffffff), 255);
	lv_obj_set_pos(ui->screen_canvas_4, 525, 0);
	lv_obj_set_size(ui->screen_canvas_4, 240, 300);
	lv_obj_set_scrollbar_mode(ui->screen_canvas_4, LV_SCROLLBAR_MODE_OFF);

	//Write codes screen_label_5
	ui->screen_label_5 = lv_label_create(ui->screen_list_tab_1);
	lv_label_set_text(ui->screen_label_5, "TF卡测试");
	lv_label_set_long_mode(ui->screen_label_5, LV_LABEL_LONG_WRAP);
	lv_obj_set_pos(ui->screen_label_5, 330, 9);
	lv_obj_set_size(ui->screen_label_5, 100, 20);

	//Write style for screen_label_5, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_border_width(ui->screen_label_5, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_label_5, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_label_5, lv_color_hex(0x000000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_label_5, &lv_font_SourceHanSerifCN2_16, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_label_5, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_letter_space(ui->screen_label_5, 2, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_line_space(ui->screen_label_5, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_label_5, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_opa(ui->screen_label_5, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_top(ui->screen_label_5, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_right(ui->screen_label_5, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_bottom(ui->screen_label_5, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_left(ui->screen_label_5, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_label_5, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_eth_pass
	ui->screen_eth_pass = lv_img_create(ui->screen_list_tab_1);
	lv_obj_add_flag(ui->screen_eth_pass, LV_OBJ_FLAG_CLICKABLE);
	lv_img_set_src(ui->screen_eth_pass, &_pass_alpha_100x100);
	lv_img_set_pivot(ui->screen_eth_pass, 50,50);
	lv_img_set_angle(ui->screen_eth_pass, 0);
	lv_obj_set_pos(ui->screen_eth_pass, 70, 40);
	lv_obj_set_size(ui->screen_eth_pass, 100, 100);
	lv_obj_add_flag(ui->screen_eth_pass, LV_OBJ_FLAG_HIDDEN);

	//Write style for screen_eth_pass, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_img_opa(ui->screen_eth_pass, 255, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_tf_pass
	ui->screen_tf_pass = lv_img_create(ui->screen_list_tab_1);
	lv_obj_add_flag(ui->screen_tf_pass, LV_OBJ_FLAG_CLICKABLE);
	lv_img_set_src(ui->screen_tf_pass, &_pass_alpha_100x100);
	lv_img_set_pivot(ui->screen_tf_pass, 50,50);
	lv_img_set_angle(ui->screen_tf_pass, 0);
	lv_obj_set_pos(ui->screen_tf_pass, 330, 40);
	lv_obj_set_size(ui->screen_tf_pass, 100, 100);
	lv_obj_add_flag(ui->screen_tf_pass, LV_OBJ_FLAG_HIDDEN);

	//Write style for screen_tf_pass, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_img_opa(ui->screen_tf_pass, 255, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_gpio_pass
	ui->screen_gpio_pass = lv_img_create(ui->screen_list_tab_1);
	lv_obj_add_flag(ui->screen_gpio_pass, LV_OBJ_FLAG_CLICKABLE);
	lv_img_set_src(ui->screen_gpio_pass, &_pass_alpha_100x100);
	lv_img_set_pivot(ui->screen_gpio_pass, 50,50);
	lv_img_set_angle(ui->screen_gpio_pass, 0);
	lv_obj_set_pos(ui->screen_gpio_pass, 595, 40);
	lv_obj_set_size(ui->screen_gpio_pass, 100, 100);
	lv_obj_add_flag(ui->screen_gpio_pass, LV_OBJ_FLAG_HIDDEN);

	//Write style for screen_gpio_pass, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_img_opa(ui->screen_gpio_pass, 255, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_label_7
	ui->screen_label_7 = lv_label_create(ui->screen_list_tab_1);
	lv_label_set_text(ui->screen_label_7, "gpio测试");
	lv_label_set_long_mode(ui->screen_label_7, LV_LABEL_LONG_WRAP);
	lv_obj_set_pos(ui->screen_label_7, 595, 10);
	lv_obj_set_size(ui->screen_label_7, 100, 20);

	//Write style for screen_label_7, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_border_width(ui->screen_label_7, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_label_7, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_label_7, lv_color_hex(0x000000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_label_7, &lv_font_SourceHanSerifCN2_16, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_label_7, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_letter_space(ui->screen_label_7, 2, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_line_space(ui->screen_label_7, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_label_7, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_opa(ui->screen_label_7, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_top(ui->screen_label_7, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_right(ui->screen_label_7, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_bottom(ui->screen_label_7, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_left(ui->screen_label_7, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_label_7, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_tf_no_pass
	ui->screen_tf_no_pass = lv_img_create(ui->screen_list_tab_1);
	lv_obj_add_flag(ui->screen_tf_no_pass, LV_OBJ_FLAG_CLICKABLE);
	lv_img_set_src(ui->screen_tf_no_pass, &_no_pass_alpha_100x100);
	lv_img_set_pivot(ui->screen_tf_no_pass, 50,50);
	lv_img_set_angle(ui->screen_tf_no_pass, 0);
	lv_obj_set_pos(ui->screen_tf_no_pass, 330, 40);
	lv_obj_set_size(ui->screen_tf_no_pass, 100, 100);

	//Write style for screen_tf_no_pass, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_img_opa(ui->screen_tf_no_pass, 255, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_eth_no_pass
	ui->screen_eth_no_pass = lv_img_create(ui->screen_list_tab_1);
	lv_obj_add_flag(ui->screen_eth_no_pass, LV_OBJ_FLAG_CLICKABLE);
	lv_img_set_src(ui->screen_eth_no_pass, &_no_pass_alpha_100x100);
	lv_img_set_pivot(ui->screen_eth_no_pass, 50,50);
	lv_img_set_angle(ui->screen_eth_no_pass, 0);
	lv_obj_set_pos(ui->screen_eth_no_pass, 70, 40);
	lv_obj_set_size(ui->screen_eth_no_pass, 100, 100);

	//Write style for screen_eth_no_pass, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_img_opa(ui->screen_eth_no_pass, 255, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_gpio_no_pass
	ui->screen_gpio_no_pass = lv_img_create(ui->screen_list_tab_1);
	lv_obj_add_flag(ui->screen_gpio_no_pass, LV_OBJ_FLAG_CLICKABLE);
	lv_img_set_src(ui->screen_gpio_no_pass, &_no_pass_alpha_100x100);
	lv_img_set_pivot(ui->screen_gpio_no_pass, 50,50);
	lv_img_set_angle(ui->screen_gpio_no_pass, 0);
	lv_obj_set_pos(ui->screen_gpio_no_pass, 595, 40);
	lv_obj_set_size(ui->screen_gpio_no_pass, 100, 100);

	//Write style for screen_gpio_no_pass, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_img_opa(ui->screen_gpio_no_pass, 255, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_eth_btn
	ui->screen_eth_btn = lv_btn_create(ui->screen_list_tab_1);
	ui->screen_eth_btn_label = lv_label_create(ui->screen_eth_btn);
	lv_label_set_text(ui->screen_eth_btn_label, "测试");
	lv_label_set_long_mode(ui->screen_eth_btn_label, LV_LABEL_LONG_WRAP);
	lv_obj_align(ui->screen_eth_btn_label, LV_ALIGN_CENTER, 0, 0);
	lv_obj_set_style_pad_all(ui->screen_eth_btn, 0, LV_STATE_DEFAULT);
	lv_obj_set_width(ui->screen_eth_btn_label, LV_PCT(100));
	lv_obj_set_pos(ui->screen_eth_btn, 85, 250);
	lv_obj_set_size(ui->screen_eth_btn, 70, 40);
	lv_obj_add_flag(ui->screen_eth_btn, LV_OBJ_FLAG_HIDDEN);

	//Write style for screen_eth_btn, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_eth_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_eth_btn, lv_color_hex(0x2195f6), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_eth_btn, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_border_width(ui->screen_eth_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_eth_btn, 5, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_eth_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_eth_btn, lv_color_hex(0xffffff), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_eth_btn, &lv_font_SourceHanSerifCN2_16, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_eth_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_eth_btn, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_tf_btn
	ui->screen_tf_btn = lv_btn_create(ui->screen_list_tab_1);
	ui->screen_tf_btn_label = lv_label_create(ui->screen_tf_btn);
	lv_label_set_text(ui->screen_tf_btn_label, "测试");
	lv_label_set_long_mode(ui->screen_tf_btn_label, LV_LABEL_LONG_WRAP);
	lv_obj_align(ui->screen_tf_btn_label, LV_ALIGN_CENTER, 0, 0);
	lv_obj_set_style_pad_all(ui->screen_tf_btn, 0, LV_STATE_DEFAULT);
	lv_obj_set_width(ui->screen_tf_btn_label, LV_PCT(100));
	lv_obj_set_pos(ui->screen_tf_btn, 345, 250);
	lv_obj_set_size(ui->screen_tf_btn, 70, 40);
	lv_obj_add_flag(ui->screen_tf_btn, LV_OBJ_FLAG_HIDDEN);

	//Write style for screen_tf_btn, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_tf_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_tf_btn, lv_color_hex(0x2195f6), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_tf_btn, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_border_width(ui->screen_tf_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_tf_btn, 5, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_tf_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_tf_btn, lv_color_hex(0xffffff), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_tf_btn, &lv_font_SourceHanSerifCN2_16, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_tf_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_tf_btn, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_gpio_btn
	ui->screen_gpio_btn = lv_btn_create(ui->screen_list_tab_1);
	ui->screen_gpio_btn_label = lv_label_create(ui->screen_gpio_btn);
	lv_label_set_text(ui->screen_gpio_btn_label, "测试");
	lv_label_set_long_mode(ui->screen_gpio_btn_label, LV_LABEL_LONG_WRAP);
	lv_obj_align(ui->screen_gpio_btn_label, LV_ALIGN_CENTER, 0, 0);
	lv_obj_set_style_pad_all(ui->screen_gpio_btn, 0, LV_STATE_DEFAULT);
	lv_obj_set_width(ui->screen_gpio_btn_label, LV_PCT(100));
	lv_obj_set_pos(ui->screen_gpio_btn, 610, 250);
	lv_obj_set_size(ui->screen_gpio_btn, 70, 40);
	lv_obj_add_flag(ui->screen_gpio_btn, LV_OBJ_FLAG_HIDDEN);

	//Write style for screen_gpio_btn, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_gpio_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_gpio_btn, lv_color_hex(0x2195f6), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_gpio_btn, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_border_width(ui->screen_gpio_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_gpio_btn, 5, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_gpio_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_gpio_btn, lv_color_hex(0xffffff), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_gpio_btn, &lv_font_SourceHanSerifCN2_16, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_gpio_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_gpio_btn, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_label_3
	ui->screen_label_3 = lv_label_create(ui->screen_list_tab_1);
	lv_label_set_text(ui->screen_label_3, "发送：");
	lv_label_set_long_mode(ui->screen_label_3, LV_LABEL_LONG_WRAP);
	lv_obj_set_pos(ui->screen_label_3, 15, 170);
	lv_obj_set_size(ui->screen_label_3, 60, 20);

	//Write style for screen_label_3, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_border_width(ui->screen_label_3, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_label_3, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_label_3, lv_color_hex(0x000000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_label_3, &lv_font_SourceHanSerifCN2_16, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_label_3, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_letter_space(ui->screen_label_3, 2, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_line_space(ui->screen_label_3, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_label_3, LV_TEXT_ALIGN_LEFT, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_opa(ui->screen_label_3, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_top(ui->screen_label_3, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_right(ui->screen_label_3, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_bottom(ui->screen_label_3, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_left(ui->screen_label_3, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_label_3, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_label_8
	ui->screen_label_8 = lv_label_create(ui->screen_list_tab_1);
	lv_label_set_text(ui->screen_label_8, "写入：");
	lv_label_set_long_mode(ui->screen_label_8, LV_LABEL_LONG_WRAP);
	lv_obj_set_pos(ui->screen_label_8, 285, 170);
	lv_obj_set_size(ui->screen_label_8, 60, 20);

	//Write style for screen_label_8, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_border_width(ui->screen_label_8, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_label_8, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_label_8, lv_color_hex(0x000000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_label_8, &lv_font_SourceHanSerifCN2_16, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_label_8, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_letter_space(ui->screen_label_8, 2, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_line_space(ui->screen_label_8, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_label_8, LV_TEXT_ALIGN_LEFT, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_opa(ui->screen_label_8, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_top(ui->screen_label_8, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_right(ui->screen_label_8, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_bottom(ui->screen_label_8, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_left(ui->screen_label_8, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_label_8, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_label_4
	ui->screen_label_4 = lv_label_create(ui->screen_list_tab_1);
	lv_label_set_text(ui->screen_label_4, "接收：\n");
	lv_label_set_long_mode(ui->screen_label_4, LV_LABEL_LONG_WRAP);
	lv_obj_set_pos(ui->screen_label_4, 15, 195);
	lv_obj_set_size(ui->screen_label_4, 60, 20);

	//Write style for screen_label_4, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_border_width(ui->screen_label_4, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_label_4, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_label_4, lv_color_hex(0x000000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_label_4, &lv_font_SourceHanSerifCN2_16, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_label_4, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_letter_space(ui->screen_label_4, 2, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_line_space(ui->screen_label_4, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_label_4, LV_TEXT_ALIGN_LEFT, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_opa(ui->screen_label_4, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_top(ui->screen_label_4, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_right(ui->screen_label_4, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_bottom(ui->screen_label_4, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_left(ui->screen_label_4, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_label_4, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_label_11
	ui->screen_label_11 = lv_label_create(ui->screen_list_tab_1);
	lv_label_set_text(ui->screen_label_11, "读取：\n");
	lv_label_set_long_mode(ui->screen_label_11, LV_LABEL_LONG_WRAP);
	lv_obj_set_pos(ui->screen_label_11, 285, 195);
	lv_obj_set_size(ui->screen_label_11, 60, 20);

	//Write style for screen_label_11, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_border_width(ui->screen_label_11, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_label_11, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_label_11, lv_color_hex(0x000000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_label_11, &lv_font_SourceHanSerifCN2_16, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_label_11, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_letter_space(ui->screen_label_11, 2, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_line_space(ui->screen_label_11, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_label_11, LV_TEXT_ALIGN_LEFT, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_opa(ui->screen_label_11, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_top(ui->screen_label_11, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_right(ui->screen_label_11, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_bottom(ui->screen_label_11, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_left(ui->screen_label_11, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_label_11, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_label_14
	ui->screen_label_14 = lv_label_create(ui->screen_list_tab_1);
	lv_label_set_text(ui->screen_label_14, "状态：\n");
	lv_label_set_long_mode(ui->screen_label_14, LV_LABEL_LONG_WRAP);
	lv_obj_set_pos(ui->screen_label_14, 15, 220);
	lv_obj_set_size(ui->screen_label_14, 60, 20);

	//Write style for screen_label_14, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_border_width(ui->screen_label_14, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_label_14, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_label_14, lv_color_hex(0x000000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_label_14, &lv_font_SourceHanSerifCN2_16, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_label_14, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_letter_space(ui->screen_label_14, 2, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_line_space(ui->screen_label_14, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_label_14, LV_TEXT_ALIGN_LEFT, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_opa(ui->screen_label_14, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_top(ui->screen_label_14, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_right(ui->screen_label_14, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_bottom(ui->screen_label_14, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_left(ui->screen_label_14, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_label_14, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_label_15
	ui->screen_label_15 = lv_label_create(ui->screen_list_tab_1);
	lv_label_set_text(ui->screen_label_15, "状态：\n");
	lv_label_set_long_mode(ui->screen_label_15, LV_LABEL_LONG_WRAP);
	lv_obj_set_pos(ui->screen_label_15, 285, 220);
	lv_obj_set_size(ui->screen_label_15, 60, 20);

	//Write style for screen_label_15, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_border_width(ui->screen_label_15, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_label_15, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_label_15, lv_color_hex(0x000000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_label_15, &lv_font_SourceHanSerifCN2_16, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_label_15, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_letter_space(ui->screen_label_15, 2, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_line_space(ui->screen_label_15, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_label_15, LV_TEXT_ALIGN_LEFT, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_opa(ui->screen_label_15, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_top(ui->screen_label_15, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_right(ui->screen_label_15, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_bottom(ui->screen_label_15, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_left(ui->screen_label_15, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_label_15, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_eth_send
	ui->screen_eth_send = lv_label_create(ui->screen_list_tab_1);
	lv_label_set_text(ui->screen_eth_send, "00.00Mb/s\n");
	lv_label_set_long_mode(ui->screen_eth_send, LV_LABEL_LONG_WRAP);
	lv_obj_set_pos(ui->screen_eth_send, 65, 170);
	lv_obj_set_size(ui->screen_eth_send, 112, 20);

	//Write style for screen_eth_send, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_border_width(ui->screen_eth_send, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_eth_send, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_eth_send, lv_color_hex(0x000000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_eth_send, &lv_font_SourceHanSerifCN2_16, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_eth_send, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_letter_space(ui->screen_eth_send, 2, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_line_space(ui->screen_eth_send, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_eth_send, LV_TEXT_ALIGN_LEFT, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_opa(ui->screen_eth_send, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_top(ui->screen_eth_send, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_right(ui->screen_eth_send, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_bottom(ui->screen_eth_send, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_left(ui->screen_eth_send, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_eth_send, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_tf_write
	ui->screen_tf_write = lv_label_create(ui->screen_list_tab_1);
	lv_label_set_text(ui->screen_tf_write, "00.00MB/s\n");
	lv_label_set_long_mode(ui->screen_tf_write, LV_LABEL_LONG_WRAP);
	lv_obj_set_pos(ui->screen_tf_write, 335, 170);
	lv_obj_set_size(ui->screen_tf_write, 112, 20);

	//Write style for screen_tf_write, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_border_width(ui->screen_tf_write, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_tf_write, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_tf_write, lv_color_hex(0x000000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_tf_write, &lv_font_SourceHanSerifCN2_16, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_tf_write, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_letter_space(ui->screen_tf_write, 2, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_line_space(ui->screen_tf_write, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_tf_write, LV_TEXT_ALIGN_LEFT, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_opa(ui->screen_tf_write, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_top(ui->screen_tf_write, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_right(ui->screen_tf_write, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_bottom(ui->screen_tf_write, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_left(ui->screen_tf_write, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_tf_write, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_eth_rcv
	ui->screen_eth_rcv = lv_label_create(ui->screen_list_tab_1);
	lv_label_set_text(ui->screen_eth_rcv, "00.00Mb/s\n");
	lv_label_set_long_mode(ui->screen_eth_rcv, LV_LABEL_LONG_WRAP);
	lv_obj_set_pos(ui->screen_eth_rcv, 65, 195);
	lv_obj_set_size(ui->screen_eth_rcv, 112, 20);

	//Write style for screen_eth_rcv, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_border_width(ui->screen_eth_rcv, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_eth_rcv, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_eth_rcv, lv_color_hex(0x000000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_eth_rcv, &lv_font_SourceHanSerifCN2_16, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_eth_rcv, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_letter_space(ui->screen_eth_rcv, 2, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_line_space(ui->screen_eth_rcv, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_eth_rcv, LV_TEXT_ALIGN_LEFT, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_opa(ui->screen_eth_rcv, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_top(ui->screen_eth_rcv, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_right(ui->screen_eth_rcv, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_bottom(ui->screen_eth_rcv, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_left(ui->screen_eth_rcv, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_eth_rcv, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_tf_read
	ui->screen_tf_read = lv_label_create(ui->screen_list_tab_1);
	lv_label_set_text(ui->screen_tf_read, "00.00MB/s\n");
	lv_label_set_long_mode(ui->screen_tf_read, LV_LABEL_LONG_WRAP);
	lv_obj_set_pos(ui->screen_tf_read, 335, 195);
	lv_obj_set_size(ui->screen_tf_read, 112, 20);

	//Write style for screen_tf_read, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_border_width(ui->screen_tf_read, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_tf_read, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_tf_read, lv_color_hex(0x000000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_tf_read, &lv_font_SourceHanSerifCN2_16, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_tf_read, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_letter_space(ui->screen_tf_read, 2, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_line_space(ui->screen_tf_read, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_tf_read, LV_TEXT_ALIGN_LEFT, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_opa(ui->screen_tf_read, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_top(ui->screen_tf_read, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_right(ui->screen_tf_read, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_bottom(ui->screen_tf_read, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_left(ui->screen_tf_read, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_tf_read, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_eth_status
	ui->screen_eth_status = lv_label_create(ui->screen_list_tab_1);
	lv_label_set_text(ui->screen_eth_status, "未插入");
	lv_label_set_long_mode(ui->screen_eth_status, LV_LABEL_LONG_WRAP);
	lv_obj_set_pos(ui->screen_eth_status, 75, 220);
	lv_obj_set_size(ui->screen_eth_status, 112, 20);

	//Write style for screen_eth_status, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_border_width(ui->screen_eth_status, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_eth_status, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_eth_status, lv_color_hex(0x000000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_eth_status, &lv_font_SourceHanSerifCN2_16, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_eth_status, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_letter_space(ui->screen_eth_status, 2, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_line_space(ui->screen_eth_status, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_eth_status, LV_TEXT_ALIGN_LEFT, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_opa(ui->screen_eth_status, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_top(ui->screen_eth_status, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_right(ui->screen_eth_status, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_bottom(ui->screen_eth_status, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_left(ui->screen_eth_status, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_eth_status, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_tf_status
	ui->screen_tf_status = lv_label_create(ui->screen_list_tab_1);
	lv_label_set_text(ui->screen_tf_status, "未插入");
	lv_label_set_long_mode(ui->screen_tf_status, LV_LABEL_LONG_WRAP);
	lv_obj_set_pos(ui->screen_tf_status, 345, 220);
	lv_obj_set_size(ui->screen_tf_status, 112, 20);

	//Write style for screen_tf_status, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_border_width(ui->screen_tf_status, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_tf_status, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_tf_status, lv_color_hex(0x000000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_tf_status, &lv_font_SourceHanSerifCN2_16, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_tf_status, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_letter_space(ui->screen_tf_status, 2, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_line_space(ui->screen_tf_status, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_tf_status, LV_TEXT_ALIGN_LEFT, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_opa(ui->screen_tf_status, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_top(ui->screen_tf_status, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_right(ui->screen_tf_status, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_bottom(ui->screen_tf_status, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_left(ui->screen_tf_status, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_tf_status, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_eth_test
	ui->screen_eth_test = lv_img_create(ui->screen_list_tab_1);
	lv_obj_add_flag(ui->screen_eth_test, LV_OBJ_FLAG_CLICKABLE);
	lv_img_set_src(ui->screen_eth_test, &_test_alpha_100x100);
	lv_img_set_pivot(ui->screen_eth_test, 50,50);
	lv_img_set_angle(ui->screen_eth_test, 0);
	lv_obj_set_pos(ui->screen_eth_test, 70, 40);
	lv_obj_set_size(ui->screen_eth_test, 100, 100);
	lv_obj_add_flag(ui->screen_eth_test, LV_OBJ_FLAG_HIDDEN);

	//Write style for screen_eth_test, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_img_opa(ui->screen_eth_test, 255, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_gpio_test
	ui->screen_gpio_test = lv_img_create(ui->screen_list_tab_1);
	lv_obj_add_flag(ui->screen_gpio_test, LV_OBJ_FLAG_CLICKABLE);
	lv_img_set_src(ui->screen_gpio_test, &_test_alpha_100x100);
	lv_img_set_pivot(ui->screen_gpio_test, 50,50);
	lv_img_set_angle(ui->screen_gpio_test, 0);
	lv_obj_set_pos(ui->screen_gpio_test, 595, 40);
	lv_obj_set_size(ui->screen_gpio_test, 100, 100);
	lv_obj_add_flag(ui->screen_gpio_test, LV_OBJ_FLAG_HIDDEN);

	//Write style for screen_gpio_test, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_img_opa(ui->screen_gpio_test, 255, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_tf_test
	ui->screen_tf_test = lv_img_create(ui->screen_list_tab_1);
	lv_obj_add_flag(ui->screen_tf_test, LV_OBJ_FLAG_CLICKABLE);
	lv_img_set_src(ui->screen_tf_test, &_test_alpha_100x100);
	lv_img_set_pivot(ui->screen_tf_test, 50,50);
	lv_img_set_angle(ui->screen_tf_test, 0);
	lv_obj_set_pos(ui->screen_tf_test, 330, 40);
	lv_obj_set_size(ui->screen_tf_test, 100, 100);
	lv_obj_add_flag(ui->screen_tf_test, LV_OBJ_FLAG_HIDDEN);

	//Write style for screen_tf_test, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_img_opa(ui->screen_tf_test, 255, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_single_test_sw
	ui->screen_single_test_sw = lv_switch_create(ui->screen_list_tab_1);
	lv_obj_set_pos(ui->screen_single_test_sw, 609, 324);
	lv_obj_set_size(ui->screen_single_test_sw, 58, 26);

	//Write style for screen_single_test_sw, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_single_test_sw, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_single_test_sw, lv_color_hex(0xe6e2e6), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_single_test_sw, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_border_width(ui->screen_single_test_sw, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_single_test_sw, 10, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_single_test_sw, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write style for screen_single_test_sw, Part: LV_PART_INDICATOR, State: LV_STATE_CHECKED.
	lv_obj_set_style_bg_opa(ui->screen_single_test_sw, 255, LV_PART_INDICATOR|LV_STATE_CHECKED);
	lv_obj_set_style_bg_color(ui->screen_single_test_sw, lv_color_hex(0x2195f6), LV_PART_INDICATOR|LV_STATE_CHECKED);
	lv_obj_set_style_bg_grad_dir(ui->screen_single_test_sw, LV_GRAD_DIR_NONE, LV_PART_INDICATOR|LV_STATE_CHECKED);
	lv_obj_set_style_border_width(ui->screen_single_test_sw, 0, LV_PART_INDICATOR|LV_STATE_CHECKED);

	//Write style for screen_single_test_sw, Part: LV_PART_KNOB, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_single_test_sw, 255, LV_PART_KNOB|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_single_test_sw, lv_color_hex(0xffffff), LV_PART_KNOB|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_single_test_sw, LV_GRAD_DIR_NONE, LV_PART_KNOB|LV_STATE_DEFAULT);
	lv_obj_set_style_border_width(ui->screen_single_test_sw, 0, LV_PART_KNOB|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_single_test_sw, 10, LV_PART_KNOB|LV_STATE_DEFAULT);

	//Write codes screen_label_20
	ui->screen_label_20 = lv_label_create(ui->screen_list_tab_1);
	lv_label_set_text(ui->screen_label_20, "单项测试");
	lv_label_set_long_mode(ui->screen_label_20, LV_LABEL_LONG_WRAP);
	lv_obj_set_pos(ui->screen_label_20, 659, 330);
	lv_obj_set_size(ui->screen_label_20, 100, 32);

	//Write style for screen_label_20, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_border_width(ui->screen_label_20, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_label_20, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_label_20, lv_color_hex(0x000000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_label_20, &lv_font_SourceHanSerifCN2_16, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_label_20, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_letter_space(ui->screen_label_20, 2, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_line_space(ui->screen_label_20, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_label_20, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_opa(ui->screen_label_20, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_top(ui->screen_label_20, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_right(ui->screen_label_20, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_bottom(ui->screen_label_20, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_left(ui->screen_label_20, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_label_20, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes 按键
	ui->screen_list_tab_2 = lv_tabview_add_tab(ui->screen_list,"按键");
	lv_obj_t * screen_list_tab_2_label = lv_label_create(ui->screen_list_tab_2);
	lv_label_set_text(screen_list_tab_2_label, "");

	//Write codes screen_adc_key
	ui->screen_adc_key = lv_canvas_create(ui->screen_list_tab_2);
	static lv_color_t buf_screen_adc_key[179*130*4];
	lv_canvas_set_buffer(ui->screen_adc_key, buf_screen_adc_key, 179, 130, LV_IMG_CF_TRUE_COLOR_ALPHA);
	lv_canvas_fill_bg(ui->screen_adc_key, lv_color_hex(0xadadad), 255);
	lv_obj_set_pos(ui->screen_adc_key, 163, 51);
	lv_obj_set_size(ui->screen_adc_key, 179, 130);
	lv_obj_set_scrollbar_mode(ui->screen_adc_key, LV_SCROLLBAR_MODE_OFF);

	//Write codes screen_rec_key
	ui->screen_rec_key = lv_canvas_create(ui->screen_list_tab_2);
	static lv_color_t buf_screen_rec_key[179*130*4];
	lv_canvas_set_buffer(ui->screen_rec_key, buf_screen_rec_key, 179, 130, LV_IMG_CF_TRUE_COLOR_ALPHA);
	lv_canvas_fill_bg(ui->screen_rec_key, lv_color_hex(0xadadad), 255);
	lv_obj_set_pos(ui->screen_rec_key, 440, 53);
	lv_obj_set_size(ui->screen_rec_key, 179, 130);
	lv_obj_set_scrollbar_mode(ui->screen_rec_key, LV_SCROLLBAR_MODE_OFF);

	//Write codes screen_label_17
	ui->screen_label_17 = lv_label_create(ui->screen_list_tab_2);
	lv_label_set_text(ui->screen_label_17, "REC");
	lv_label_set_long_mode(ui->screen_label_17, LV_LABEL_LONG_WRAP);
	lv_obj_set_pos(ui->screen_label_17, 167, 96);
	lv_obj_set_size(ui->screen_label_17, 167, 76);

	//Write style for screen_label_17, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_border_width(ui->screen_label_17, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_label_17, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_label_17, lv_color_hex(0x000000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_label_17, &lv_font_SourceHanSerifCN2_36, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_label_17, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_letter_space(ui->screen_label_17, 2, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_line_space(ui->screen_label_17, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_label_17, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_opa(ui->screen_label_17, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_top(ui->screen_label_17, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_right(ui->screen_label_17, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_bottom(ui->screen_label_17, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_left(ui->screen_label_17, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_label_17, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_label_18
	ui->screen_label_18 = lv_label_create(ui->screen_list_tab_2);
	lv_label_set_text(ui->screen_label_18, "ADC");
	lv_label_set_long_mode(ui->screen_label_18, LV_LABEL_LONG_WRAP);
	lv_obj_set_pos(ui->screen_label_18, 468, 96);
	lv_obj_set_size(ui->screen_label_18, 131, 63);

	//Write style for screen_label_18, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_border_width(ui->screen_label_18, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_label_18, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_label_18, lv_color_hex(0x000000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_label_18, &lv_font_SourceHanSerifCN2_36, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_label_18, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_letter_space(ui->screen_label_18, 2, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_line_space(ui->screen_label_18, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_label_18, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_opa(ui->screen_label_18, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_top(ui->screen_label_18, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_right(ui->screen_label_18, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_bottom(ui->screen_label_18, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_left(ui->screen_label_18, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_label_18, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_key_no_pass_btn
	ui->screen_key_no_pass_btn = lv_btn_create(ui->screen_list_tab_2);
	ui->screen_key_no_pass_btn_label = lv_label_create(ui->screen_key_no_pass_btn);
	lv_label_set_text(ui->screen_key_no_pass_btn_label, "不通过");
	lv_label_set_long_mode(ui->screen_key_no_pass_btn_label, LV_LABEL_LONG_WRAP);
	lv_obj_align(ui->screen_key_no_pass_btn_label, LV_ALIGN_CENTER, 0, 0);
	lv_obj_set_style_pad_all(ui->screen_key_no_pass_btn, 0, LV_STATE_DEFAULT);
	lv_obj_set_width(ui->screen_key_no_pass_btn_label, LV_PCT(100));
	lv_obj_set_pos(ui->screen_key_no_pass_btn, 450, 270);
	lv_obj_set_size(ui->screen_key_no_pass_btn, 150, 75);

	//Write style for screen_key_no_pass_btn, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_key_no_pass_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_key_no_pass_btn, lv_color_hex(0xe70000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_key_no_pass_btn, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_border_width(ui->screen_key_no_pass_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_key_no_pass_btn, 5, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_key_no_pass_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_key_no_pass_btn, lv_color_hex(0xffffff), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_key_no_pass_btn, &lv_font_SourceHanSerifCN2_24, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_key_no_pass_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_key_no_pass_btn, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_key_use
	ui->screen_key_use = lv_win_create(ui->screen_list_tab_2, 40);
	lv_obj_t * screen_key_use_title = lv_win_add_title(ui->screen_key_use, "操作说明");
	ui->screen_key_use_item0 = lv_win_add_btn(ui->screen_key_use, LV_SYMBOL_CLOSE, 40);
	lv_obj_t *screen_key_use_label = lv_label_create(lv_win_get_content(ui->screen_key_use));
	lv_obj_set_scrollbar_mode(lv_win_get_content(ui->screen_key_use), LV_SCROLLBAR_MODE_OFF);
	lv_label_set_text(screen_key_use_label, "请分别按下板子上的REC按键和ADC按键，按下后系统会自动判断按键是否被按下，如果两个按键按下之后画面没有跳转，请按下不通过按键");
	lv_obj_set_pos(ui->screen_key_use, 151, 21);
	lv_obj_set_size(ui->screen_key_use, 498, 198);
	lv_obj_set_scrollbar_mode(ui->screen_key_use, LV_SCROLLBAR_MODE_OFF);
	lv_obj_add_flag(ui->screen_key_use, LV_OBJ_FLAG_HIDDEN);

	//Write style for screen_key_use, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_key_use, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_key_use, lv_color_hex(0x998989), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_key_use, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_outline_width(ui->screen_key_use, 1, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_outline_opa(ui->screen_key_use, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_outline_color(ui->screen_key_use, lv_color_hex(0x2d2a2a), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_key_use, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write style state: LV_STATE_DEFAULT for &style_screen_key_use_extra_content_main_default
	static lv_style_t style_screen_key_use_extra_content_main_default;
	ui_init_style(&style_screen_key_use_extra_content_main_default);
	
	lv_style_set_bg_opa(&style_screen_key_use_extra_content_main_default, 255);
	lv_style_set_bg_color(&style_screen_key_use_extra_content_main_default, lv_color_hex(0xeeeef6));
	lv_style_set_bg_grad_dir(&style_screen_key_use_extra_content_main_default, LV_GRAD_DIR_NONE);
	lv_style_set_text_color(&style_screen_key_use_extra_content_main_default, lv_color_hex(0x393c41));
	lv_style_set_text_font(&style_screen_key_use_extra_content_main_default, &lv_font_SourceHanSerifCN2_12);
	lv_style_set_text_opa(&style_screen_key_use_extra_content_main_default, 255);
	lv_style_set_text_letter_space(&style_screen_key_use_extra_content_main_default, 0);
	lv_style_set_text_line_space(&style_screen_key_use_extra_content_main_default, 2);
	lv_obj_add_style(lv_win_get_content(ui->screen_key_use), &style_screen_key_use_extra_content_main_default, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write style state: LV_STATE_DEFAULT for &style_screen_key_use_extra_header_main_default
	static lv_style_t style_screen_key_use_extra_header_main_default;
	ui_init_style(&style_screen_key_use_extra_header_main_default);
	
	lv_style_set_bg_opa(&style_screen_key_use_extra_header_main_default, 255);
	lv_style_set_bg_color(&style_screen_key_use_extra_header_main_default, lv_color_hex(0xe6e6e6));
	lv_style_set_bg_grad_dir(&style_screen_key_use_extra_header_main_default, LV_GRAD_DIR_NONE);
	lv_style_set_text_color(&style_screen_key_use_extra_header_main_default, lv_color_hex(0x393c41));
	lv_style_set_text_font(&style_screen_key_use_extra_header_main_default, &lv_font_SourceHanSerifCN2_12);
	lv_style_set_text_opa(&style_screen_key_use_extra_header_main_default, 255);
	lv_style_set_text_letter_space(&style_screen_key_use_extra_header_main_default, 0);
	lv_style_set_text_line_space(&style_screen_key_use_extra_header_main_default, 2);
	lv_obj_add_style(lv_win_get_header(ui->screen_key_use), &style_screen_key_use_extra_header_main_default, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write style state: LV_STATE_DEFAULT for &style_screen_key_use_extra_btns_main_default
	static lv_style_t style_screen_key_use_extra_btns_main_default;
	ui_init_style(&style_screen_key_use_extra_btns_main_default);
	
	lv_style_set_radius(&style_screen_key_use_extra_btns_main_default, 8);
	lv_style_set_border_width(&style_screen_key_use_extra_btns_main_default, 0);
	lv_style_set_bg_opa(&style_screen_key_use_extra_btns_main_default, 255);
	lv_style_set_bg_color(&style_screen_key_use_extra_btns_main_default, lv_color_hex(0x2195f6));
	lv_style_set_bg_grad_dir(&style_screen_key_use_extra_btns_main_default, LV_GRAD_DIR_NONE);
	lv_style_set_shadow_width(&style_screen_key_use_extra_btns_main_default, 0);
	lv_obj_add_style(ui->screen_key_use_item0, &style_screen_key_use_extra_btns_main_default, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_use_key
	ui->screen_use_key = lv_img_create(ui->screen_list_tab_2);
	lv_obj_add_flag(ui->screen_use_key, LV_OBJ_FLAG_CLICKABLE);
	lv_img_set_src(ui->screen_use_key, &_use_2_alpha_50x50);
	lv_img_set_pivot(ui->screen_use_key, 50,50);
	lv_img_set_angle(ui->screen_use_key, 0);
	lv_obj_set_pos(ui->screen_use_key, 20, 280);
	lv_obj_set_size(ui->screen_use_key, 50, 50);

	//Write style for screen_use_key, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_img_opa(ui->screen_use_key, 255, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes 音频
	ui->screen_list_tab_3 = lv_tabview_add_tab(ui->screen_list,"音频");
	lv_obj_t * screen_list_tab_3_label = lv_label_create(ui->screen_list_tab_3);
	lv_label_set_text(screen_list_tab_3_label, "");

	//Write codes screen_sound_pass_btn
	ui->screen_sound_pass_btn = lv_btn_create(ui->screen_list_tab_3);
	ui->screen_sound_pass_btn_label = lv_label_create(ui->screen_sound_pass_btn);
	lv_label_set_text(ui->screen_sound_pass_btn_label, "通过");
	lv_label_set_long_mode(ui->screen_sound_pass_btn_label, LV_LABEL_LONG_WRAP);
	lv_obj_align(ui->screen_sound_pass_btn_label, LV_ALIGN_CENTER, 0, 0);
	lv_obj_set_style_pad_all(ui->screen_sound_pass_btn, 0, LV_STATE_DEFAULT);
	lv_obj_set_width(ui->screen_sound_pass_btn_label, LV_PCT(100));
	lv_obj_set_pos(ui->screen_sound_pass_btn, 150, 270);
	lv_obj_set_size(ui->screen_sound_pass_btn, 150, 75);

	//Write style for screen_sound_pass_btn, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_sound_pass_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_sound_pass_btn, lv_color_hex(0x00c700), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_sound_pass_btn, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_border_width(ui->screen_sound_pass_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_sound_pass_btn, 5, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_sound_pass_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_sound_pass_btn, lv_color_hex(0xffffff), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_sound_pass_btn, &lv_font_SourceHanSerifCN2_24, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_sound_pass_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_sound_pass_btn, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_sound_no_pass_mic_btn
	ui->screen_sound_no_pass_mic_btn = lv_btn_create(ui->screen_list_tab_3);
	ui->screen_sound_no_pass_mic_btn_label = lv_label_create(ui->screen_sound_no_pass_mic_btn);
	lv_label_set_text(ui->screen_sound_no_pass_mic_btn_label, "只听到一次声音");
	lv_label_set_long_mode(ui->screen_sound_no_pass_mic_btn_label, LV_LABEL_LONG_WRAP);
	lv_obj_align(ui->screen_sound_no_pass_mic_btn_label, LV_ALIGN_CENTER, 0, 0);
	lv_obj_set_style_pad_all(ui->screen_sound_no_pass_mic_btn, 0, LV_STATE_DEFAULT);
	lv_obj_set_width(ui->screen_sound_no_pass_mic_btn_label, LV_PCT(100));
	lv_obj_set_pos(ui->screen_sound_no_pass_mic_btn, 350, 270);
	lv_obj_set_size(ui->screen_sound_no_pass_mic_btn, 150, 75);

	//Write style for screen_sound_no_pass_mic_btn, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_sound_no_pass_mic_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_sound_no_pass_mic_btn, lv_color_hex(0xe70000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_sound_no_pass_mic_btn, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_border_width(ui->screen_sound_no_pass_mic_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_sound_no_pass_mic_btn, 5, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_sound_no_pass_mic_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_sound_no_pass_mic_btn, lv_color_hex(0xffffff), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_sound_no_pass_mic_btn, &lv_font_SourceHanSerifCN2_20, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_sound_no_pass_mic_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_sound_no_pass_mic_btn, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_start_btn
	ui->screen_start_btn = lv_btn_create(ui->screen_list_tab_3);
	ui->screen_start_btn_label = lv_label_create(ui->screen_start_btn);
	lv_label_set_text(ui->screen_start_btn_label, "开始测试");
	lv_label_set_long_mode(ui->screen_start_btn_label, LV_LABEL_LONG_WRAP);
	lv_obj_align(ui->screen_start_btn_label, LV_ALIGN_CENTER, 0, 0);
	lv_obj_set_style_pad_all(ui->screen_start_btn, 0, LV_STATE_DEFAULT);
	lv_obj_set_width(ui->screen_start_btn_label, LV_PCT(100));
	lv_obj_set_pos(ui->screen_start_btn, 249, 73);
	lv_obj_set_size(ui->screen_start_btn, 296, 101);
	lv_obj_add_flag(ui->screen_start_btn, LV_OBJ_FLAG_HIDDEN);

	//Write style for screen_start_btn, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_start_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_start_btn, lv_color_hex(0x0062d2), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_start_btn, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_border_width(ui->screen_start_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_start_btn, 5, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_start_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_start_btn, lv_color_hex(0xffffff), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_start_btn, &lv_font_SourceHanSerifCN2_24, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_start_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_start_btn, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_use_sound
	ui->screen_use_sound = lv_img_create(ui->screen_list_tab_3);
	lv_obj_add_flag(ui->screen_use_sound, LV_OBJ_FLAG_CLICKABLE);
	lv_img_set_src(ui->screen_use_sound, &_use_2_alpha_50x50);
	lv_img_set_pivot(ui->screen_use_sound, 50,50);
	lv_img_set_angle(ui->screen_use_sound, 0);
	lv_obj_set_pos(ui->screen_use_sound, 20, 280);
	lv_obj_set_size(ui->screen_use_sound, 50, 50);

	//Write style for screen_use_sound, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_img_opa(ui->screen_use_sound, 255, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_sound_use
	ui->screen_sound_use = lv_win_create(ui->screen_list_tab_3, 40);
	lv_obj_t * screen_sound_use_title = lv_win_add_title(ui->screen_sound_use, "操作说明");
	ui->screen_sound_use_item0 = lv_win_add_btn(ui->screen_sound_use, LV_SYMBOL_CLOSE, 40);
	lv_obj_t *screen_sound_use_label = lv_label_create(lv_win_get_content(ui->screen_sound_use));
	lv_obj_set_scrollbar_mode(lv_win_get_content(ui->screen_sound_use), LV_SCROLLBAR_MODE_OFF);
	lv_label_set_text(screen_sound_use_label, "一键测试：\n进入页面后，系统会启动开启录音和播放声音，测试时请靠近麦克风的位置说话，如果喇叭处有声音且没有杂乱的声音即为“通过”，如果喇叭没有声音或者声音有杂声即为“不通过”\n单项测试：\n点击测试按键后，系统会启动开启录音和播放声音，测试时请靠近麦克风的位置说话，如果喇叭处有声音且没有杂乱的声音即为“通过”，如果喇叭没有声音或者声音有杂声即为“不通过”");
	lv_obj_set_pos(ui->screen_sound_use, 151, 21);
	lv_obj_set_size(ui->screen_sound_use, 498, 198);
	lv_obj_set_scrollbar_mode(ui->screen_sound_use, LV_SCROLLBAR_MODE_OFF);
	lv_obj_add_flag(ui->screen_sound_use, LV_OBJ_FLAG_HIDDEN);

	//Write style for screen_sound_use, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_sound_use, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_sound_use, lv_color_hex(0x998989), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_sound_use, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_outline_width(ui->screen_sound_use, 1, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_outline_opa(ui->screen_sound_use, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_outline_color(ui->screen_sound_use, lv_color_hex(0x2d2a2a), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_sound_use, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write style state: LV_STATE_DEFAULT for &style_screen_sound_use_extra_content_main_default
	static lv_style_t style_screen_sound_use_extra_content_main_default;
	ui_init_style(&style_screen_sound_use_extra_content_main_default);
	
	lv_style_set_bg_opa(&style_screen_sound_use_extra_content_main_default, 255);
	lv_style_set_bg_color(&style_screen_sound_use_extra_content_main_default, lv_color_hex(0xeeeef6));
	lv_style_set_bg_grad_dir(&style_screen_sound_use_extra_content_main_default, LV_GRAD_DIR_NONE);
	lv_style_set_text_color(&style_screen_sound_use_extra_content_main_default, lv_color_hex(0x393c41));
	lv_style_set_text_font(&style_screen_sound_use_extra_content_main_default, &lv_font_SourceHanSerifCN2_12);
	lv_style_set_text_opa(&style_screen_sound_use_extra_content_main_default, 255);
	lv_style_set_text_letter_space(&style_screen_sound_use_extra_content_main_default, 0);
	lv_style_set_text_line_space(&style_screen_sound_use_extra_content_main_default, 2);
	lv_obj_add_style(lv_win_get_content(ui->screen_sound_use), &style_screen_sound_use_extra_content_main_default, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write style state: LV_STATE_DEFAULT for &style_screen_sound_use_extra_header_main_default
	static lv_style_t style_screen_sound_use_extra_header_main_default;
	ui_init_style(&style_screen_sound_use_extra_header_main_default);
	
	lv_style_set_bg_opa(&style_screen_sound_use_extra_header_main_default, 255);
	lv_style_set_bg_color(&style_screen_sound_use_extra_header_main_default, lv_color_hex(0xe6e6e6));
	lv_style_set_bg_grad_dir(&style_screen_sound_use_extra_header_main_default, LV_GRAD_DIR_NONE);
	lv_style_set_text_color(&style_screen_sound_use_extra_header_main_default, lv_color_hex(0x393c41));
	lv_style_set_text_font(&style_screen_sound_use_extra_header_main_default, &lv_font_SourceHanSerifCN2_12);
	lv_style_set_text_opa(&style_screen_sound_use_extra_header_main_default, 255);
	lv_style_set_text_letter_space(&style_screen_sound_use_extra_header_main_default, 0);
	lv_style_set_text_line_space(&style_screen_sound_use_extra_header_main_default, 2);
	lv_obj_add_style(lv_win_get_header(ui->screen_sound_use), &style_screen_sound_use_extra_header_main_default, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write style state: LV_STATE_DEFAULT for &style_screen_sound_use_extra_btns_main_default
	static lv_style_t style_screen_sound_use_extra_btns_main_default;
	ui_init_style(&style_screen_sound_use_extra_btns_main_default);
	
	lv_style_set_radius(&style_screen_sound_use_extra_btns_main_default, 8);
	lv_style_set_border_width(&style_screen_sound_use_extra_btns_main_default, 0);
	lv_style_set_bg_opa(&style_screen_sound_use_extra_btns_main_default, 255);
	lv_style_set_bg_color(&style_screen_sound_use_extra_btns_main_default, lv_color_hex(0x2195f6));
	lv_style_set_bg_grad_dir(&style_screen_sound_use_extra_btns_main_default, LV_GRAD_DIR_NONE);
	lv_style_set_shadow_width(&style_screen_sound_use_extra_btns_main_default, 0);
	lv_obj_add_style(ui->screen_sound_use_item0, &style_screen_sound_use_extra_btns_main_default, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_sound_no_pass_spk_btn
	ui->screen_sound_no_pass_spk_btn = lv_btn_create(ui->screen_list_tab_3);
	ui->screen_sound_no_pass_spk_btn_label = lv_label_create(ui->screen_sound_no_pass_spk_btn);
	lv_label_set_text(ui->screen_sound_no_pass_spk_btn_label, "没听到声音");
	lv_label_set_long_mode(ui->screen_sound_no_pass_spk_btn_label, LV_LABEL_LONG_WRAP);
	lv_obj_align(ui->screen_sound_no_pass_spk_btn_label, LV_ALIGN_CENTER, 0, 0);
	lv_obj_set_style_pad_all(ui->screen_sound_no_pass_spk_btn, 0, LV_STATE_DEFAULT);
	lv_obj_set_width(ui->screen_sound_no_pass_spk_btn_label, LV_PCT(100));
	lv_obj_set_pos(ui->screen_sound_no_pass_spk_btn, 550, 270);
	lv_obj_set_size(ui->screen_sound_no_pass_spk_btn, 150, 75);

	//Write style for screen_sound_no_pass_spk_btn, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_sound_no_pass_spk_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_sound_no_pass_spk_btn, lv_color_hex(0xe70000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_sound_no_pass_spk_btn, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_border_width(ui->screen_sound_no_pass_spk_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_sound_no_pass_spk_btn, 5, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_sound_no_pass_spk_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_sound_no_pass_spk_btn, lv_color_hex(0xffffff), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_sound_no_pass_spk_btn, &lv_font_SourceHanSerifCN2_24, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_sound_no_pass_spk_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_sound_no_pass_spk_btn, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes 摄像头
	ui->screen_list_tab_4 = lv_tabview_add_tab(ui->screen_list,"摄像头");
	lv_obj_t * screen_list_tab_4_label = lv_label_create(ui->screen_list_tab_4);
	lv_label_set_text(screen_list_tab_4_label, "");

	//Write codes screen_cam_no_pass_btn
	ui->screen_cam_no_pass_btn = lv_btn_create(ui->screen_list_tab_4);
	ui->screen_cam_no_pass_btn_label = lv_label_create(ui->screen_cam_no_pass_btn);
	lv_label_set_text(ui->screen_cam_no_pass_btn_label, "不通过");
	lv_label_set_long_mode(ui->screen_cam_no_pass_btn_label, LV_LABEL_LONG_WRAP);
	lv_obj_align(ui->screen_cam_no_pass_btn_label, LV_ALIGN_CENTER, 0, 0);
	lv_obj_set_style_pad_all(ui->screen_cam_no_pass_btn, 0, LV_STATE_DEFAULT);
	lv_obj_set_width(ui->screen_cam_no_pass_btn_label, LV_PCT(100));
	lv_obj_set_pos(ui->screen_cam_no_pass_btn, 450, 270);
	lv_obj_set_size(ui->screen_cam_no_pass_btn, 150, 75);

	//Write style for screen_cam_no_pass_btn, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_cam_no_pass_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_cam_no_pass_btn, lv_color_hex(0xe70000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_cam_no_pass_btn, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_border_width(ui->screen_cam_no_pass_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_cam_no_pass_btn, 5, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_cam_no_pass_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_cam_no_pass_btn, lv_color_hex(0xffffff), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_cam_no_pass_btn, &lv_font_SourceHanSerifCN2_24, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_cam_no_pass_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_cam_no_pass_btn, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_cam_pass_btn
	ui->screen_cam_pass_btn = lv_btn_create(ui->screen_list_tab_4);
	ui->screen_cam_pass_btn_label = lv_label_create(ui->screen_cam_pass_btn);
	lv_label_set_text(ui->screen_cam_pass_btn_label, "通过");
	lv_label_set_long_mode(ui->screen_cam_pass_btn_label, LV_LABEL_LONG_WRAP);
	lv_obj_align(ui->screen_cam_pass_btn_label, LV_ALIGN_CENTER, 0, 0);
	lv_obj_set_style_pad_all(ui->screen_cam_pass_btn, 0, LV_STATE_DEFAULT);
	lv_obj_set_width(ui->screen_cam_pass_btn_label, LV_PCT(100));
	lv_obj_set_pos(ui->screen_cam_pass_btn, 200, 270);
	lv_obj_set_size(ui->screen_cam_pass_btn, 150, 75);

	//Write style for screen_cam_pass_btn, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_cam_pass_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_cam_pass_btn, lv_color_hex(0x00c700), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_cam_pass_btn, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_border_width(ui->screen_cam_pass_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_cam_pass_btn, 5, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_cam_pass_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_cam_pass_btn, lv_color_hex(0xffffff), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_cam_pass_btn, &lv_font_SourceHanSerifCN2_24, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_cam_pass_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_cam_pass_btn, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_cam_btn
	ui->screen_cam_btn = lv_btn_create(ui->screen_list_tab_4);
	ui->screen_cam_btn_label = lv_label_create(ui->screen_cam_btn);
	lv_label_set_text(ui->screen_cam_btn_label, "测试");
	lv_label_set_long_mode(ui->screen_cam_btn_label, LV_LABEL_LONG_WRAP);
	lv_obj_align(ui->screen_cam_btn_label, LV_ALIGN_CENTER, 0, 0);
	lv_obj_set_style_pad_all(ui->screen_cam_btn, 0, LV_STATE_DEFAULT);
	lv_obj_set_width(ui->screen_cam_btn_label, LV_PCT(100));
	lv_obj_set_pos(ui->screen_cam_btn, 296, 96);
	lv_obj_set_size(ui->screen_cam_btn, 208, 82);
	lv_obj_add_flag(ui->screen_cam_btn, LV_OBJ_FLAG_HIDDEN);

	//Write style for screen_cam_btn, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_cam_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_cam_btn, lv_color_hex(0x2195f6), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_cam_btn, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_border_width(ui->screen_cam_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_cam_btn, 5, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_cam_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_cam_btn, lv_color_hex(0xffffff), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_cam_btn, &lv_font_SourceHanSerifCN2_16, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_cam_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_cam_btn, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_use_cam
	ui->screen_use_cam = lv_img_create(ui->screen_list_tab_4);
	lv_obj_add_flag(ui->screen_use_cam, LV_OBJ_FLAG_CLICKABLE);
	lv_img_set_src(ui->screen_use_cam, &_use_2_alpha_50x50);
	lv_img_set_pivot(ui->screen_use_cam, 50,50);
	lv_img_set_angle(ui->screen_use_cam, 0);
	lv_obj_set_pos(ui->screen_use_cam, 20, 280);
	lv_obj_set_size(ui->screen_use_cam, 50, 50);

	//Write style for screen_use_cam, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_img_opa(ui->screen_use_cam, 255, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_cam_use
	ui->screen_cam_use = lv_win_create(ui->screen_list_tab_4, 40);
	lv_obj_t * screen_cam_use_title = lv_win_add_title(ui->screen_cam_use, "操作说明");
	ui->screen_cam_use_item0 = lv_win_add_btn(ui->screen_cam_use, LV_SYMBOL_CLOSE, 40);
	lv_obj_t *screen_cam_use_label = lv_label_create(lv_win_get_content(ui->screen_cam_use));
	lv_obj_set_scrollbar_mode(lv_win_get_content(ui->screen_cam_use), LV_SCROLLBAR_MODE_OFF);
	lv_label_set_text(screen_cam_use_label, "一键测试：\n程序进入该页面后，系统会启动摄像头的录制，测试时，摄像头会首先进行自检，如果自检没问题，屏幕上面就会出现摄像头的画面，测试员需要观察左右摄像头的图像是否正确，左右图像正确即点击“通过”，不正确点击“不通过”\n单项测试：\n点击测试按键后，系统会启动摄像头的录制，测试时，摄像头会首先进行自检，如果自检没问题，屏幕上面就会出现摄像头的画面，测试员需要观察左右摄像头的图像是否正确，左右图像正确即点击“通过”，不正确点击“不通过”");
	lv_obj_set_pos(ui->screen_cam_use, 151, 21);
	lv_obj_set_size(ui->screen_cam_use, 498, 198);
	lv_obj_set_scrollbar_mode(ui->screen_cam_use, LV_SCROLLBAR_MODE_OFF);
	lv_obj_add_flag(ui->screen_cam_use, LV_OBJ_FLAG_HIDDEN);

	//Write style for screen_cam_use, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_cam_use, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_cam_use, lv_color_hex(0x998989), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_cam_use, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_outline_width(ui->screen_cam_use, 1, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_outline_opa(ui->screen_cam_use, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_outline_color(ui->screen_cam_use, lv_color_hex(0x2d2a2a), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_cam_use, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write style state: LV_STATE_DEFAULT for &style_screen_cam_use_extra_content_main_default
	static lv_style_t style_screen_cam_use_extra_content_main_default;
	ui_init_style(&style_screen_cam_use_extra_content_main_default);
	
	lv_style_set_bg_opa(&style_screen_cam_use_extra_content_main_default, 255);
	lv_style_set_bg_color(&style_screen_cam_use_extra_content_main_default, lv_color_hex(0xeeeef6));
	lv_style_set_bg_grad_dir(&style_screen_cam_use_extra_content_main_default, LV_GRAD_DIR_NONE);
	lv_style_set_text_color(&style_screen_cam_use_extra_content_main_default, lv_color_hex(0x393c41));
	lv_style_set_text_font(&style_screen_cam_use_extra_content_main_default, &lv_font_SourceHanSerifCN2_12);
	lv_style_set_text_opa(&style_screen_cam_use_extra_content_main_default, 255);
	lv_style_set_text_letter_space(&style_screen_cam_use_extra_content_main_default, 0);
	lv_style_set_text_line_space(&style_screen_cam_use_extra_content_main_default, 2);
	lv_obj_add_style(lv_win_get_content(ui->screen_cam_use), &style_screen_cam_use_extra_content_main_default, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write style state: LV_STATE_DEFAULT for &style_screen_cam_use_extra_header_main_default
	static lv_style_t style_screen_cam_use_extra_header_main_default;
	ui_init_style(&style_screen_cam_use_extra_header_main_default);
	
	lv_style_set_bg_opa(&style_screen_cam_use_extra_header_main_default, 255);
	lv_style_set_bg_color(&style_screen_cam_use_extra_header_main_default, lv_color_hex(0xe6e6e6));
	lv_style_set_bg_grad_dir(&style_screen_cam_use_extra_header_main_default, LV_GRAD_DIR_NONE);
	lv_style_set_text_color(&style_screen_cam_use_extra_header_main_default, lv_color_hex(0x393c41));
	lv_style_set_text_font(&style_screen_cam_use_extra_header_main_default, &lv_font_SourceHanSerifCN2_12);
	lv_style_set_text_opa(&style_screen_cam_use_extra_header_main_default, 255);
	lv_style_set_text_letter_space(&style_screen_cam_use_extra_header_main_default, 0);
	lv_style_set_text_line_space(&style_screen_cam_use_extra_header_main_default, 2);
	lv_obj_add_style(lv_win_get_header(ui->screen_cam_use), &style_screen_cam_use_extra_header_main_default, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write style state: LV_STATE_DEFAULT for &style_screen_cam_use_extra_btns_main_default
	static lv_style_t style_screen_cam_use_extra_btns_main_default;
	ui_init_style(&style_screen_cam_use_extra_btns_main_default);
	
	lv_style_set_radius(&style_screen_cam_use_extra_btns_main_default, 8);
	lv_style_set_border_width(&style_screen_cam_use_extra_btns_main_default, 0);
	lv_style_set_bg_opa(&style_screen_cam_use_extra_btns_main_default, 255);
	lv_style_set_bg_color(&style_screen_cam_use_extra_btns_main_default, lv_color_hex(0x2195f6));
	lv_style_set_bg_grad_dir(&style_screen_cam_use_extra_btns_main_default, LV_GRAD_DIR_NONE);
	lv_style_set_shadow_width(&style_screen_cam_use_extra_btns_main_default, 0);
	lv_obj_add_style(ui->screen_cam_use_item0, &style_screen_cam_use_extra_btns_main_default, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes 显示
	ui->screen_list_tab_5 = lv_tabview_add_tab(ui->screen_list,"显示");
	lv_obj_t * screen_list_tab_5_label = lv_label_create(ui->screen_list_tab_5);
	lv_label_set_text(screen_list_tab_5_label, "\n");

	//Write codes screen_screen_pass_btn
	ui->screen_screen_pass_btn = lv_btn_create(ui->screen_list_tab_5);
	ui->screen_screen_pass_btn_label = lv_label_create(ui->screen_screen_pass_btn);
	lv_label_set_text(ui->screen_screen_pass_btn_label, "通过");
	lv_label_set_long_mode(ui->screen_screen_pass_btn_label, LV_LABEL_LONG_WRAP);
	lv_obj_align(ui->screen_screen_pass_btn_label, LV_ALIGN_CENTER, 0, 0);
	lv_obj_set_style_pad_all(ui->screen_screen_pass_btn, 0, LV_STATE_DEFAULT);
	lv_obj_set_width(ui->screen_screen_pass_btn_label, LV_PCT(100));
	lv_obj_set_pos(ui->screen_screen_pass_btn, 200, 270);
	lv_obj_set_size(ui->screen_screen_pass_btn, 150, 75);

	//Write style for screen_screen_pass_btn, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_screen_pass_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_screen_pass_btn, lv_color_hex(0x00c700), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_screen_pass_btn, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_border_width(ui->screen_screen_pass_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_screen_pass_btn, 5, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_screen_pass_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_screen_pass_btn, lv_color_hex(0xffffff), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_screen_pass_btn, &lv_font_SourceHanSerifCN2_24, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_screen_pass_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_screen_pass_btn, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_screen_no_pass_btn
	ui->screen_screen_no_pass_btn = lv_btn_create(ui->screen_list_tab_5);
	ui->screen_screen_no_pass_btn_label = lv_label_create(ui->screen_screen_no_pass_btn);
	lv_label_set_text(ui->screen_screen_no_pass_btn_label, "不通过");
	lv_label_set_long_mode(ui->screen_screen_no_pass_btn_label, LV_LABEL_LONG_WRAP);
	lv_obj_align(ui->screen_screen_no_pass_btn_label, LV_ALIGN_CENTER, 0, 0);
	lv_obj_set_style_pad_all(ui->screen_screen_no_pass_btn, 0, LV_STATE_DEFAULT);
	lv_obj_set_width(ui->screen_screen_no_pass_btn_label, LV_PCT(100));
	lv_obj_set_pos(ui->screen_screen_no_pass_btn, 450, 270);
	lv_obj_set_size(ui->screen_screen_no_pass_btn, 150, 75);

	//Write style for screen_screen_no_pass_btn, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_screen_no_pass_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_screen_no_pass_btn, lv_color_hex(0xe70000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_screen_no_pass_btn, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_border_width(ui->screen_screen_no_pass_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_screen_no_pass_btn, 5, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_screen_no_pass_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_screen_no_pass_btn, lv_color_hex(0xffffff), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_screen_no_pass_btn, &lv_font_SourceHanSerifCN2_24, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_screen_no_pass_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_screen_no_pass_btn, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_red
	ui->screen_red = lv_canvas_create(ui->screen_list_tab_5);
	static lv_color_t buf_screen_red[725*80*4];
	lv_canvas_set_buffer(ui->screen_red, buf_screen_red, 725, 80, LV_IMG_CF_TRUE_COLOR_ALPHA);
	lv_canvas_fill_bg(ui->screen_red, lv_color_hex(0xff0000), 255);
	lv_obj_set_pos(ui->screen_red, 20, 0);
	lv_obj_set_size(ui->screen_red, 725, 80);
	lv_obj_set_scrollbar_mode(ui->screen_red, LV_SCROLLBAR_MODE_OFF);

	//Write codes screen_green
	ui->screen_green = lv_canvas_create(ui->screen_list_tab_5);
	static lv_color_t buf_screen_green[725*80*4];
	lv_canvas_set_buffer(ui->screen_green, buf_screen_green, 725, 80, LV_IMG_CF_TRUE_COLOR_ALPHA);
	lv_canvas_fill_bg(ui->screen_green, lv_color_hex(0x00ff00), 255);
	lv_obj_set_pos(ui->screen_green, 20, 80);
	lv_obj_set_size(ui->screen_green, 725, 80);
	lv_obj_set_scrollbar_mode(ui->screen_green, LV_SCROLLBAR_MODE_OFF);

	//Write codes screen_blue
	ui->screen_blue = lv_canvas_create(ui->screen_list_tab_5);
	static lv_color_t buf_screen_blue[725*80*4];
	lv_canvas_set_buffer(ui->screen_blue, buf_screen_blue, 725, 80, LV_IMG_CF_TRUE_COLOR_ALPHA);
	lv_canvas_fill_bg(ui->screen_blue, lv_color_hex(0x0000ff), 255);
	lv_obj_set_pos(ui->screen_blue, 20, 160);
	lv_obj_set_size(ui->screen_blue, 725, 80);
	lv_obj_set_scrollbar_mode(ui->screen_blue, LV_SCROLLBAR_MODE_OFF);

	//Write codes screen_use_screen
	ui->screen_use_screen = lv_img_create(ui->screen_list_tab_5);
	lv_obj_add_flag(ui->screen_use_screen, LV_OBJ_FLAG_CLICKABLE);
	lv_img_set_src(ui->screen_use_screen, &_use_2_alpha_50x50);
	lv_img_set_pivot(ui->screen_use_screen, 50,50);
	lv_img_set_angle(ui->screen_use_screen, 0);
	lv_obj_set_pos(ui->screen_use_screen, 20, 280);
	lv_obj_set_size(ui->screen_use_screen, 50, 50);

	//Write style for screen_use_screen, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_img_opa(ui->screen_use_screen, 255, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_screen_use
	ui->screen_screen_use = lv_win_create(ui->screen_list_tab_5, 40);
	lv_obj_t * screen_screen_use_title = lv_win_add_title(ui->screen_screen_use, "操作说明");
	ui->screen_screen_use_item0 = lv_win_add_btn(ui->screen_screen_use, LV_SYMBOL_CLOSE, 40);
	lv_obj_t *screen_screen_use_label = lv_label_create(lv_win_get_content(ui->screen_screen_use));
	lv_obj_set_scrollbar_mode(lv_win_get_content(ui->screen_screen_use), LV_SCROLLBAR_MODE_OFF);
	lv_label_set_text(screen_screen_use_label, "需要查看三色色条的颜色正不正确，上面是红色，中间是绿色，底下是蓝色，颜色正确请点击“通过”，如果颜色不正确请点击“不通过”");
	lv_obj_set_pos(ui->screen_screen_use, 151, 21);
	lv_obj_set_size(ui->screen_screen_use, 498, 198);
	lv_obj_set_scrollbar_mode(ui->screen_screen_use, LV_SCROLLBAR_MODE_OFF);
	lv_obj_add_flag(ui->screen_screen_use, LV_OBJ_FLAG_HIDDEN);

	//Write style for screen_screen_use, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_screen_use, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_screen_use, lv_color_hex(0x998989), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_screen_use, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_outline_width(ui->screen_screen_use, 1, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_outline_opa(ui->screen_screen_use, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_outline_color(ui->screen_screen_use, lv_color_hex(0x2d2a2a), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_screen_use, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write style state: LV_STATE_DEFAULT for &style_screen_screen_use_extra_content_main_default
	static lv_style_t style_screen_screen_use_extra_content_main_default;
	ui_init_style(&style_screen_screen_use_extra_content_main_default);
	
	lv_style_set_bg_opa(&style_screen_screen_use_extra_content_main_default, 255);
	lv_style_set_bg_color(&style_screen_screen_use_extra_content_main_default, lv_color_hex(0xeeeef6));
	lv_style_set_bg_grad_dir(&style_screen_screen_use_extra_content_main_default, LV_GRAD_DIR_NONE);
	lv_style_set_text_color(&style_screen_screen_use_extra_content_main_default, lv_color_hex(0x393c41));
	lv_style_set_text_font(&style_screen_screen_use_extra_content_main_default, &lv_font_SourceHanSerifCN2_12);
	lv_style_set_text_opa(&style_screen_screen_use_extra_content_main_default, 255);
	lv_style_set_text_letter_space(&style_screen_screen_use_extra_content_main_default, 0);
	lv_style_set_text_line_space(&style_screen_screen_use_extra_content_main_default, 2);
	lv_obj_add_style(lv_win_get_content(ui->screen_screen_use), &style_screen_screen_use_extra_content_main_default, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write style state: LV_STATE_DEFAULT for &style_screen_screen_use_extra_header_main_default
	static lv_style_t style_screen_screen_use_extra_header_main_default;
	ui_init_style(&style_screen_screen_use_extra_header_main_default);
	
	lv_style_set_bg_opa(&style_screen_screen_use_extra_header_main_default, 255);
	lv_style_set_bg_color(&style_screen_screen_use_extra_header_main_default, lv_color_hex(0xe6e6e6));
	lv_style_set_bg_grad_dir(&style_screen_screen_use_extra_header_main_default, LV_GRAD_DIR_NONE);
	lv_style_set_text_color(&style_screen_screen_use_extra_header_main_default, lv_color_hex(0x393c41));
	lv_style_set_text_font(&style_screen_screen_use_extra_header_main_default, &lv_font_SourceHanSerifCN2_12);
	lv_style_set_text_opa(&style_screen_screen_use_extra_header_main_default, 255);
	lv_style_set_text_letter_space(&style_screen_screen_use_extra_header_main_default, 0);
	lv_style_set_text_line_space(&style_screen_screen_use_extra_header_main_default, 2);
	lv_obj_add_style(lv_win_get_header(ui->screen_screen_use), &style_screen_screen_use_extra_header_main_default, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write style state: LV_STATE_DEFAULT for &style_screen_screen_use_extra_btns_main_default
	static lv_style_t style_screen_screen_use_extra_btns_main_default;
	ui_init_style(&style_screen_screen_use_extra_btns_main_default);
	
	lv_style_set_radius(&style_screen_screen_use_extra_btns_main_default, 8);
	lv_style_set_border_width(&style_screen_screen_use_extra_btns_main_default, 0);
	lv_style_set_bg_opa(&style_screen_screen_use_extra_btns_main_default, 255);
	lv_style_set_bg_color(&style_screen_screen_use_extra_btns_main_default, lv_color_hex(0x2195f6));
	lv_style_set_bg_grad_dir(&style_screen_screen_use_extra_btns_main_default, LV_GRAD_DIR_NONE);
	lv_style_set_shadow_width(&style_screen_screen_use_extra_btns_main_default, 0);
	lv_obj_add_style(ui->screen_screen_use_item0, &style_screen_screen_use_extra_btns_main_default, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes 蜂鸣器
	ui->screen_list_tab_6 = lv_tabview_add_tab(ui->screen_list,"蜂鸣器");
	lv_obj_t * screen_list_tab_6_label = lv_label_create(ui->screen_list_tab_6);
	lv_label_set_text(screen_list_tab_6_label, "");

	//Write codes screen_bee_no_pass_btn
	ui->screen_bee_no_pass_btn = lv_btn_create(ui->screen_list_tab_6);
	ui->screen_bee_no_pass_btn_label = lv_label_create(ui->screen_bee_no_pass_btn);
	lv_label_set_text(ui->screen_bee_no_pass_btn_label, "不通过");
	lv_label_set_long_mode(ui->screen_bee_no_pass_btn_label, LV_LABEL_LONG_WRAP);
	lv_obj_align(ui->screen_bee_no_pass_btn_label, LV_ALIGN_CENTER, 0, 0);
	lv_obj_set_style_pad_all(ui->screen_bee_no_pass_btn, 0, LV_STATE_DEFAULT);
	lv_obj_set_width(ui->screen_bee_no_pass_btn_label, LV_PCT(100));
	lv_obj_set_pos(ui->screen_bee_no_pass_btn, 450, 270);
	lv_obj_set_size(ui->screen_bee_no_pass_btn, 150, 75);

	//Write style for screen_bee_no_pass_btn, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_bee_no_pass_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_bee_no_pass_btn, lv_color_hex(0xe70000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_bee_no_pass_btn, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_border_width(ui->screen_bee_no_pass_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_bee_no_pass_btn, 5, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_bee_no_pass_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_bee_no_pass_btn, lv_color_hex(0xffffff), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_bee_no_pass_btn, &lv_font_SourceHanSerifCN2_24, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_bee_no_pass_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_bee_no_pass_btn, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_bee_pass_btn
	ui->screen_bee_pass_btn = lv_btn_create(ui->screen_list_tab_6);
	ui->screen_bee_pass_btn_label = lv_label_create(ui->screen_bee_pass_btn);
	lv_label_set_text(ui->screen_bee_pass_btn_label, "通过");
	lv_label_set_long_mode(ui->screen_bee_pass_btn_label, LV_LABEL_LONG_WRAP);
	lv_obj_align(ui->screen_bee_pass_btn_label, LV_ALIGN_CENTER, 0, 0);
	lv_obj_set_style_pad_all(ui->screen_bee_pass_btn, 0, LV_STATE_DEFAULT);
	lv_obj_set_width(ui->screen_bee_pass_btn_label, LV_PCT(100));
	lv_obj_set_pos(ui->screen_bee_pass_btn, 200, 270);
	lv_obj_set_size(ui->screen_bee_pass_btn, 150, 75);

	//Write style for screen_bee_pass_btn, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_bee_pass_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_bee_pass_btn, lv_color_hex(0x00c700), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_bee_pass_btn, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_border_width(ui->screen_bee_pass_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_bee_pass_btn, 5, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_bee_pass_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_bee_pass_btn, lv_color_hex(0xffffff), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_bee_pass_btn, &lv_font_SourceHanSerifCN2_24, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_bee_pass_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_bee_pass_btn, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_bee_btn
	ui->screen_bee_btn = lv_btn_create(ui->screen_list_tab_6);
	ui->screen_bee_btn_label = lv_label_create(ui->screen_bee_btn);
	lv_label_set_text(ui->screen_bee_btn_label, "蜂鸣器按钮");
	lv_label_set_long_mode(ui->screen_bee_btn_label, LV_LABEL_LONG_WRAP);
	lv_obj_align(ui->screen_bee_btn_label, LV_ALIGN_CENTER, 0, 0);
	lv_obj_set_style_pad_all(ui->screen_bee_btn, 0, LV_STATE_DEFAULT);
	lv_obj_set_width(ui->screen_bee_btn_label, LV_PCT(100));
	lv_obj_set_pos(ui->screen_bee_btn, 273, 45);
	lv_obj_set_size(ui->screen_bee_btn, 281, 116);
	lv_obj_add_flag(ui->screen_bee_btn, LV_OBJ_FLAG_HIDDEN);

	//Write style for screen_bee_btn, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_bee_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_bee_btn, lv_color_hex(0x2195f6), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_bee_btn, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_border_width(ui->screen_bee_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_bee_btn, 5, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_bee_btn, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_bee_btn, lv_color_hex(0xffffff), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_bee_btn, &lv_font_SourceHanSerifCN2_36, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_bee_btn, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_bee_btn, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_use_bee
	ui->screen_use_bee = lv_img_create(ui->screen_list_tab_6);
	lv_obj_add_flag(ui->screen_use_bee, LV_OBJ_FLAG_CLICKABLE);
	lv_img_set_src(ui->screen_use_bee, &_use_2_alpha_50x50);
	lv_img_set_pivot(ui->screen_use_bee, 50,50);
	lv_img_set_angle(ui->screen_use_bee, 0);
	lv_obj_set_pos(ui->screen_use_bee, 20, 280);
	lv_obj_set_size(ui->screen_use_bee, 50, 50);

	//Write style for screen_use_bee, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_img_opa(ui->screen_use_bee, 255, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_bee_use
	ui->screen_bee_use = lv_win_create(ui->screen_list_tab_6, 40);
	lv_obj_t * screen_bee_use_title = lv_win_add_title(ui->screen_bee_use, "操作说明");
	ui->screen_bee_use_item0 = lv_win_add_btn(ui->screen_bee_use, LV_SYMBOL_CLOSE, 40);
	lv_obj_t *screen_bee_use_label = lv_label_create(lv_win_get_content(ui->screen_bee_use));
	lv_obj_set_scrollbar_mode(lv_win_get_content(ui->screen_bee_use), LV_SCROLLBAR_MODE_OFF);
	lv_label_set_text(screen_bee_use_label, "一键测试：\n系统进入该页面后会自动响一秒的蜂鸣器，如果声音正常，按下“通过”按钮，否则按下“不通过”按钮。\n单项测试：\n点击按键之后，系统会响一秒的蜂鸣器，如果声音正常，按下“通过”按钮，否则按下“不通过”按钮。");
	lv_obj_set_pos(ui->screen_bee_use, 151, 21);
	lv_obj_set_size(ui->screen_bee_use, 498, 198);
	lv_obj_set_scrollbar_mode(ui->screen_bee_use, LV_SCROLLBAR_MODE_OFF);
	lv_obj_add_flag(ui->screen_bee_use, LV_OBJ_FLAG_HIDDEN);

	//Write style for screen_bee_use, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_bg_opa(ui->screen_bee_use, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_bee_use, lv_color_hex(0x998989), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_bee_use, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_outline_width(ui->screen_bee_use, 1, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_outline_opa(ui->screen_bee_use, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_outline_color(ui->screen_bee_use, lv_color_hex(0x2d2a2a), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_bee_use, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write style state: LV_STATE_DEFAULT for &style_screen_bee_use_extra_content_main_default
	static lv_style_t style_screen_bee_use_extra_content_main_default;
	ui_init_style(&style_screen_bee_use_extra_content_main_default);
	
	lv_style_set_bg_opa(&style_screen_bee_use_extra_content_main_default, 255);
	lv_style_set_bg_color(&style_screen_bee_use_extra_content_main_default, lv_color_hex(0xeeeef6));
	lv_style_set_bg_grad_dir(&style_screen_bee_use_extra_content_main_default, LV_GRAD_DIR_NONE);
	lv_style_set_text_color(&style_screen_bee_use_extra_content_main_default, lv_color_hex(0x393c41));
	lv_style_set_text_font(&style_screen_bee_use_extra_content_main_default, &lv_font_SourceHanSerifCN2_12);
	lv_style_set_text_opa(&style_screen_bee_use_extra_content_main_default, 255);
	lv_style_set_text_letter_space(&style_screen_bee_use_extra_content_main_default, 0);
	lv_style_set_text_line_space(&style_screen_bee_use_extra_content_main_default, 2);
	lv_obj_add_style(lv_win_get_content(ui->screen_bee_use), &style_screen_bee_use_extra_content_main_default, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write style state: LV_STATE_DEFAULT for &style_screen_bee_use_extra_header_main_default
	static lv_style_t style_screen_bee_use_extra_header_main_default;
	ui_init_style(&style_screen_bee_use_extra_header_main_default);
	
	lv_style_set_bg_opa(&style_screen_bee_use_extra_header_main_default, 255);
	lv_style_set_bg_color(&style_screen_bee_use_extra_header_main_default, lv_color_hex(0xe6e6e6));
	lv_style_set_bg_grad_dir(&style_screen_bee_use_extra_header_main_default, LV_GRAD_DIR_NONE);
	lv_style_set_text_color(&style_screen_bee_use_extra_header_main_default, lv_color_hex(0x393c41));
	lv_style_set_text_font(&style_screen_bee_use_extra_header_main_default, &lv_font_SourceHanSerifCN2_12);
	lv_style_set_text_opa(&style_screen_bee_use_extra_header_main_default, 255);
	lv_style_set_text_letter_space(&style_screen_bee_use_extra_header_main_default, 0);
	lv_style_set_text_line_space(&style_screen_bee_use_extra_header_main_default, 2);
	lv_obj_add_style(lv_win_get_header(ui->screen_bee_use), &style_screen_bee_use_extra_header_main_default, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write style state: LV_STATE_DEFAULT for &style_screen_bee_use_extra_btns_main_default
	static lv_style_t style_screen_bee_use_extra_btns_main_default;
	ui_init_style(&style_screen_bee_use_extra_btns_main_default);
	
	lv_style_set_radius(&style_screen_bee_use_extra_btns_main_default, 8);
	lv_style_set_border_width(&style_screen_bee_use_extra_btns_main_default, 0);
	lv_style_set_bg_opa(&style_screen_bee_use_extra_btns_main_default, 255);
	lv_style_set_bg_color(&style_screen_bee_use_extra_btns_main_default, lv_color_hex(0x2195f6));
	lv_style_set_bg_grad_dir(&style_screen_bee_use_extra_btns_main_default, LV_GRAD_DIR_NONE);
	lv_style_set_shadow_width(&style_screen_bee_use_extra_btns_main_default, 0);
	lv_obj_add_style(ui->screen_bee_use_item0, &style_screen_bee_use_extra_btns_main_default, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes 结果
	ui->screen_list_tab_7 = lv_tabview_add_tab(ui->screen_list,"结果");
	lv_obj_t * screen_list_tab_7_label = lv_label_create(ui->screen_list_tab_7);
	lv_label_set_text(screen_list_tab_7_label, "");

	//Write codes screen_table_1
	ui->screen_table_1 = lv_table_create(ui->screen_list_tab_7);
	lv_table_set_col_cnt(ui->screen_table_1,4);
	lv_table_set_row_cnt(ui->screen_table_1,9);
	lv_table_set_cell_value(ui->screen_table_1,0,0,"项目");
	lv_table_set_cell_value(ui->screen_table_1,1,0,"网口");
	lv_table_set_cell_value(ui->screen_table_1,2,0,"tf");
	lv_table_set_cell_value(ui->screen_table_1,3,0,"gpio");
	lv_table_set_cell_value(ui->screen_table_1,4,0,"按键");
	lv_table_set_cell_value(ui->screen_table_1,5,0,"音频");
	lv_table_set_cell_value(ui->screen_table_1,6,0,"摄像头");
	lv_table_set_cell_value(ui->screen_table_1,7,0,"显示");
	lv_table_set_cell_value(ui->screen_table_1,8,0,"蜂鸣器");
	lv_table_set_cell_value(ui->screen_table_1,0,1,"通过情况");
	lv_table_set_cell_value(ui->screen_table_1,1,1,"未测试");
	lv_table_set_cell_value(ui->screen_table_1,2,1,"未测试");
	lv_table_set_cell_value(ui->screen_table_1,3,1,"未测试");
	lv_table_set_cell_value(ui->screen_table_1,4,1,"未通过");
	lv_table_set_cell_value(ui->screen_table_1,5,1,"未通过");
	lv_table_set_cell_value(ui->screen_table_1,6,1,"未通过");
	lv_table_set_cell_value(ui->screen_table_1,7,1,"未通过");
	lv_table_set_cell_value(ui->screen_table_1,8,1,"未通过");
	lv_table_set_cell_value(ui->screen_table_1,0,2,"数据1");
	lv_table_set_cell_value(ui->screen_table_1,1,2,"0");
	lv_table_set_cell_value(ui->screen_table_1,2,2,"0");
	lv_table_set_cell_value(ui->screen_table_1,3,2,"");
	lv_table_set_cell_value(ui->screen_table_1,4,2,"");
	lv_table_set_cell_value(ui->screen_table_1,5,2,"");
	lv_table_set_cell_value(ui->screen_table_1,6,2,"");
	lv_table_set_cell_value(ui->screen_table_1,7,2,"");
	lv_table_set_cell_value(ui->screen_table_1,8,2,"");
	lv_table_set_cell_value(ui->screen_table_1,0,3,"数据2");
	lv_table_set_cell_value(ui->screen_table_1,1,3,"0");
	lv_table_set_cell_value(ui->screen_table_1,2,3,"0");
	lv_table_set_cell_value(ui->screen_table_1,3,3,"");
	lv_table_set_cell_value(ui->screen_table_1,4,3,"");
	lv_table_set_cell_value(ui->screen_table_1,5,3,"");
	lv_table_set_cell_value(ui->screen_table_1,6,3,"");
	lv_table_set_cell_value(ui->screen_table_1,7,3,"");
	lv_table_set_cell_value(ui->screen_table_1,8,3,"");
	lv_obj_set_pos(ui->screen_table_1, 239, 13);
	lv_obj_set_scrollbar_mode(ui->screen_table_1, LV_SCROLLBAR_MODE_OFF);

	//Write style for screen_table_1, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_pad_top(ui->screen_table_1, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_bottom(ui->screen_table_1, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_left(ui->screen_table_1, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_right(ui->screen_table_1, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_opa(ui->screen_table_1, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_color(ui->screen_table_1, lv_color_hex(0xffffff), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_grad_dir(ui->screen_table_1, LV_GRAD_DIR_NONE, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_border_width(ui->screen_table_1, 2, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_border_opa(ui->screen_table_1, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_border_color(ui->screen_table_1, lv_color_hex(0xd5dee6), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_border_side(ui->screen_table_1, LV_BORDER_SIDE_FULL, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_table_1, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_table_1, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write style for screen_table_1, Part: LV_PART_ITEMS, State: LV_STATE_DEFAULT.
	lv_obj_set_style_text_color(ui->screen_table_1, lv_color_hex(0x393c41), LV_PART_ITEMS|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_table_1, &lv_font_SourceHanSerifCN2_12, LV_PART_ITEMS|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_table_1, 255, LV_PART_ITEMS|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_table_1, LV_TEXT_ALIGN_CENTER, LV_PART_ITEMS|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_opa(ui->screen_table_1, 0, LV_PART_ITEMS|LV_STATE_DEFAULT);
	lv_obj_set_style_border_width(ui->screen_table_1, 3, LV_PART_ITEMS|LV_STATE_DEFAULT);
	lv_obj_set_style_border_opa(ui->screen_table_1, 255, LV_PART_ITEMS|LV_STATE_DEFAULT);
	lv_obj_set_style_border_color(ui->screen_table_1, lv_color_hex(0xd5dee6), LV_PART_ITEMS|LV_STATE_DEFAULT);
	lv_obj_set_style_border_side(ui->screen_table_1, LV_BORDER_SIDE_FULL, LV_PART_ITEMS|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_top(ui->screen_table_1, 10, LV_PART_ITEMS|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_bottom(ui->screen_table_1, 10, LV_PART_ITEMS|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_left(ui->screen_table_1, 10, LV_PART_ITEMS|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_right(ui->screen_table_1, 10, LV_PART_ITEMS|LV_STATE_DEFAULT);

	//Write codes screen_seaa
	ui->screen_seaa = lv_canvas_create(ui->screen_list_tab_7);
	static lv_color_t buf_screen_seaa[209*301*4];
	lv_canvas_set_buffer(ui->screen_seaa, buf_screen_seaa, 209, 301, LV_IMG_CF_TRUE_COLOR_ALPHA);
	lv_canvas_fill_bg(ui->screen_seaa, lv_color_hex(0xffffff), 255);
	lv_obj_set_pos(ui->screen_seaa, 10, 21);
	lv_obj_set_size(ui->screen_seaa, 209, 301);
	lv_obj_set_scrollbar_mode(ui->screen_seaa, LV_SCROLLBAR_MODE_OFF);

	//Write codes screen_label_19
	ui->screen_label_19 = lv_label_create(ui->screen_list_tab_7);
	lv_label_set_text(ui->screen_label_19, "Serial:");
	lv_label_set_long_mode(ui->screen_label_19, LV_LABEL_LONG_WRAP);
	lv_obj_set_pos(ui->screen_label_19, 14, 260);
	lv_obj_set_size(ui->screen_label_19, 84, 25);

	//Write style for screen_label_19, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_border_width(ui->screen_label_19, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_label_19, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_label_19, lv_color_hex(0x000000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_label_19, &lv_font_SourceHanSerifCN2_16, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_label_19, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_letter_space(ui->screen_label_19, 2, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_line_space(ui->screen_label_19, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_label_19, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_opa(ui->screen_label_19, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_top(ui->screen_label_19, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_right(ui->screen_label_19, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_bottom(ui->screen_label_19, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_left(ui->screen_label_19, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_label_19, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_serial
	ui->screen_serial = lv_label_create(ui->screen_list_tab_7);
	lv_label_set_text(ui->screen_serial, "xxxxxxxxxxxxxxxx");
	lv_label_set_long_mode(ui->screen_serial, LV_LABEL_LONG_WRAP);
	lv_obj_set_pos(ui->screen_serial, 12, 288);
	lv_obj_set_size(ui->screen_serial, 203, 28);

	//Write style for screen_serial, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_border_width(ui->screen_serial, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_serial, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_serial, lv_color_hex(0x000000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_serial, &lv_font_SourceHanSerifCN2_16, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_serial, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_letter_space(ui->screen_serial, 2, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_line_space(ui->screen_serial, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_serial, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_opa(ui->screen_serial, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_top(ui->screen_serial, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_right(ui->screen_serial, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_bottom(ui->screen_serial, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_left(ui->screen_serial, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_serial, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_pass_result
	ui->screen_pass_result = lv_img_create(ui->screen_list_tab_7);
	lv_obj_add_flag(ui->screen_pass_result, LV_OBJ_FLAG_CLICKABLE);
	lv_img_set_src(ui->screen_pass_result, &_pass_alpha_160x160);
	lv_img_set_pivot(ui->screen_pass_result, 50,50);
	lv_img_set_angle(ui->screen_pass_result, 0);
	lv_obj_set_pos(ui->screen_pass_result, 36, 68);
	lv_obj_set_size(ui->screen_pass_result, 160, 160);

	//Write style for screen_pass_result, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_img_opa(ui->screen_pass_result, 255, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_no_pass_result
	ui->screen_no_pass_result = lv_img_create(ui->screen_list_tab_7);
	lv_obj_add_flag(ui->screen_no_pass_result, LV_OBJ_FLAG_CLICKABLE);
	lv_img_set_src(ui->screen_no_pass_result, &_no_pass_alpha_160x160);
	lv_img_set_pivot(ui->screen_no_pass_result, 50,50);
	lv_img_set_angle(ui->screen_no_pass_result, 0);
	lv_obj_set_pos(ui->screen_no_pass_result, 36, 68);
	lv_obj_set_size(ui->screen_no_pass_result, 160, 160);

	//Write style for screen_no_pass_result, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_img_opa(ui->screen_no_pass_result, 255, LV_PART_MAIN|LV_STATE_DEFAULT);

	//Write codes screen_label_1
	ui->screen_label_1 = lv_label_create(ui->screen);
	lv_label_set_text(ui->screen_label_1, "RV1106 TEST\n");
	lv_label_set_long_mode(ui->screen_label_1, LV_LABEL_LONG_WRAP);
	lv_obj_set_pos(ui->screen_label_1, 279, 11);
	lv_obj_set_size(ui->screen_label_1, 242, 39);

	//Write style for screen_label_1, Part: LV_PART_MAIN, State: LV_STATE_DEFAULT.
	lv_obj_set_style_border_width(ui->screen_label_1, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_radius(ui->screen_label_1, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(ui->screen_label_1, lv_color_hex(0x000000), LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_font(ui->screen_label_1, &lv_font_SourceHanSerifCN2_23, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_opa(ui->screen_label_1, 255, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_letter_space(ui->screen_label_1, 2, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_line_space(ui->screen_label_1, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_text_align(ui->screen_label_1, LV_TEXT_ALIGN_CENTER, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_bg_opa(ui->screen_label_1, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_top(ui->screen_label_1, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_right(ui->screen_label_1, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_bottom(ui->screen_label_1, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_pad_left(ui->screen_label_1, 0, LV_PART_MAIN|LV_STATE_DEFAULT);
	lv_obj_set_style_shadow_width(ui->screen_label_1, 0, LV_PART_MAIN|LV_STATE_DEFAULT);

	//The custom code of screen.
	

	//Update current screen layout.
	lv_obj_update_layout(ui->screen);

	//Init events for screen.
	events_init_screen(ui);
}
