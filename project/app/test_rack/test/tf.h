#ifndef TF_H
#define TF_H

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#include <errno.h>

typedef struct tf_dev {
    int link_status;
    float write_speed;
    float read_speed;
} tf_dev_t;

int tf_detect(void);
float tf_write_test();
float tf_read_test();
int check_tf_pass(float write_speed,float read_speed);

#endif /* TF_H */