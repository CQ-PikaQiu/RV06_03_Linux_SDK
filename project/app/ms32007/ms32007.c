#include <stdio.h>
#include <stdint.h>
#include "ms32007.h"
#include <linux/i2c-dev.h>
#include <i2c/smbus.h>
#include <string.h>
#include <gpiod.h>
#include <time.h>
#include <signal.h>
//线程
#include <pthread.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/ioctl.h>



static volatile int running = 1;

//0:2P4W 1:4P5W
int motor_type = 1;
int fd = 0;


//定义电机结构体
typedef struct{
    //0:A 1:B
    int index;
    //0:full 1:half
    int step;
    //0:CW 1:CCW
    int rt;
    //0:stop 1:run
    int en;
    //32-16383
    int cycle;
    //
    int hz;
    //0-1023
    int pulse;
}motor_t;

motor_t motor_a;
motor_t motor_b;

int ms32007_close(){
    close(fd);
    return 0;
}

void signal_handler(int signo) {
    if (signo == SIGINT) {
        running = 0;
        close(fd);
        printf("\n程序退出\n");
    }
}

void* ms32007_irq(){
    struct gpiod_chip *chip = NULL;
    struct gpiod_line *line = NULL;
    struct gpiod_line_event event;
    int ret=0;
    uint8_t reg_data_a=0;
    uint8_t reg_data_b=0;
    uint8_t data=0;

    signal(SIGINT, signal_handler);

        // 打开 GPIO 芯片
    chip = gpiod_chip_open_by_name(GPIO_CHIP);
    if (!chip) {
        perror("无法打开 GPIO 芯片");
        return NULL;
    }

    // 获取 GPIO 线
    line = gpiod_chip_get_line(chip, GPIO_LINE);
    if (!line) {
        perror("无法获取 GPIO 线");
        goto cleanup;
    }

    // 配置为双边沿检测（上升沿和下降沿都触发）
    ret = gpiod_line_request_both_edges_events(line, "gpio-monitor");
    if (ret < 0) {
        perror("无法配置事件检测");
        goto cleanup;
    }

    printf("监控 GPIO %d 中... 按 Ctrl+C 退出\n", GPIO_LINE);
    
    while (running) {
        // 等待事件（阻塞模式，超时设为 NULL 表示无限等待）
        ret = gpiod_line_event_wait(line, NULL);
        if (ret < 0) {
            perror("等待事件失败");
            break;
        } else if (ret == 0) {
            continue; // 超时（不会发生，因为未设置超时）
        }

        // 读取事件
        ret = gpiod_line_event_read(line, &event);
        if (ret < 0) {
            perror("读取事件失败");
            break;
        }
        // 打印事件信息
        const char *edge = (event.event_type == GPIOD_LINE_EVENT_RISING_EDGE) ?
                           "上升沿" : "下降沿";
        printf("===================\n");
        reg_data_a = i2c_smbus_read_byte_data(fd, 0X0b);
        printf("READ ms32007 REG 0x0b: %x\n", reg_data_a);
        reg_data_b = i2c_smbus_read_byte_data(fd, 0X0d);
        printf("READ ms32007 REG 0x0d: %x\n", reg_data_b);
        printf("===================\n");
        if(reg_data_a & 0x70 | reg_data_b & 0x70){
            printf("ms32007 working\n");
        }else{
            printf("ms32007 stop\n");
            data = i2c_smbus_read_byte_data(fd, 0X00);
            i2c_smbus_write_byte_data(fd, 0X00, data & 0xfe);
            i2c_smbus_write_byte_data(fd, 0X00, data);
        }
    }

cleanup:
    // 清理资源
    if (line) {
        gpiod_line_release(line);
    }
    if (chip) {
        gpiod_chip_close(chip);
    }

    return NULL;    

}



int motor_init(motor_t motor){
    uint8_t data = 0;
    if(motor.step)
        data |= MS32007_MOTO_STEP_HALF;
    else
        data |= MS32007_MOTO_STEP_FULL;

    data |= ((motor.cycle >> 8) & 0x3f);

    if(motor.index){
        i2c_smbus_write_byte_data(fd, 0X06, data);
        printf("ms32007 REG 0x06: %x\n", data);
    }else{
        i2c_smbus_write_byte_data(fd, 0X02, data);
        printf("ms32007 REG 0x02: %x\n", data);
    }

    data = motor.cycle & 0xff;
    if(motor.index){
        i2c_smbus_write_byte_data(fd, 0X05, data);
        printf("ms32007 REG 0x05: %x\n", data);
    }else{
        i2c_smbus_write_byte_data(fd, 0X01, data);
        printf("ms32007 REG 0x01: %x\n", data);
    }

    data = motor.pulse & 0xff;
    if(motor.index){
        i2c_smbus_write_byte_data(fd, 0X07, data);
        printf("ms32007 REG 0x07: %x\n", data);
    }else{
        i2c_smbus_write_byte_data(fd, 0X03, data);
        printf("ms32007 REG 0x03: %x\n", data);
    }
    
    data = 0;

    if (motor.rt)
        data |= MS32007_MOTO_CCW;
    else
        data |= MS32007_MOTO_CW;
    
    if (motor.en)
        data |= MS32007_MOTO_ENABLE;
    else
        data |= MS32007_MOTO_DISABLE;

    data |= ((motor.pulse >> 8) & 0x03);

    if(motor.index){
        i2c_smbus_write_byte_data(fd, 0X08, data);
        printf("ms32007 REG 0x08: %x\n", data);
    }else{
        i2c_smbus_write_byte_data(fd, 0X04, data);
        printf("ms32007 REG 0x04: %x\n", data);
    }
}

