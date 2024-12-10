/*
* Copyright 2023 NXP
* NXP Confidential and Proprietary. This software is owned or controlled by NXP and may only be used strictly in
* accordance with the applicable license terms. By expressly accepting such terms or by downloading, installing,
* activating and/or otherwise using the software, you are agreeing that you have read, and that you agree to
* comply with and are bound by, such license terms.  If you do not agree to be bound by the applicable license
* terms, then you may not retain, install, activate or otherwise use the software.
*/


/*********************
 *      INCLUDES
 *********************/
#include <stdio.h>
#include "lvgl.h"
#include "custom.h"
#include <pthread.h>

/*********************
 *      DEFINES
 *********************/

/**********************
 *      TYPEDEFS
 **********************/

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/
extern struct project_pass_t project_pass;
extern pthread_mutex_t lv_task_mutex;
/**
 * Create a demo application
 */

void custom_init(lv_ui *ui)
{
    /* Add your codes here */
}

void set_eth_pass_status(int status){
    lv_obj_add_flag(guider_ui.screen_eth_pass, LV_OBJ_FLAG_HIDDEN);
    lv_obj_add_flag(guider_ui.screen_eth_test, LV_OBJ_FLAG_HIDDEN);
    lv_obj_add_flag(guider_ui.screen_eth_no_pass, LV_OBJ_FLAG_HIDDEN);

    switch(status){
        case 1:
            lv_obj_clear_flag(guider_ui.screen_eth_pass, LV_OBJ_FLAG_HIDDEN);
            break;
        case -1:
            lv_obj_clear_flag(guider_ui.screen_eth_no_pass, LV_OBJ_FLAG_HIDDEN);
            break;
        case 0:
            lv_obj_clear_flag(guider_ui.screen_eth_test, LV_OBJ_FLAG_HIDDEN);
            break;
        default:
            break;
    }
}

void set_eth_attr(int type,double value){
    char str[10];
    switch (type){
    case 1:
        sprintf(str, "%.2fMb/s", value);
        lv_label_set_text(guider_ui.screen_eth_send, str);
        break;
    case 2:
        sprintf(str, "%.2fMb/s", value);
        lv_label_set_text(guider_ui.screen_eth_rcv, str);
        break;
    default:
        break;
    }
}

void set_eth_dect(int value){
    if(value)
        lv_label_set_text(guider_ui.screen_eth_status, "插入");
    else
        lv_label_set_text(guider_ui.screen_eth_status, "未插入");
}

void set_tf_dect(int value){
    if(value)
        lv_label_set_text(guider_ui.screen_tf_status, "插入");
    else
        lv_label_set_text(guider_ui.screen_tf_status, "未插入");
}

void set_tf_attr(int type,double value){
    char str[10];
    
    switch (type){
    case 1:
        sprintf(str, "%.2fMB/s", value);
        lv_label_set_text(guider_ui.screen_tf_write, str);
        break;
    case 2:
        sprintf(str, "%.2fMB/s", value);
        lv_label_set_text(guider_ui.screen_tf_read, str);
        break;
    default:
        break;
    }
}

void set_tf_pass_status(int status){
    lv_obj_add_flag(guider_ui.screen_tf_pass, LV_OBJ_FLAG_HIDDEN);
    lv_obj_add_flag(guider_ui.screen_tf_test, LV_OBJ_FLAG_HIDDEN);
    lv_obj_add_flag(guider_ui.screen_tf_no_pass, LV_OBJ_FLAG_HIDDEN);

    switch(status){
        case 1:
            lv_obj_clear_flag(guider_ui.screen_tf_pass, LV_OBJ_FLAG_HIDDEN);
            break;
        case -1:
            lv_obj_clear_flag(guider_ui.screen_tf_no_pass, LV_OBJ_FLAG_HIDDEN);
            break;
        case 0:
            lv_obj_clear_flag(guider_ui.screen_tf_test, LV_OBJ_FLAG_HIDDEN);
            break;
        default:
            break;
    }
}

