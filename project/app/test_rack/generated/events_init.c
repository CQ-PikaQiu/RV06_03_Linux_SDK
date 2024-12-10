/*
* Copyright 2024 NXP
* NXP Confidential and Proprietary. This software is owned or controlled by NXP and may only be used strictly in
* accordance with the applicable license terms. By expressly accepting such terms or by downloading, installing,
* activating and/or otherwise using the software, you are agreeing that you have read, and that you agree to
* comply with and are bound by, such license terms.  If you do not agree to be bound by the applicable license
* terms, then you may not retain, install, activate or otherwise use the software.
*/

#include "events_init.h"
#include <stdio.h>
#include "lvgl.h"

#if LV_USE_FREEMASTER
#include "freemaster_client.h"
#endif


#include "custom.h"


extern struct project_pass_t project_pass;
extern int start_sound_btn;
extern int test_btn;
extern int eth_btn;
extern int tf_btn;
extern int gpio_btn;
extern int bee_btn;
extern int cam_btn;
extern int single_test;
extern int sound_no_pass;

static void screen_test_btn_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		test_btn=1;
		break;
	}
	default:
		break;
	}
}
static void screen_eth_btn_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		eth_btn=1;
		break;
	}
	default:
		break;
	}
}
static void screen_tf_btn_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		tf_btn=1;
		break;
	}
	default:
		break;
	}
}
static void screen_gpio_btn_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		gpio_btn=1;
		break;
	}
	default:
		break;
	}
}
static void screen_single_test_sw_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_VALUE_CHANGED:
	{
		lv_obj_t * status_obj = lv_event_get_target(e);
		int status = lv_obj_has_state(status_obj, LV_STATE_CHECKED) ? 1 : 0;
		switch(status) {
		case 0:
		{
			lv_obj_add_flag(guider_ui.screen_gpio_btn, LV_OBJ_FLAG_HIDDEN);
			lv_obj_add_flag(guider_ui.screen_tf_btn, LV_OBJ_FLAG_HIDDEN);
			lv_obj_add_flag(guider_ui.screen_eth_btn, LV_OBJ_FLAG_HIDDEN);
			lv_obj_add_flag(guider_ui.screen_start_btn, LV_OBJ_FLAG_HIDDEN);
			lv_obj_add_flag(guider_ui.screen_cam_btn, LV_OBJ_FLAG_HIDDEN);
			lv_obj_add_flag(guider_ui.screen_bee_btn, LV_OBJ_FLAG_HIDDEN);
			single_test=0;
			break;
		}
		case 1:
		{
			lv_obj_clear_flag(guider_ui.screen_eth_btn, LV_OBJ_FLAG_HIDDEN);
			lv_obj_clear_flag(guider_ui.screen_tf_btn, LV_OBJ_FLAG_HIDDEN);
			lv_obj_clear_flag(guider_ui.screen_gpio_btn, LV_OBJ_FLAG_HIDDEN);
			lv_obj_clear_flag(guider_ui.screen_start_btn, LV_OBJ_FLAG_HIDDEN);
			lv_obj_clear_flag(guider_ui.screen_cam_btn, LV_OBJ_FLAG_HIDDEN);
			lv_obj_clear_flag(guider_ui.screen_bee_btn, LV_OBJ_FLAG_HIDDEN);
			single_test=1;
			break;
		}
		default:
			break;
		}
		break;
	}
	default:
		break;
	}
}
static void screen_key_no_pass_btn_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		project_pass.key_pass=0;
	next_page();
		break;
	}
	default:
		break;
	}
}
static void screen_key_use_item0_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		lv_obj_add_flag(guider_ui.screen_key_use, LV_OBJ_FLAG_HIDDEN);
		break;
	}
	default:
		break;
	}
}
static void screen_use_key_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		lv_obj_clear_flag(guider_ui.screen_key_use, LV_OBJ_FLAG_HIDDEN);
		break;
	}
	default:
		break;
	}
}
static void screen_sound_pass_btn_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		project_pass.sound_pass=1;
	sound_no_pass=0;
	next_page();
		break;
	}
	default:
		break;
	}
}
static void screen_sound_no_pass_mic_btn_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		project_pass.sound_pass=0;
	sound_no_pass=1;
	next_page();
		break;
	}
	default:
		break;
	}
}
static void screen_start_btn_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		start_sound_btn=1;
		break;
	}
	default:
		break;
	}
}
static void screen_use_sound_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		lv_obj_clear_flag(guider_ui.screen_sound_use, LV_OBJ_FLAG_HIDDEN);
		break;
	}
	default:
		break;
	}
}
static void screen_sound_use_item0_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		lv_obj_add_flag(guider_ui.screen_sound_use, LV_OBJ_FLAG_HIDDEN);
		break;
	}
	default:
		break;
	}
}
static void screen_sound_no_pass_spk_btn_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		project_pass.sound_pass=0;
	sound_no_pass=2;
	next_page();
		break;
	}
	default:
		break;
	}
}
static void screen_cam_no_pass_btn_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		project_pass.cam_pass=0;
	next_page();
		break;
	}
	default:
		break;
	}
}
static void screen_cam_pass_btn_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		project_pass.cam_pass=1;
	next_page();
		break;
	}
	default:
		break;
	}
}
static void screen_cam_btn_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		cam_btn=1;
		break;
	}
	default:
		break;
	}
}
static void screen_use_cam_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		lv_obj_clear_flag(guider_ui.screen_cam_use, LV_OBJ_FLAG_HIDDEN);
		break;
	}
	default:
		break;
	}
}
static void screen_cam_use_item0_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		lv_obj_add_flag(guider_ui.screen_cam_use, LV_OBJ_FLAG_HIDDEN);
		break;
	}
	default:
		break;
	}
}
static void screen_screen_pass_btn_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		project_pass.screen_pass=1;
	next_page();
		break;
	}
	default:
		break;
	}
}
static void screen_screen_no_pass_btn_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		project_pass.screen_pass=0;
	next_page();
		break;
	}
	default:
		break;
	}
}
static void screen_use_screen_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		lv_obj_clear_flag(guider_ui.screen_screen_use, LV_OBJ_FLAG_HIDDEN);
		break;
	}
	default:
		break;
	}
}
static void screen_screen_use_item0_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		lv_obj_add_flag(guider_ui.screen_screen_use, LV_OBJ_FLAG_HIDDEN);
		break;
	}
	default:
		break;
	}
}
static void screen_bee_no_pass_btn_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		project_pass.bee_pass=0;
	next_page();
		break;
	}
	default:
		break;
	}
}
static void screen_bee_pass_btn_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		project_pass.bee_pass=1;
	next_page();
		break;
	}
	default:
		break;
	}
}
static void screen_bee_btn_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		bee_btn=1;
		break;
	}
	default:
		break;
	}
}
static void screen_use_bee_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		lv_obj_clear_flag(guider_ui.screen_bee_use, LV_OBJ_FLAG_HIDDEN);
		break;
	}
	default:
		break;
	}
}
static void screen_bee_use_item0_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_CLICKED:
	{
		lv_obj_add_flag(guider_ui.screen_bee_use, LV_OBJ_FLAG_HIDDEN);
		break;
	}
	default:
		break;
	}
}
void events_init_screen(lv_ui *ui)
{
	lv_obj_add_event_cb(ui->screen_test_btn, screen_test_btn_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_eth_btn, screen_eth_btn_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_tf_btn, screen_tf_btn_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_gpio_btn, screen_gpio_btn_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_single_test_sw, screen_single_test_sw_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_key_no_pass_btn, screen_key_no_pass_btn_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_key_use_item0, screen_key_use_item0_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_use_key, screen_use_key_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_sound_pass_btn, screen_sound_pass_btn_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_sound_no_pass_mic_btn, screen_sound_no_pass_mic_btn_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_start_btn, screen_start_btn_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_use_sound, screen_use_sound_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_sound_use_item0, screen_sound_use_item0_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_sound_no_pass_spk_btn, screen_sound_no_pass_spk_btn_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_cam_no_pass_btn, screen_cam_no_pass_btn_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_cam_pass_btn, screen_cam_pass_btn_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_cam_btn, screen_cam_btn_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_use_cam, screen_use_cam_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_cam_use_item0, screen_cam_use_item0_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_screen_pass_btn, screen_screen_pass_btn_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_screen_no_pass_btn, screen_screen_no_pass_btn_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_use_screen, screen_use_screen_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_screen_use_item0, screen_screen_use_item0_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_bee_no_pass_btn, screen_bee_no_pass_btn_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_bee_pass_btn, screen_bee_pass_btn_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_bee_btn, screen_bee_btn_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_use_bee, screen_use_bee_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_bee_use_item0, screen_bee_use_item0_event_handler, LV_EVENT_ALL, ui);
}

void events_init(lv_ui *ui)
{

}
