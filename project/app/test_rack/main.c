#include "lvgl/lvgl.h"
#include "lvgl/demos/lv_demos.h"
#include "lv_drivers/display/fbdev.h"
#include "lv_app/src/ui.h"
#include "lv_drivers/indev/evdev.h"
#include "lvgl/demos/stress/lv_demo_stress.h"
#include <unistd.h>
#include <pthread.h>
#include <time.h>
#include <sys/time.h>
#include <sys/ipc.h>
#include "lv_conf.h"
#include "generated/gui_guider.h"
#include "generated/events_init.h"
#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <linux/fb.h>
#include <linux/input.h>
//poll头文件
#include <poll.h>
#include <signal.h>
#include <sys/wait.h>

#include "cam.h"
#include "eth.h"
#include "tf.h"
#include "custom.h"

lv_ui guider_ui;
lv_disp_drv_t disp_drv;

#define WIDTH   800
#define HEIGHT  480
#define DISP_BUF_SIZE (WIDTH * HEIGHT * 4)
pthread_mutex_t lv_task_mutex = PTHREAD_MUTEX_INITIALIZER;

int screen_state=0;
int single_test=0;

int key_rec=0;
int key_adc=0;

int cam0_fault=0;
int cam1_fault=0;
int sound_no_pass=0;

eth_dev_t eth_dev;
tf_dev_t tf_dev;

int start_sound_btn;
int test_btn;
int eth_btn;
int tf_btn;
int gpio_btn;
int bee_btn;
int cam_btn;
int cam_show=0;

struct project_pass_t project_pass={-1,-1,-1,-1,-1,-1,-1,-1};

//结构体去不值赋值未
struct project_pass_t project_pass_old={-1,-1,-1,-1,-1,-1,-1,-1};

int check_gpio(int outgpio,int outgpio_desc,int ingpio,int ingpio_desc){
    FILE *fp;
    char str[20];
    char result[20];
    int value;
    int ret=0;
    sprintf(str,"gpioset %d %d=0",outgpio,outgpio_desc);
    system(str);
    sprintf(str,"gpioget %d %d",ingpio,ingpio_desc);
    fp =popen(str,"r");

    fgets(result,8,fp);
    pclose(fp);
    value=atoi(result);
    if(value!=0){
        ret++;
    }

    sprintf(str,"gpioset %d %d=1",outgpio,outgpio_desc);
    system(str);
    sprintf(str,"gpioget %d %d",ingpio,ingpio_desc);
    fp =popen(str,"r");

    fgets(result,8,fp);
    pclose(fp);
    value=atoi(result);
    if(value!=1){
        ret++;
    }

    if(ret)
        return -1;
    else
        return 0; 
}