int ms32007_set_write(){
    uint8_t data = i2c_smbus_read_byte_data(fd, 0X00);
    printf("READ ms32007 REG 0x00: %x\n", data);
    if(data & 0x01 == 0){
        i2c_smbus_write_byte_data(fd, 0X00, 0x01 | data);
    }

    printf("ms32007 REG 0x00: %x\n", data | 0x01);
    return 0;
}

int ms32007_printf_reg(){
    for(int i = 0; i < 0x0f; i++){
        printf("%2x  ", i2c_smbus_read_byte_data(fd, i));
    }
    printf("\n");
    
}

int motor_start(motor_t motor){
    uint8_t data = 0;
    data = i2c_smbus_read_byte_data(fd, 0X09);
    data &= 0x0f;
    if(motor.index)
        data |= MS32007_MOTO_B_START;
    else
        data |= MS32007_MOTO_A_START;
    i2c_smbus_write_byte_data(fd, 0X09, data);
    printf("ms32007 REG 0x09: %x\n", data);
}

int ir_control(int ro){
    //0：初始状态
    //1：正转
    //2：反转
    //3:刹车
    uint8_t data = 0;
    data = i2c_smbus_read_byte_data(fd, 0X09);
    data &= 0xF3;
    data |= (ro << 2);
    i2c_smbus_write_byte_data(fd, 0X09, data);
    printf("ms32007 REG 0x09: %x\n", data);
}

int ir_set_on(){
    ir_control(1);
    usleep(100000);
    ir_control(0);
    return 0;
}

int ir_set_off(){
    ir_control(2);
    usleep(100000);
    ir_control(0);
    return 0;
}

int motor_stop(motor_t motor){
    uint8_t data = i2c_smbus_read_byte_data(fd, 0X00);
    uint8_t reg_data = 0;
    data &= 0xc1;
    if(motor.index)
        reg_data = data | MS32007_MOTO_B_STOP;
    else
        reg_data = data | MS32007_MOTO_A_STOP;
 
    i2c_smbus_write_byte_data(fd, 0X00, reg_data);
    printf("ms32007 REG 0x00: %x\n", reg_data);
    usleep(1000);
    i2c_smbus_write_byte_data(fd, 0X00, data);
    printf("ms32007 REG 0x00: %x\n", data);
}

int motor_set_rt(motor_t motor){
    ms32007_set_write();
    uint8_t reg,data;
    if(motor.index)
        reg = 0x08;
    else
        reg = 0x04;

    data = i2c_smbus_read_byte_data(fd, reg);
    printf("READ ms32007 rt REG: %x\n", data);
    if(motor.rt != (data & 0x40)){
        data &= 0xbf;
        data |= motor.rt << 6;
        i2c_smbus_write_byte_data(fd, reg, data);
        printf("WRITE ms32007 rt REG: %x\n", data);
    }
}


int ms32007_init(){
    //定义一个线程id
    pthread_t ms32007_irq_id;
    uint8_t data = 0;
    fd = open(MS32007_I2C_BUS, O_RDWR);
    if (ioctl(fd,I2C_SLAVE_FORCE, MS32007_I2C_ADDR) < 0) {            
        printf("set slave address failed \n");
        return -1;
    }

    if(motor_type)
        data |= MS32007_MOTO_TYPE_4P5W;
    else
        data |= MS32007_MOTO_TYPE_2P4W;
    data |= 0x01;

    printf("ms32007 REG 0x00: %x\n", data);
    i2c_smbus_write_byte_data(fd, 0X00, data);

    i2c_smbus_write_byte_data(fd, 0X0f, 0x01);

    motor_a.index = 0;
    motor_a.step = 0;
    motor_a.cycle = 256;
    motor_a.pulse = 512;
    motor_a.rt = 0;
    motor_a.en = 1;

    motor_b.index = 1;
    motor_b.step = 0;
    motor_b.cycle = 256;
    motor_b.pulse = 512;
    motor_b.rt = 0;
    motor_b.en = 1;

    motor_init(motor_a);
    motor_init(motor_b);

    //创建线程
    if (pthread_create(&ms32007_irq_id, NULL, ms32007_irq, NULL) != 0) {
        printf("Error creating thread\n");
        return -1;
    }

    return 0;
}



int main(){
    ms32007_init();

    for(int i = 0; i < 3; i++){
        ir_set_on();
        sleep(1);
        ir_set_off();
        sleep(1);
    }

    while(running){
        motor_a.rt = 0;
        motor_set_rt(motor_a);
        
        motor_start(motor_a);
        sleep(1);
        usleep(450000);

        motor_a.rt = 1;
        motor_set_rt(motor_a);
        motor_start(motor_a);

        sleep(1);
        usleep(450000);

        motor_a.rt = 0;
        motor_set_rt(motor_a);
        motor_start(motor_a);
        sleep(1);
        usleep(450000);

        motor_a.rt = 1;
        motor_set_rt(motor_a);
        motor_start(motor_a);

        sleep(1);
        usleep(450000);
        


        motor_b.rt = 0;
        motor_set_rt(motor_b);
        motor_start(motor_b);
        motor_start(motor_b);

        sleep(4);

        motor_b.rt = 1;
        motor_set_rt(motor_b);
        motor_start(motor_b);
        motor_start(motor_b);
        motor_start(motor_b);
        motor_start(motor_b);
        motor_start(motor_b);

        sleep(4);

        motor_b.rt = 0;
        motor_set_rt(motor_b);
        motor_start(motor_b);

        sleep(2);

        motor_b.rt = 1;
        motor_set_rt(motor_b);
        motor_start(motor_b);

        sleep(2);
        running = 0;
    }

    return 0;
}
