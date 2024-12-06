#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "eth.h"

#define TF_PASS_SPEED 15.0


//detect the eth device.
int tf_detect(void){
    //查看是否有/dev/mmcblk1设备，如果有返回1，无返回0
    FILE *fp;
    fp = fopen("/dev/mmcblk1","r");
    if(fp == NULL){
        return 0;
    }
    fclose(fp);
    return 1;
}


float tf_write_test(){
    system("echo 3 > /proc/sys/vm/drop_caches");
    char cmd[100];
    sprintf(cmd,"dd if=/dev/zero of=/mnt/sdcard/test bs=2M count=64 conv=sync 2>&1  |grep MB/s|awk '{print $7}'");
    FILE *fp;
    fp = popen(cmd,"r");
    char line[10];
    fgets(line,10,fp);
    //将line转换成float
    float speed;
    sscanf(line,"%fMB/s",&speed);
    // 关闭管道
    pclose(fp);
    return speed;
}

float tf_read_test(){
    system("echo 3 > /proc/sys/vm/drop_caches");
    char cmd[100];
    sprintf(cmd,"dd if=/mnt/sdcard/test of=/dev/null bs=2M count=64 conv=sync 2>&1  |grep MB/s|awk '{print $7}'");
    FILE *fp;
    fp = popen(cmd,"r");
    char line[10];
    fgets(line,10,fp);
    //将line转换成float
    float speed;
    sscanf(line,"%fMB/s",&speed);
    // 关闭管道
    pclose(fp);
    return speed;
}

int check_tf_pass(float write_speed,float read_speed){
    if(write_speed > TF_PASS_SPEED && read_speed > TF_PASS_SPEED){
        return 1;
    }
    return 0;
}