void check_project_pass() {
    int update=0;

    pthread_mutex_lock(&lv_task_mutex);
    if(project_pass_old.eth_pass != project_pass.eth_pass){
        project_pass_old.eth_pass = project_pass.eth_pass;
        update_eth_result(project_pass.eth_pass,eth_dev.send_speed,eth_dev.rcv_speed);
        update=1;
    }

    if(project_pass_old.tf_pass != project_pass.tf_pass){
        project_pass_old.tf_pass = project_pass.tf_pass;
        update_tf_result(project_pass.tf_pass,tf_dev.write_speed,tf_dev.read_speed);
        update=1;
    }

    if(project_pass_old.gpio_pass != project_pass.gpio_pass){
        project_pass_old.gpio_pass = project_pass.gpio_pass;
        update_gpio_result(project_pass.gpio_pass);
        update=1;
    }

    if(project_pass_old.bee_pass != project_pass.bee_pass){
        project_pass_old.bee_pass = project_pass.bee_pass;
        printf("bee_pass:%d\n",project_pass.bee_pass);
        update_bee_result(project_pass.bee_pass);
        update=1;
    }

    if(project_pass_old.screen_pass != project_pass.screen_pass){
        project_pass_old.screen_pass = project_pass.screen_pass;
        printf("screen_pass:%d\n",project_pass.screen_pass);
        update_screen_result(project_pass.screen_pass);
        update=1;
    }

    if(project_pass_old.cam_pass != project_pass.cam_pass){
        project_pass_old.cam_pass = project_pass.cam_pass;
        printf("cam_pass:%d\n",project_pass.cam_pass);
        update_cam_result(project_pass.cam_pass);
        update=1;
    }

    if(project_pass_old.key_pass != project_pass.key_pass){
        project_pass_old.key_pass = project_pass.key_pass;
        printf("key_pass:%d\n",project_pass.key_pass);
        update_key_result(project_pass.key_pass);
        update=1;
    }

    if(project_pass_old.sound_pass != project_pass.sound_pass){
        project_pass_old.sound_pass = project_pass.sound_pass;
        printf("sound_pass:%d\n",project_pass.sound_pass);
        update_sound_result(project_pass.sound_pass,sound_no_pass);
        update=1;
    }

    pthread_mutex_unlock(&lv_task_mutex);
    if(update = 1){
        if( project_pass_old.eth_pass == 1 && 
            project_pass_old.tf_pass == 1 && 
            project_pass_old.gpio_pass == 1 && 
            project_pass_old.bee_pass == 1 && 
            project_pass_old.screen_pass == 1 && 
            project_pass_old.cam_pass == 1 && 
            project_pass_old.key_pass == 1 && 
            project_pass_old.sound_pass == 1){

            pthread_mutex_lock(&lv_task_mutex);
            lv_obj_add_flag(guider_ui.screen_no_pass_result, LV_OBJ_FLAG_HIDDEN);
            lv_obj_clear_flag(guider_ui.screen_pass_result, LV_OBJ_FLAG_HIDDEN);
            pthread_mutex_unlock(&lv_task_mutex);

        }else{
            pthread_mutex_lock(&lv_task_mutex);
            lv_obj_clear_flag(guider_ui.screen_no_pass_result, LV_OBJ_FLAG_HIDDEN);
            lv_obj_add_flag(guider_ui.screen_pass_result, LV_OBJ_FLAG_HIDDEN);
            pthread_mutex_unlock(&lv_task_mutex);
        }
    }
}

void* lv_task_thread(void* arg) {
    while (1) {

        pthread_mutex_lock(&lv_task_mutex);
        lv_task_handler();
        pthread_mutex_unlock(&lv_task_mutex);

        usleep(1000);
    }
    printf("exit lv_task_thread");
    return NULL;
}

void* eth_test_thread() {
    if(eth_dev.link_status){

        pthread_mutex_lock(&lv_task_mutex);
        set_eth_pass_status(0);
        set_eth_attr(2,0.00);
        set_eth_attr(1,0.00);
        pthread_mutex_unlock(&lv_task_mutex);

        eth_dev.send_speed=eth_send_test("192.168.103.200");

        pthread_mutex_lock(&lv_task_mutex);
        set_eth_attr(1,eth_dev.send_speed);
        pthread_mutex_unlock(&lv_task_mutex);

        eth_dev.rcv_speed=eth_rsv_test("192.168.103.200");

        pthread_mutex_lock(&lv_task_mutex);
        set_eth_attr(2,eth_dev.rcv_speed);
        pthread_mutex_unlock(&lv_task_mutex);

        if(check_eth_pass(eth_dev.send_speed,eth_dev.rcv_speed)){

            pthread_mutex_lock(&lv_task_mutex);
            set_eth_pass_status(1);
            pthread_mutex_unlock(&lv_task_mutex);

            project_pass.eth_pass=1;
        }else{

            pthread_mutex_lock(&lv_task_mutex);
            set_eth_pass_status(-1);
            pthread_mutex_unlock(&lv_task_mutex);

            project_pass.eth_pass=0;
        }
            
    }else{

        pthread_mutex_lock(&lv_task_mutex);
        set_eth_pass_status(-1);
        pthread_mutex_unlock(&lv_task_mutex);

        project_pass.eth_pass=0;
    }
        
    return NULL;
}

