#include "lvgl/lvgl.h"
#include "lvgl/demos/lv_demos.h"
#include <unistd.h>
#include <pthread.h>
#include <time.h>
#include <stdio.h>
#include <stdlib.h>

#include "custom.h"
#include "lv_conf.h"
#include "generated/gui_guider.h"
#include "generated/events_init.h"

lv_ui guider_ui;
int mode = 0;

pthread_mutex_t lv_task_mutex = PTHREAD_MUTEX_INITIALIZER;

static const char *getenv_default(const char *name, const char *dflt)
{
    return getenv(name) ? : dflt;
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

static void lv_linux_disp_init(void)
{
    const char *device = getenv_default("LV_LINUX_FBDEV_DEVICE", "/dev/fb0");
    lv_display_t * disp = lv_linux_fbdev_create();

    lv_linux_fbdev_set_file(disp, device);

    lv_indev_t * indev = lv_evdev_create(LV_INDEV_TYPE_POINTER, "/dev/input/by-path/platform-ff470000.i2c-event");
    lv_indev_set_display(indev, disp);
}

static void print_usage(char *str)
{
    printf("%s [-V] [-h] [-M mode]:\n", str);
    printf("-V print LVGL version\n");
    printf("-h print this help\n");
    printf("-M mode:\n    0: guider\n    2: music\n    3: benchmark\n    4: stress\n");
}

static void print_lvgl_version(void)
{
    fprintf(stdout, "%d.%d.%d\n",
            LVGL_VERSION_MAJOR,
            LVGL_VERSION_MINOR,
            LVGL_VERSION_PATCH);
}


static void configure(int argc, char **argv)
{
    int opt = 0;
    /* Parse the command-line options. */
    while ((opt = getopt (argc, argv, "hM:V")) != -1) {
        switch (opt) {
        case 'h':
            print_usage(argv[0]);
            exit(EXIT_SUCCESS);
            break;
        case 'V':
            print_lvgl_version();
            exit(EXIT_SUCCESS);
            break;
        case 'M':
            mode = atoi(optarg);
            break;
        case ':':
            print_usage(argv[0]);
            printf("Option -%c requires an argument.\n", optopt);
            break;
        case '?':
            print_usage(argv[0]);
            printf("Unknown option -%c.\n", optopt);
        }
    }
}


int main(int argc, char *argv[])
{
    pthread_t lv_task_thread_id;
    int ret;
    
    configure(argc, argv);
    if(argc == 1) {
        print_usage(argv[0]);
    }
    lv_init();

    /*Linux display device init*/
    lv_linux_disp_init();

    switch (mode) {
        case 0:
            setup_ui(&guider_ui);
            events_init(&guider_ui);
            break;
        case 2:
            lv_demo_music();
            break;
        case 3:
            lv_demo_benchmark();
            break;
        case 4:
            lv_demo_stress();
            break;
        default:
            setup_ui(&guider_ui);
            events_init(&guider_ui);
            break;
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
