#ifndef __MS32007_H__
#define __MS32007_H__

#define MS32007_I2C_BUS                 "/dev/i2c-3"
#define MS32007_I2C_ADDR                0x10

#define MS32007_MOTO_TYPE_2P4W          0 << 7
#define MS32007_MOTO_TYPE_4P5W          1 << 7

#define MS32007_MOTO_STEP_FULL          0 << 7
#define MS32007_MOTO_STEP_HALF          1 << 7

#define MS32007_MOTO_CW                 0 << 6
#define MS32007_MOTO_CCW                0 << 6

#define MS32007_MOTO_ENABLE             1 << 7
#define MS32007_MOTO_DISABLE            0 << 7

#define MS32007_MOTO_A_START            1 << 7
#define MS32007_MOTO_B_START            1 << 6

#define MS32007_MOTO_A_STOP             1 << 2
#define MS32007_MOTO_B_STOP             1 << 1

// 定义要监控的 GPIO 芯片和引脚
#define GPIO_CHIP "gpiochip0"  // GPIO 控制器名称（使用 gpiodetect 命令查看）
#define GPIO_LINE 0           // GPIO 引脚号（使用 gpioinfo 命令查看）

#endif