void* tf_test_thread() {
    if(tf_dev.link_status){

        pthread_mutex_lock(&lv_task_mutex);
        set_tf_pass_status(0);
        set_tf_attr(2,0.00);
        set_tf_attr(1,0.00);
        pthread_mutex_unlock(&lv_task_mutex);


        tf_dev.write_speed=tf_write_test();

        pthread_mutex_lock(&lv_task_mutex);
        set_tf_attr(1,tf_dev.write_speed);
        pthread_mutex_unlock(&lv_task_mutex);

        tf_dev.read_speed=tf_read_test();

        pthread_mutex_lock(&lv_task_mutex);
        set_tf_attr(2,tf_dev.read_speed);
        pthread_mutex_unlock(&lv_task_mutex);

        if(check_tf_pass(tf_dev.read_speed,tf_dev.read_speed)){
            pthread_mutex_lock(&lv_task_mutex);
            set_tf_pass_status(1);
            pthread_mutex_unlock(&lv_task_mutex);
            project_pass.tf_pass=1;
        }else{
            pthread_mutex_lock(&lv_task_mutex);
            set_tf_pass_status(-1);
            pthread_mutex_unlock(&lv_task_mutex);
            project_pass.tf_pass=0;
        }
            
    }else{
        pthread_mutex_lock(&lv_task_mutex);
        set_tf_pass_status(-1);
        pthread_mutex_unlock(&lv_task_mutex);

        project_pass.tf_pass=0;
    }

    return NULL;
}

void* gpio_test_thread() {
    printf("goio_test\n");
    int count=0;
    pthread_mutex_lock(&lv_task_mutex);
    set_gpio_pass_status(0);
    pthread_mutex_unlock(&lv_task_mutex);
    //定义二维数组
    int gpio_out[12][2]={{1,0},{1,1},{1,8},{1,9},{4,0},{4,1},{4,7},{4,5},{0,0},{0,1},{0,4},{0,5}};
    int gpio_in[12][2]={{5,4},{5,5},{5,6},{5,7},{5,8},{5,9},{5,10},{5,11},{5,12},{5,13},{5,14},{5,15}};
    for(int i=0;i<12;i++){
        if(check_gpio(gpio_out[i][0],gpio_out[i][1],gpio_in[i][0],gpio_in[i][1])!=0){
            printf("group %d :fail \n",i);
            count++;
        }
        else
            printf("group %d :pass \n",i);
    }

    if(count==0){
        pthread_mutex_lock(&lv_task_mutex);
        set_gpio_pass_status(1);
        pthread_mutex_unlock(&lv_task_mutex);
        project_pass.gpio_pass=1;
    }else{
        pthread_mutex_lock(&lv_task_mutex);
        set_gpio_pass_status(-1);
        pthread_mutex_unlock(&lv_task_mutex);
        project_pass.gpio_pass=0;
    }

    return NULL;
}
void* test_thread() {
    printf("test\n");
    int ret;

    pthread_t tf_test_thread_id;
    ret = pthread_create(&tf_test_thread_id, NULL, tf_test_thread, NULL);
    if (ret != 0) {
        perror("pthread_create");
        exit(EXIT_FAILURE);
    }
    usleep(500 * 1000);

    pthread_t eth_test_thread_id;
    ret = pthread_create(&eth_test_thread_id, NULL, eth_test_thread, NULL);
    if (ret != 0) {
        perror("pthread_create");
        exit(EXIT_FAILURE);
    }
    
    usleep(500 * 1000);
    pthread_t gpio_test_thread_id;
    ret = pthread_create(&gpio_test_thread_id, NULL, gpio_test_thread, NULL);
    if (ret != 0) {
        perror("pthread_create");
        exit(EXIT_FAILURE);
    }

    usleep(500 * 1000);
    
    next_page();
    return NULL;
}

void* bee_test_thread() {
    system("gpioset 0 2=1");
    sleep(1);
    system("gpioset 0 2=0");
    return NULL;
}

void* start_sound() {
    system("arecord -f cd -d 1 -Dhw:0 /root/123.wav & aplay test.wav && aplay -Dhw:0 /root/123.wav &");
    return NULL;
}

