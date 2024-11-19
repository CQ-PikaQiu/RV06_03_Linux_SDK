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

extern int r_value;
extern int g_value;
extern int b_value;
extern lv_ui guider_ui;

static void screen_r_slider_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_VALUE_CHANGED:
	{
		r_value = lv_slider_get_value(guider_ui.screen_r_slider);
	lv_label_set_text_fmt(guider_ui.screen_r_value, "%d", r_value);
		break;
	}
	default:
		break;
	}
}
static void screen_g_slider_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_VALUE_CHANGED:
	{
		g_value = lv_slider_get_value(guider_ui.screen_g_slider);
	lv_label_set_text_fmt(guider_ui.screen_g_value, "%d", g_value);
		break;
	}
	default:
		break;
	}
}
static void screen_b_slider_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_VALUE_CHANGED:
	{
		b_value = lv_slider_get_value(guider_ui.screen_b_slider);
	lv_label_set_text_fmt(guider_ui.screen_b_value, "%d", b_value);
	
		break;
	}
	default:
		break;
	}
}
static void screen_r_add_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_PRESSED:
	{
		r_value++;
	lv_label_set_text_fmt(guider_ui.screen_r_value, "%d", r_value);
		break;
	}
	default:
		break;
	}
}
static void screen_r_sub_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_PRESSED:
	{
		r_value--;
	lv_label_set_text_fmt(guider_ui.screen_r_value, "%d", r_value);
		break;
	}
	default:
		break;
	}
}
static void screen_g_add_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_PRESSED:
	{
		g_value++;
	lv_label_set_text_fmt(guider_ui.screen_g_value, "%d", g_value);
		break;
	}
	default:
		break;
	}
}
static void screen_b_add_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_PRESSED:
	{
		b_value++;
	lv_label_set_text_fmt(guider_ui.screen_b_value, "%d", b_value);
		break;
	}
	default:
		break;
	}
}
static void screen_g_sub_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_PRESSED:
	{
		g_value--;
	lv_label_set_text_fmt(guider_ui.screen_g_value, "%d", g_value);
		break;
	}
	default:
		break;
	}
}
static void screen_b_sub_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_PRESSED:
	{
		b_value--;
	lv_label_set_text_fmt(guider_ui.screen_b_value, "%d", b_value);
		break;
	}
	default:
		break;
	}
}
static void screen_set_event_handler (lv_event_t *e)
{
	lv_event_code_t code = lv_event_get_code(e);

	switch (code) {
	case LV_EVENT_PRESSED:
	{
		int btn_color=r_value << 16 | g_value << 8 | b_value;
		lv_canvas_fill_bg(guider_ui.screen_canvas, lv_color_hex(btn_color), 255);
		break;
	}
	default:
		break;
	}
}
void events_init_screen(lv_ui *ui)
{
	lv_obj_add_event_cb(ui->screen_r_slider, screen_r_slider_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_g_slider, screen_g_slider_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_b_slider, screen_b_slider_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_r_add, screen_r_add_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_r_sub, screen_r_sub_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_g_add, screen_g_add_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_b_add, screen_b_add_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_g_sub, screen_g_sub_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_b_sub, screen_b_sub_event_handler, LV_EVENT_ALL, ui);
	lv_obj_add_event_cb(ui->screen_set, screen_set_event_handler, LV_EVENT_ALL, ui);
}

void events_init(lv_ui *ui)
{

}
