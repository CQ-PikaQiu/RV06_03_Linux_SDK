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

lv_ui guider_ui;

#define WIDTH   800
#define HEIGHT  480
#define DISP_BUF_SIZE (WIDTH * HEIGHT * 4)
pthread_mutex_t lv_task_mutex = PTHREAD_MUTEX_INITIALIZER;


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

int main(int argc, char *argv[]) {
    lv_disp_drv_t disp_drv;
    pthread_t lv_task_thread_id;
    int ret;

    printf("lvgl_app -> usr\n");
    printf("lvgl_app 0 -> lv_demo_widgets\n");
    printf("lvgl_app 1 -> lv_demo_music\n");
    printf("lvgl_app 2 -> lv_demo_benchmark\n");
    printf("lvgl_app 3 -> lv_demo_stress\n");
    printf("lvgl_app 4 -> usr\n");

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

    if(argc == 2){
        switch(atoi(argv[1])) {
        case 0:
            lv_demo_widgets();
            break;
        case 1:
            lv_demo_music();
            break;
        case 2:
            lv_demo_benchmark();
            break;
        case 3:
            lv_demo_stress();
            break;
        case 4:
            setup_ui(&guider_ui);
            events_init(&guider_ui);
            break;
        default:
            return 0;
        }
    }else{
        setup_ui(&guider_ui);
        events_init(&guider_ui);
    }

    ret = pthread_create(&lv_task_thread_id, NULL, lv_task_thread, NULL);
    if (ret != 0) {
        perror("pthread_create");
        exit(EXIT_FAILURE);
    }

    while(1){
        sleep(1);
    }

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