void* read_key(void* arg) {
    //读取/dev/input/event0和/dev/input/event1，并使用poll进行非阻塞读取，event0读取KEY_VOLUMEUP，evevt1读取KEY_VOLUMEDOWN

    struct pollfd fds[2];
    fds[0].fd = open("/dev/input/event1", O_RDONLY);
    fds[1].fd = open("/dev/input/event2", O_RDONLY);
    fds[0].events = POLLIN;
    fds[1].events = POLLIN;

    while (1) {
        int ret = poll(fds, 2, -1);
        if (ret < 0) {
            perror("poll");
            break;
        }
        if (fds[0].revents & POLLIN) {
            struct input_event ev;
            read(fds[0].fd, &ev, sizeof(struct input_event));
            if (ev.type == EV_KEY && ev.value == 1) {
                if (ev.code == KEY_VOLUMEUP) {
                    pthread_mutex_lock(&lv_task_mutex);
                    lv_canvas_fill_bg(guider_ui.screen_adc_key, lv_color_hex(0x3d3d3d), 255);
                    pthread_mutex_unlock(&lv_task_mutex);
                    if(screen_state==1){
                        key_rec=1;
                    }else{
                        key_rec=0;
                    }
                }
            }else if (ev.type == EV_KEY && ev.value == 0) {
                if (ev.code == KEY_VOLUMEUP) {
                    pthread_mutex_lock(&lv_task_mutex);
                    lv_canvas_fill_bg(guider_ui.screen_adc_key, lv_color_hex(0xadadad), 255);
                    pthread_mutex_unlock(&lv_task_mutex);

                    if(screen_state==1 && key_rec > 0){
                        key_rec=2;
                    }else{
                        key_rec=0;
                    }
                }
            }
        }
        if (fds[1].revents & POLLIN) {
            struct input_event ev;
            read(fds[1].fd, &ev, sizeof(struct input_event));
            if (ev.type == EV_KEY && ev.value == 1) {
                if (ev.code == KEY_VOLUMEDOWN) {
                    pthread_mutex_lock(&lv_task_mutex);
                    lv_canvas_fill_bg(guider_ui.screen_rec_key, lv_color_hex(0x3d3d3d), 255);
                    pthread_mutex_unlock(&lv_task_mutex);

                    if(screen_state==1){
                        key_adc=1;
                    }else{
                        key_adc=0;
                    }
                }
            }else if (ev.type == EV_KEY && ev.value == 0) {
                if (ev.code == KEY_VOLUMEDOWN) {
                    pthread_mutex_lock(&lv_task_mutex);
                    lv_canvas_fill_bg(guider_ui.screen_rec_key, lv_color_hex(0xadadad), 255);
                    pthread_mutex_unlock(&lv_task_mutex);

                    if(screen_state==1 && key_adc > 0){
                        key_adc=2;
                    }else{
                        key_adc=0;
                    }
                }
            }
        }
    }
    return NULL;
}

int leave_web(int state){
    if(state == 1){ // 按键页面
        printf("leave_key_web\n");
    }else if(state == 2) { // 音频页面
        printf("leave_sound_web\n");
    }else if(state == 3) { // 摄像头
        printf("leave_cam_web\n");
        cam_show=0;
        usleep(150 * 1000);
        cam_exit();
        pthread_mutex_lock(&lv_task_mutex);
        lv_canvas_fill_bg(guider_ui.screen_red, lv_color_hex(0xff0000), 255);
        lv_canvas_fill_bg(guider_ui.screen_green, lv_color_hex(0x00ff00), 255);
        lv_canvas_fill_bg(guider_ui.screen_blue, lv_color_hex(0x0000ff), 255); 
        pthread_mutex_unlock(&lv_task_mutex);

    }else if(state == 5) { // 蜂鸣器
        printf("leave_bee_web\n");
    }else{
        printf("leave_web\n");
    }
}
int enter_web(int state){
    if(state == 1){ // 按键页面
        printf("enter_key_web\n");
    }else if(state == 2) { // 音频页面
        start_sound();
        printf("enter_sound_web\n");
    }else if(state == 3) { // 摄像头
        if(single_test == 0){
            cam0_fault=0;
            cam1_fault=0;
            cam_show=1;
            cam_init();
        }
        printf("enter_cam_web\n");
    }else if(state == 5) { // 蜂鸣器
        pthread_t bee_test_thread_id;
        int ret = pthread_create(&bee_test_thread_id, NULL, bee_test_thread, NULL);
        if (ret != 0) { 
            perror("pthread_create");
            exit(EXIT_FAILURE);
        }
        printf("enter_bee_web\n");
    }else{
        printf("enter_web\n");
    }
}