void set_gpio_pass_status(int status){
    lv_obj_add_flag(guider_ui.screen_gpio_pass, LV_OBJ_FLAG_HIDDEN);
    lv_obj_add_flag(guider_ui.screen_gpio_test, LV_OBJ_FLAG_HIDDEN);
    lv_obj_add_flag(guider_ui.screen_gpio_no_pass, LV_OBJ_FLAG_HIDDEN);

    switch(status){
        case 1:
            lv_obj_clear_flag(guider_ui.screen_gpio_pass, LV_OBJ_FLAG_HIDDEN);
            break;
        case -1:
            lv_obj_clear_flag(guider_ui.screen_gpio_no_pass, LV_OBJ_FLAG_HIDDEN);
            break;
        case 0:
            lv_obj_clear_flag(guider_ui.screen_gpio_test, LV_OBJ_FLAG_HIDDEN);
            break;
        default:
            break;
    }
}

int next_page(){
    int i = lv_tabview_get_tab_act(guider_ui.screen_list);
    int a = i + 1;
    // i = (i + 1) % lv_obj_get_child_cnt(guider_ui.screen_list);
    // pthread_mutex_lock(&lv_task_mutex);
    lv_tabview_set_act(guider_ui.screen_list, a, LV_ANIM_ON);
    if(a-1 == lv_tabview_get_tab_act(guider_ui.screen_list)){
        a=0;
        lv_tabview_set_act(guider_ui.screen_list, a, LV_ANIM_ON);
    }
    // pthread_mutex_unlock(&lv_task_mutex);
    return a;
};

void init_result(){
    for(int i=1;i<9;i++){
        lv_table_set_cell_value(guider_ui.screen_table_1,i,1,"未测试");
    }
}

void update_eth_result(int status,double send,double rcv){
    if(status == 1){
        lv_table_set_cell_value(guider_ui.screen_table_1,1,1,"通过");
    }else{
        lv_table_set_cell_value(guider_ui.screen_table_1,1,1,"未通过");
    }
    char str[10];
    sprintf(str, "%.2fMb/s", send);
    lv_table_set_cell_value(guider_ui.screen_table_1,1,2,str);
    sprintf(str, "%.2fMb/s", rcv);
    lv_table_set_cell_value(guider_ui.screen_table_1,1,3,str);
}

void update_tf_result(int status,double write,double read){
    if(status == 1){
        lv_table_set_cell_value(guider_ui.screen_table_1,2,1,"通过");
    }else{
        lv_table_set_cell_value(guider_ui.screen_table_1,2,1,"未通过");
    }
    char str[10];
    sprintf(str, "%.2fMB/s", write);
    lv_table_set_cell_value(guider_ui.screen_table_1,2,2,str);
    sprintf(str, "%.2fMB/s", read);
    lv_table_set_cell_value(guider_ui.screen_table_1,2,3,str);
}

void update_gpio_result(int status){
    if(status == 1){
        lv_table_set_cell_value(guider_ui.screen_table_1,3,1,"通过");
    }else{
        lv_table_set_cell_value(guider_ui.screen_table_1,3,1,"未通过");
    }
}

void update_key_result(int status){
    if(status == 1){
        lv_table_set_cell_value(guider_ui.screen_table_1,4,1,"通过");
    }else{
        lv_table_set_cell_value(guider_ui.screen_table_1,4,1,"未通过");
    }
}

void update_sound_result(int status,int state){
    printf("status:%d\n",status);
    if(status == 1){
        lv_table_set_cell_value(guider_ui.screen_table_1,5,1,"通过");
    }else{
        lv_table_set_cell_value(guider_ui.screen_table_1,5,1,"未通过");
    }
    printf("state:%d\n",state);
    if(state == 1){
        lv_table_set_cell_value(guider_ui.screen_table_1,5,1,"mic未通过");
    }else if(state == 2){
        lv_table_set_cell_value(guider_ui.screen_table_1,5,1,"spk未通过");
    }
}

void update_cam_result(int status){
    if(status == 1){
        lv_table_set_cell_value(guider_ui.screen_table_1,6,1,"通过");
    }else{
        lv_table_set_cell_value(guider_ui.screen_table_1,6,1,"未通过");
    }
}

void update_screen_result(int status){
    if(status == 1){
        lv_table_set_cell_value(guider_ui.screen_table_1,7,1,"通过");
    }else{
        lv_table_set_cell_value(guider_ui.screen_table_1,7,1,"未通过");
    }
}

void update_bee_result(int status){
    if(status == 1){
        lv_table_set_cell_value(guider_ui.screen_table_1,8,1,"通过");
    }else{
        lv_table_set_cell_value(guider_ui.screen_table_1,8,1,"未通过");
    }
}

