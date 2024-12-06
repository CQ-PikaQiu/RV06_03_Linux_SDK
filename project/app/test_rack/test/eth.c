#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "eth.h"

#define ETH_PASS_SPEED 90.0 //Mbps

//detect the eth device.
int eth_detect(void){
    //读取/sys/class/net/eth0/carrier
    FILE *fp;
    char buf[10];
    fp = fopen("/sys/class/net/eth0/carrier","r");
    if(fp == NULL){
        printf("open /sys/class/net/eth0/carrier failed\n");
        return -1;
    }
    fgets(buf,10,fp);
    fclose(fp);
    if(strcmp(buf,"1\n") == 0){
        return 1;
    }
    else{
        return 0;
    }
}

float eth_send_test(char *gateway_ip){

    // 使用iperf3  -c 192.168.103.200 -t 5 | grep sender | awk '{print $7}'命令测试，返回该命令的返回值，单位为Mbps
    
    // 发送数据包
    char cmd[100];
    sprintf(cmd,"iperf3 -c %s -t 5 | grep sender | awk '{print $7}'",gateway_ip);
    FILE *fp;
    char buf[10];
    fp = popen(cmd,"r");
    if(fp == NULL){
        printf("popen iperf3 failed\n");
        return -1;
    }
    fgets(buf,10,fp);
    pclose(fp);
    float send_rate = atof(buf);
    return send_rate;
}

float eth_rsv_test(char *gateway_ip){

    // 使用iperf3  -c 192.168.103.200 -t 5 | grep sender | awk '{print $7}'命令测试，返回该命令的返回值，单位为Mbps
    
    // 发送数据包
    char cmd[100];
    sprintf(cmd,"iperf3 -c %s -t 5 -R | grep sender | awk '{print $7}'",gateway_ip);
    FILE *fp;
    char buf[10];
    fp = popen(cmd,"r");
    if(fp == NULL){
        printf("popen iperf3 failed\n");
        return -1;
    }
    fgets(buf,10,fp);
    pclose(fp);
    float send_rate = atof(buf);
    return send_rate;
}


int check_eth_pass(float send_rate,float rsv_rate){
    if(send_rate > ETH_PASS_SPEED && rsv_rate > ETH_PASS_SPEED){
        return 1;
    }
    return 0;
}    