void* hardware_monitor_thread() {
    while(1){
        if(eth_detect()!=eth_dev.link_status){
            eth_dev.link_status=eth_detect();
            pthread_mutex_lock(&lv_task_mutex);
            set_eth_dect(eth_dev.link_status); 
            pthread_mutex_unlock(&lv_task_mutex);
        }

        if(tf_detect()!=tf_dev.link_status){
            tf_dev.link_status=tf_detect();
            pthread_mutex_lock(&lv_task_mutex);
            set_tf_dect(tf_dev.link_status);
            pthread_mutex_unlock(&lv_task_mutex);
        }

        if(single_test){
            if(eth_btn==1){
                pthread_t eth_test_thread_id;
                int ret = pthread_create(&eth_test_thread_id, NULL, eth_test_thread, NULL);
                if (ret != 0) {
                    perror("pthread_create");
                    exit(EXIT_FAILURE);
                }
                eth_btn=0;
            }

            if(tf_btn==1){
                pthread_t tf_test_thread_id;
                int ret = pthread_create(&tf_test_thread_id, NULL, tf_test_thread, NULL);
                if (ret != 0) {
                    perror("pthread_create");
                    exit(EXIT_FAILURE);
                }
                tf_btn=0;
            }

            if(gpio_btn==1){
                pthread_t gpio_test_thread_id;
                int ret = pthread_create(&gpio_test_thread_id, NULL, gpio_test_thread, NULL);
                if (ret != 0) {
                    perror("pthread_create");
                    exit(EXIT_FAILURE);
                }
                gpio_btn=0;
            }

            if(bee_btn==1){
                pthread_t bee_test_thread_id;
                int ret = pthread_create(&bee_test_thread_id, NULL, bee_test_thread, NULL);
                if (ret != 0) { 
                    perror("pthread_create");
                    exit(EXIT_FAILURE);
                }
                bee_btn=0;
            }

            if(start_sound_btn==1){
                start_sound();
                start_sound_btn=0;
            }

            if(cam_btn==1){
                pthread_mutex_lock(&lv_task_mutex);
                lv_obj_add_flag(guider_ui.screen_cam_btn, LV_OBJ_FLAG_HIDDEN);
                pthread_mutex_unlock(&lv_task_mutex);
                cam_show=1;
                cam_init();
                cam_btn=0;
            }
        }

        if(cam1_fault || cam0_fault){
            if(cam1_fault){
                cam1_fault=0;
                pthread_mutex_lock(&lv_task_mutex);
                lv_table_set_cell_value(guider_ui.screen_table_1,6,3,"未通过");
                pthread_mutex_unlock(&lv_task_mutex);
            }

            if(cam0_fault){
                cam0_fault=0;
                pthread_mutex_lock(&lv_task_mutex);
                lv_table_set_cell_value(guider_ui.screen_table_1,6,2,"未通过");
                pthread_mutex_unlock(&lv_task_mutex);
            }
            
            project_pass.cam_pass=-1;

            next_page();
        }

        if(key_adc == 2 && key_rec == 2){
            project_pass.key_pass=1;
            next_page();
            key_adc=0;
            key_rec=0;
        }

        if(test_btn==1){
            pthread_t test_thread_id;
            int ret = pthread_create(&test_thread_id, NULL, test_thread, NULL);
            if (ret != 0) {
                perror("pthread_create");
                exit(EXIT_FAILURE);
            }
            test_btn=0;
        }


        int new_screen_state=lv_tabview_get_tab_act(guider_ui.screen_list);
        if(screen_state != new_screen_state){
            leave_web(screen_state);
            enter_web(new_screen_state);
            screen_state = new_screen_state;
        }

        check_project_pass();

        usleep(100000);
    }
}

