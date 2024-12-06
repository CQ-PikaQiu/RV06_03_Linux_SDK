#ifndef ETH_H
#define ETH_H

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#include <errno.h>

typedef struct eth_dev {
    int link_status;
    int send_speed;
    int rcv_speed;
} eth_dev_t;

int eth_detect(void);
float eth_send_test(char *gateway_ip);
float eth_rsv_test(char *gateway_ip);
int check_eth_pass(float send_rate,float rsv_rate);

#endif /* ETH_H */