int main(int argc, char *argv[]) {

    
    pthread_t lv_task_thread_id;
    pthread_t hardware_monitor_thread_id;
    int ret;

    /*LittlevGL init*/
    lv_init();

    fbdev_init();

    /*A small buffer for LittlevGL to draw the screen's content*/
    static lv_color_t buf1[DISP_BUF_SIZE];
    static lv_color_t buf2[DISP_BUF_SIZE];

    /*Initialize a descriptor for the buffer*/
    static lv_disp_draw_buf_t disp_buf;
    lv_disp_draw_buf_init(&disp_buf, buf1, buf2, DISP_BUF_SIZE);

    /*Initialize and register a display driver*/
    uint32_t dpi = 0;
    lv_disp_drv_init(&disp_drv);
    disp_drv.draw_buf = &disp_buf;
    disp_drv.flush_cb = fbdev_flush;

    // disp_drv.sw_rotate = 1;
    // disp_drv.rotated = LV_DISP_ROT_90;

    disp_drv.hor_res    = WIDTH;
    disp_drv.ver_res    = HEIGHT;

    lv_disp_drv_register(&disp_drv);

    /* Linux input device init */
    evdev_init();

    /* Initialize and register a display input driver */
    lv_indev_drv_t indev_drv;
    lv_indev_drv_init(&indev_drv);      /*Basic initialization*/
    indev_drv.type = LV_INDEV_TYPE_POINTER;
    indev_drv.read_cb = evdev_read;
    lv_indev_drv_register(&indev_drv);

    setup_ui(&guider_ui);
    events_init(&guider_ui);

    ret = pthread_create(&lv_task_thread_id, NULL, lv_task_thread, NULL);
    if (ret != 0) {
        perror("pthread_create");
        exit(EXIT_FAILURE);
    }

    ret = pthread_create(&hardware_monitor_thread_id, NULL, hardware_monitor_thread, NULL);
    if (ret != 0) {
        perror("pthread_create");
        exit(EXIT_FAILURE);
    }

    // 使用popen “cat /proc/cpuinfo | grep Serial | cut -d ':' -f2 | xargs”获取CPU序列号，并显示在UI上。
    FILE *fp = popen("cat /proc/cpuinfo | grep Serial | cut -d ':' -f2 | xargs", "r");
    char serial[20];
    fgets(serial, 20, fp);
    pclose(fp);
    pthread_mutex_lock(&lv_task_mutex);
    lv_label_set_text(guider_ui.screen_serial, serial);
    pthread_mutex_unlock(&lv_task_mutex);

    pthread_mutex_lock(&lv_task_mutex);
    init_result();
    pthread_mutex_unlock(&lv_task_mutex);

    eth_dev.link_status=eth_detect();
    pthread_mutex_lock(&lv_task_mutex);
    set_eth_dect(eth_dev.link_status);
    pthread_mutex_unlock(&lv_task_mutex);
    
    tf_dev.link_status=tf_detect();
    pthread_mutex_lock(&lv_task_mutex);
    set_tf_dect(tf_dev.link_status);
    pthread_mutex_unlock(&lv_task_mutex);


    // double send=eth_send_test("192.168.103.200");
    // double rsv=eth_rsv_test("192.168.103.200");
    // printf("send:%lf,rsv:%lf\n",send,rsv);
    // set_eth_attr(1,send);
    // set_eth_attr(2,rsv);
    // set_tf_attr(1,tf_write_test());
    // set_tf_attr(2,tf_read_test());
    // cam_init();
    printf("start read_key\n");
    read_key(NULL);
    // deinit
    pthread_mutex_destroy(&lv_task_mutex);
    pthread_join(lv_task_thread_id, NULL);

    return 0;
}

/*Set in lv_conf.h as `LV_TICK_CUSTOM_SYS_TIME_EXPR`*/
uint32_t custom_tick_get(void)
{
    static uint64_t start_ms = 0;
    if(start_ms == 0) {
        struct timeval tv_start;
        gettimeofday(&tv_start, NULL);
        start_ms = (tv_start.tv_sec * 1000000 + tv_start.tv_usec) / 1000;
    }

    struct timeval tv_now;
    gettimeofday(&tv_now, NULL);
    uint64_t now_ms;
    now_ms = (tv_now.tv_sec * 1000000 + tv_now.tv_usec) / 1000;

    uint32_t time_ms = now_ms - start_ms;
    return time_ms;
}
