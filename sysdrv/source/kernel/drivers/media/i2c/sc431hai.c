// SPDX-License-Identifier: GPL-2.0
/*
 * sc431hai driver
 *
 * Copyright (C) 2021 Rockchip Electronics Co., Ltd.
 *
 * V0.0X01.0X01 add poweron function.
 * V0.0X01.0X02 fix mclk issue when probe multiple camera.
 * V0.0X01.0X03 fix gain range.
 * V0.0X01.0X04 add enum_frame_interval function.
 * V0.0X01.0X05 add quick stream on/off
 * V0.0X01.0X06 support thunder boot function.
 */

#include <linux/clk.h>
#include <linux/device.h>
#include <linux/delay.h>
#include <linux/gpio/consumer.h>
#include <linux/i2c.h>
#include <linux/module.h>
#include <linux/pm_runtime.h>
#include <linux/regulator/consumer.h>
#include <linux/sysfs.h>
#include <linux/slab.h>
#include <linux/version.h>
#include <linux/of.h>
#include <linux/of_graph.h>
#include <linux/rk-camera-module.h>
#include <linux/rk-preisp.h>
#include <media/media-entity.h>
#include <media/v4l2-async.h>
#include <media/v4l2-ctrls.h>
#include <media/v4l2-subdev.h>
#include <linux/pinctrl/consumer.h>
#include "../platform/rockchip/isp/rkisp_tb_helper.h"

#define DEBUG 1
#define DRIVER_VERSION			KERNEL_VERSION(0, 0x01, 0x06)

#ifndef V4L2_CID_DIGITAL_GAIN
#define V4L2_CID_DIGITAL_GAIN		V4L2_CID_GAIN
#endif

#define SC431HAI_BITS_PER_SAMPLE		10

#define SC431HAI_LINK_FREQ_315		157500000// 315Mbps
#define SC431HAI_LINK_FREQ_630		315000000// 630Mbps

#define PIXEL_RATE_WITH_315M_10BIT		(SC431HAI_LINK_FREQ_315 * 2 * \
					4 / SC431HAI_BITS_PER_SAMPLE)
#define PIXEL_RATE_WITH_630M_10BIT		(SC431HAI_LINK_FREQ_630 * 2 * \
					2 / SC431HAI_BITS_PER_SAMPLE)
#define PIXEL_RATE_WITH_MAX			(SC431HAI_LINK_FREQ_630 * 2 * \
					2 / SC431HAI_BITS_PER_SAMPLE)

#define SC431HAI_XVCLK_FREQ		27000000

#define CHIP_ID				0xcd6b
#define SC431HAI_REG_CHIP_ID		0x3107

#define SC431HAI_REG_CTRL_MODE		0x0100
#define SC431HAI_MODE_SW_STANDBY		0x0
#define SC431HAI_MODE_STREAMING		BIT(0)

#define SC431HAI_REG_EXPOSURE_H		0x3e00
#define SC431HAI_REG_EXPOSURE_M		0x3e01
#define SC431HAI_REG_EXPOSURE_L		0x3e02
#define	SC431HAI_EXPOSURE_MIN		2
#define	SC431HAI_EXPOSURE_STEP		1
#define SC431HAI_VTS_MAX			0x7fff

#define SC431HAI_REG_DIG_GAIN		0x3e06
#define SC431HAI_REG_DIG_FINE_GAIN	0x3e07
#define SC431HAI_REG_ANA_GAIN		0x3e08
#define SC431HAI_REG_ANA_FINE_GAIN	0x3e09

#define SC431HAI_REG_SDIG_GAIN		 0x3e10
#define SC431HAI_REG_SDIG_FINE_GAIN	 0x3e11
#define SC431HAI_REG_SANA_GAIN		 0x3e12
#define SC431HAI_REG_SANA_FINE_GAIN	 0x3e13

#define SC431HAI_GAIN_MIN		0x0040
#define SC431HAI_GAIN_MAX		49674   //48.510*16*64
#define SC431HAI_GAIN_STEP		1
#define SC431HAI_GAIN_DEFAULT		0x040

#define SC431HAI_REG_GROUP_HOLD		0x3812
#define SC431HAI_GROUP_HOLD_START	0x00
#define SC431HAI_GROUP_HOLD_END		0x30

#define SC431HAI_REG_HIGH_TEMP_H		0x3974
#define SC431HAI_REG_HIGH_TEMP_L		0x3975

#define SC431HAI_REG_TEST_PATTERN	0x4501
#define SC431HAI_TEST_PATTERN_BIT_MASK	BIT(3)

#define SC431HAI_REG_VTS_H		0x320e
#define SC431HAI_REG_VTS_L		0x320f

#define SC431HAI_FLIP_MIRROR_REG		0x3221

#define SC431HAI_FETCH_EXP_H(VAL)		(((VAL) >> 12) & 0xF)
#define SC431HAI_FETCH_EXP_M(VAL)		(((VAL) >> 4) & 0xFF)
#define SC431HAI_FETCH_EXP_L(VAL)		(((VAL) & 0xF) << 4)

#define SC431HAI_FETCH_AGAIN_H(VAL)		(((VAL) >> 8) & 0x03)
#define SC431HAI_FETCH_AGAIN_L(VAL)		((VAL) & 0xFF)

#define SC431HAI_FETCH_MIRROR(VAL, ENABLE)	(ENABLE ? VAL | 0x06 : VAL & 0xf9)
#define SC431HAI_FETCH_FLIP(VAL, ENABLE)		(ENABLE ? VAL | 0x60 : VAL & 0x9f)

#define REG_DELAY			0xFFFE
#define REG_NULL			0xFFFF

#define SC431HAI_REG_VALUE_08BIT		1
#define SC431HAI_REG_VALUE_16BIT		2
#define SC431HAI_REG_VALUE_24BIT		3

#define OF_CAMERA_PINCTRL_STATE_DEFAULT	"rockchip,camera_default"
#define OF_CAMERA_PINCTRL_STATE_SLEEP	"rockchip,camera_sleep"
#define OF_CAMERA_HDR_MODE		"rockchip,camera-hdr-mode"
#define SC431HAI_NAME			"sc431hai"

static const char * const sc431hai_supply_names[] = {
	"avdd",		/* Analog power */
	"dovdd",	/* Digital I/O power */
	"dvdd",		/* Digital core power */
};

#define SC431HAI_NUM_SUPPLIES ARRAY_SIZE(sc431hai_supply_names)

struct regval {
	u16 addr;
	u8 val;
};

struct sc431hai_mode {
	u32 bus_fmt;
	u32 width;
	u32 height;
	struct v4l2_fract max_fps;
	u32 hts_def;
	u32 vts_def;
	u32 exp_def;
	const struct regval *reg_list;
	u32 hdr_mode;
	u32 mipi_freq_idx;
	u32 vc[PAD_MAX];
};

struct sc431hai {
	struct i2c_client	*client;
	struct clk		*xvclk;
	struct gpio_desc	*reset_gpio;
	struct gpio_desc	*pwdn_gpio;
	struct regulator_bulk_data supplies[SC431HAI_NUM_SUPPLIES];

	struct pinctrl		*pinctrl;
	struct pinctrl_state	*pins_default;
	struct pinctrl_state	*pins_sleep;

	struct v4l2_subdev	subdev;
	struct media_pad	pad;
	struct v4l2_ctrl_handler ctrl_handler;
	struct v4l2_ctrl	*exposure;
	struct v4l2_ctrl	*anal_gain;
	struct v4l2_ctrl	*digi_gain;
	struct v4l2_ctrl	*hblank;
	struct v4l2_ctrl	*vblank;
	struct v4l2_ctrl	*test_pattern;
	struct v4l2_ctrl	*pixel_rate;
	struct v4l2_ctrl	*link_freq;
	struct mutex		mutex;
	struct v4l2_fract	cur_fps;
	bool			streaming;
	bool			power_on;
	unsigned int		lane_num;
	unsigned int		cfg_num;
	const struct sc431hai_mode *cur_mode;
	u32			module_index;
	const char		*module_facing;
	const char		*module_name;
	const char		*len_name;
	u32			cur_vts;
	bool			is_thunderboot;
	bool			is_first_streamoff;
	struct preisp_hdrae_exp_s init_hdrae_exp;
};

#define to_sc431hai(sd) container_of(sd, struct sc431hai, subdev)

/*
 * Xclk 24Mhz
 */
static const struct regval sc431hai_global_regs[] = {
	{REG_NULL, 0x00},
};

/*
 * Xclk 27Mhz
 * max_framerate 30fps
 * mipi_datarate per lane 315Mbps, 4lane
 */
static const struct regval sc431hai_linear_10_2560x1440_4lane_regs[] = {
	{0x0100, 0x00},
	{0x36e9, 0x80},
	{0x37f9, 0x80},
	{0x301f, 0x01},
	{0x3058, 0x21},
	{0x3059, 0x53},
	{0x305a, 0x40},
	{0x3250, 0x00},
	{0x3301, 0x0c},
	{0x3304, 0x50},
	{0x3305, 0x00},
	{0x3306, 0x50},
	{0x3307, 0x04},
	{0x3308, 0x0a},
	{0x3309, 0x60},
	{0x330b, 0xc8},
	{0x330d, 0x08},
	{0x330e, 0x38},
	{0x331e, 0x41},
	{0x331f, 0x51},
	{0x3333, 0x10},
	{0x3334, 0x40},
	{0x3364, 0x5e},
	{0x338e, 0xe2},
	{0x338f, 0x80},
	{0x3390, 0x08},
	{0x3391, 0x18},
	{0x3392, 0xb8},
	{0x3393, 0x12},
	{0x3394, 0x14},
	{0x3395, 0x10},
	{0x3396, 0x88},
	{0x3397, 0x98},
	{0x3398, 0xb8},
	{0x3399, 0x10},
	{0x339a, 0x16},
	{0x339b, 0x1c},
	{0x339c, 0x40},
	{0x33ac, 0x0a},
	{0x33ad, 0x10},
	{0x33ae, 0x4f},
	{0x33af, 0x5e},
	{0x33b2, 0x50},
	{0x33b3, 0x10},
	{0x33f8, 0x00},
	{0x33f9, 0x50},
	{0x33fa, 0x00},
	{0x33fb, 0x50},
	{0x33fc, 0x48},
	{0x33fd, 0x78},
	{0x349f, 0x03},
	{0x34a6, 0x40},
	{0x34a7, 0x58},
	{0x34a8, 0x10},
	{0x34a9, 0x10},
	{0x34f8, 0x78},
	{0x34f9, 0x10},
	{0x3633, 0x44},
	{0x363b, 0x8f},
	{0x363c, 0x02},
	{0x3641, 0x08},
	{0x3654, 0x20},
	{0x3674, 0xc2},
	{0x3675, 0xb4},
	{0x3676, 0x88},
	{0x367c, 0x88},
	{0x367d, 0xb8},
	{0x3690, 0x34},
	{0x3691, 0x44},
	{0x3692, 0x54},
	{0x3693, 0x88},
	{0x3694, 0x98},
	{0x3696, 0x80},
	{0x3697, 0x83},
	{0x3698, 0x81},
	{0x3699, 0x81},
	{0x369a, 0x84},
	{0x369b, 0x82},
	{0x36a2, 0x80},
	{0x36a3, 0x88},
	{0x36a4, 0xf8},
	{0x36a5, 0xb8},
	{0x36a6, 0x98},
	{0x36d0, 0x15},
	{0x36ed, 0x18},
	{0x370f, 0x01},
	{0x3722, 0x03},
	{0x3724, 0x92},
	{0x3727, 0x14},
	{0x37b0, 0x17},
	{0x37b1, 0x9b},
	{0x37b2, 0x9b},
	{0x37b3, 0x88},
	{0x37b4, 0xb8},
	{0x37fa, 0x23},
	{0x37fb, 0x54},
	{0x37fc, 0x21},
	{0x391f, 0x41},
	{0x3926, 0xe0},
	{0x3933, 0x80},
	{0x3934, 0xfa},
	{0x3935, 0x00},
	{0x3936, 0x5b},
	{0x3937, 0xb0},
	{0x3938, 0xa6},
	{0x3939, 0x00},
	{0x393a, 0x0f},
	{0x393b, 0x01},
	{0x393c, 0x0b},
	{0x393d, 0x02},
	{0x393e, 0x80},
	{0x3e00, 0x00},
	{0x3e01, 0xba},
	{0x3e02, 0xd0},
	{0x3e16, 0x00},
	{0x3e17, 0xc5},
	{0x3e18, 0x00},
	{0x3e19, 0xc5},
	{0x4509, 0x20},
	{0x450d, 0x0b},
	{0x5780, 0x76},
	{0x5784, 0x0a},
	{0x5785, 0x04},
	{0x5787, 0x0a},
	{0x5788, 0x0a},
	{0x5789, 0x08},
	{0x578a, 0x0a},
	{0x578b, 0x0a},
	{0x578c, 0x08},
	{0x578d, 0x40},
	{0x5790, 0x08},
	{0x5791, 0x04},
	{0x5792, 0x04},
	{0x5793, 0x08},
	{0x5794, 0x04},
	{0x5795, 0x04},
	{0x57ac, 0x00},
	{0x57ad, 0x00},
	{0x36e9, 0x44},
	{0x37f9, 0x44},
	{0x0100, 0x01},
	{REG_NULL, 0x00},
};

/*
 * Xclk 27Mhz
 * max_framerate 30fps
 * mipi_datarate per lane 630Mbps, 2lane
 */
static const struct regval sc431hai_linear_10_2560x1440_2lane_regs[] = {
	{0x0100, 0x00},
	{0x36e9, 0x80},
	{0x37f9, 0x80},
	{0x3018, 0x3a},
	{0x3019, 0x0c},
	{0x301f, 0x05},
	{0x3058, 0x21},
	{0x3059, 0x53},
	{0x305a, 0x40},
	{0x3250, 0x00},
	{0x3301, 0x0c},
	{0x3304, 0x50},
	{0x3305, 0x00},
	{0x3306, 0x50},
	{0x3307, 0x04},
	{0x3308, 0x0a},
	{0x3309, 0x60},
	{0x330b, 0xc8},
	{0x330d, 0x08},
	{0x330e, 0x38},
	{0x331e, 0x41},
	{0x331f, 0x51},
	{0x3333, 0x10},
	{0x3334, 0x40},
	{0x3364, 0x5e},
	{0x338e, 0xe2},
	{0x338f, 0x80},
	{0x3390, 0x08},
	{0x3391, 0x18},
	{0x3392, 0xb8},
	{0x3393, 0x12},
	{0x3394, 0x14},
	{0x3395, 0x10},
	{0x3396, 0x88},
	{0x3397, 0x98},
	{0x3398, 0xb8},
	{0x3399, 0x10},
	{0x339a, 0x16},
	{0x339b, 0x1c},
	{0x339c, 0x40},
	{0x33ac, 0x0a},
	{0x33ad, 0x10},
	{0x33ae, 0x4f},
	{0x33af, 0x5e},
	{0x33b2, 0x50},
	{0x33b3, 0x10},
	{0x33f8, 0x00},
	{0x33f9, 0x50},
	{0x33fa, 0x00},
	{0x33fb, 0x50},
	{0x33fc, 0x48},
	{0x33fd, 0x78},
	{0x349f, 0x03},
	{0x34a6, 0x40},
	{0x34a7, 0x58},
	{0x34a8, 0x10},
	{0x34a9, 0x10},
	{0x34f8, 0x78},
	{0x34f9, 0x10},
	{0x3633, 0x44},
	{0x363b, 0x8f},
	{0x363c, 0x02},
	{0x3641, 0x08},
	{0x3654, 0x20},
	{0x3674, 0xc2},
	{0x3675, 0xb4},
	{0x3676, 0x88},
	{0x367c, 0x88},
	{0x367d, 0xb8},
	{0x3690, 0x34},
	{0x3691, 0x44},
	{0x3692, 0x54},
	{0x3693, 0x88},
	{0x3694, 0x98},
	{0x3696, 0x80},
	{0x3697, 0x83},
	{0x3698, 0x81},
	{0x3699, 0x81},
	{0x369a, 0x84},
	{0x369b, 0x82},
	{0x36a2, 0x80},
	{0x36a3, 0x88},
	{0x36a4, 0xf8},
	{0x36a5, 0xb8},
	{0x36a6, 0x98},
	{0x36d0, 0x15},
	{0x36ec, 0x55},
	{0x36ed, 0x18},
	{0x370f, 0x01},
	{0x3722, 0x03},
	{0x3724, 0x92},
	{0x3727, 0x14},
	{0x37b0, 0x17},
	{0x37b1, 0x9b},
	{0x37b2, 0x9b},
	{0x37b3, 0x88},
	{0x37b4, 0xb8},
	{0x37fa, 0x23},
	{0x37fb, 0x54},
	{0x37fc, 0x21},
	{0x391f, 0x41},
	{0x3926, 0xe0},
	{0x3933, 0x80},
	{0x3934, 0xfa},
	{0x3935, 0x00},
	{0x3936, 0x5b},
	{0x3937, 0xb0},
	{0x3938, 0xa6},
	{0x3939, 0x00},
	{0x393a, 0x0f},
	{0x393b, 0x01},
	{0x393c, 0x0b},
	{0x393d, 0x02},
	{0x393e, 0x80},
	{0x3e00, 0x00},
	{0x3e01, 0xba},
	{0x3e02, 0xd0},
	{0x3e16, 0x00},
	{0x3e17, 0xc5},
	{0x3e18, 0x00},
	{0x3e19, 0xc5},
	{0x4509, 0x20},
	{0x450d, 0x0b},
	{0x4819, 0x08},
	{0x481b, 0x05},
	{0x481d, 0x11},
	{0x481f, 0x04},
	{0x4821, 0x09},
	{0x4823, 0x04},
	{0x4825, 0x04},
	{0x4827, 0x04},
	{0x4829, 0x07},
	{0x5780, 0x76},
	{0x5784, 0x0a},
	{0x5785, 0x04},
	{0x5787, 0x0a},
	{0x5788, 0x0a},
	{0x5789, 0x08},
	{0x578a, 0x0a},
	{0x578b, 0x0a},
	{0x578c, 0x08},
	{0x578d, 0x40},
	{0x5790, 0x08},
	{0x5791, 0x04},
	{0x5792, 0x04},
	{0x5793, 0x08},
	{0x5794, 0x04},
	{0x5795, 0x04},
	{0x57ac, 0x00},
	{0x57ad, 0x00},
	{0x36e9, 0x44},
	{0x37f9, 0x44},
	{0x0100, 0x01},
	//{0x0100, 0x01},
	{REG_NULL, 0x00},
};

static const struct sc431hai_mode supported_modes[] = {
	{
		.width = 2560,
		.height = 1440,
		.max_fps = {
			.numerator = 10000,
			.denominator = 300000,
		},
		.exp_def = 0x0080,
		.hts_def = 0x0578 * 2,
		.vts_def = 0x05dc,
		.bus_fmt = MEDIA_BUS_FMT_SBGGR10_1X10,
		.reg_list = sc431hai_linear_10_2560x1440_4lane_regs,
		.hdr_mode = NO_HDR,
		.mipi_freq_idx = 0,
		.vc[PAD0] = V4L2_MBUS_CSI2_CHANNEL_0,
	},
	{
		.width = 2560,
		.height = 1440,
		.max_fps = {
			.numerator = 10000,
			.denominator = 300000,
		},
		.exp_def = 0x0080,
		.hts_def = 0x0578 * 2,
		.vts_def = 0x05dc,
		.bus_fmt = MEDIA_BUS_FMT_SBGGR10_1X10,
		.reg_list = sc431hai_linear_10_2560x1440_2lane_regs,
		.hdr_mode = NO_HDR,
		.mipi_freq_idx = 1,
		.vc[PAD0] = V4L2_MBUS_CSI2_CHANNEL_0,
	},
};

static const s64 link_freq_menu_items[] = {
	SC431HAI_LINK_FREQ_315,
	SC431HAI_LINK_FREQ_630,
};

static int __sc431hai_power_on(struct sc431hai *sc431hai);

/* Write registers up to 4 at a time */
static int sc431hai_write_reg(struct i2c_client *client, u16 reg,
			    u32 len, u32 val)
{
	u32 buf_i, val_i;
	u8 buf[6];
	u8 *val_p;
	__be32 val_be;

	if (len > 4)
		return -EINVAL;

	buf[0] = reg >> 8;
	buf[1] = reg & 0xff;

	val_be = cpu_to_be32(val);
	val_p = (u8 *)&val_be;
	buf_i = 2;
	val_i = 4 - len;

	while (val_i < 4)
		buf[buf_i++] = val_p[val_i++];

	if (i2c_master_send(client, buf, len + 2) != len + 2)
		return -EIO;
	return 0;
}

static int sc431hai_write_array(struct i2c_client *client,
			       const struct regval *regs)
{
	u32 i;
	int ret = 0;

	for (i = 0; ret == 0 && regs[i].addr != REG_NULL; i++)
		ret = sc431hai_write_reg(client, regs[i].addr,
					SC431HAI_REG_VALUE_08BIT, regs[i].val);

	return ret;
}

/* Read registers up to 4 at a time */
static int sc431hai_read_reg(struct i2c_client *client, u16 reg, unsigned int len,
			    u32 *val)
{
	struct i2c_msg msgs[2];
	u8 *data_be_p;
	__be32 data_be = 0;
	__be16 reg_addr_be = cpu_to_be16(reg);
	int ret;

	if (len > 4 || !len)
		return -EINVAL;

	data_be_p = (u8 *)&data_be;
	/* Write register address */
	msgs[0].addr = client->addr;
	msgs[0].flags = 0;
	msgs[0].len = 2;
	msgs[0].buf = (u8 *)&reg_addr_be;

	/* Read data from register */
	msgs[1].addr = client->addr;
	msgs[1].flags = I2C_M_RD;
	msgs[1].len = len;
	msgs[1].buf = &data_be_p[4 - len];

	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
	if (ret != ARRAY_SIZE(msgs))
		return -EIO;

	*val = be32_to_cpu(data_be);

	return 0;
}

static int sc431hai_set_gain_reg(struct sc431hai *sc431hai, u32 gain)
{
	u32 coarse_again = 0, coarse_dgain = 0, fine_again = 0, fine_dgain = 0;
	int ret = 0, gain_factor;

	if (gain < 64)
		gain = 64;
	else if (gain > SC431HAI_GAIN_MAX )
		gain = SC431HAI_GAIN_MAX ;

	gain_factor = gain * 1000 / 64;
	if (gain_factor < 1540) {
		coarse_again = 0x00;
		coarse_dgain = 0x00;
		fine_dgain = 0x80;
		fine_again = gain_factor * 32 / 1000;
	} else if (gain_factor < 3080) {//mark
		coarse_again = 0x80;
		coarse_dgain = 0x00;
		fine_dgain = 0x80;
		fine_again = gain_factor * 32 / 1540;
	} else if (gain_factor < 6160) {
		coarse_again = 0x81;
		coarse_dgain = 0x00;
		fine_dgain = 0x80;
		fine_again = gain_factor * 32 / 3080;
	} else if (gain_factor < 12320) {
		coarse_again = 0x83;
		coarse_dgain = 0x00;
		fine_dgain = 0x80;
		fine_again = gain_factor * 32 / 6160;
	} else if (gain_factor < 24640) {
		coarse_again = 0x87;
		coarse_dgain = 0x00;
		fine_dgain = 0x80;
		fine_again = gain_factor * 32 / 12320;
	} else if (gain_factor < 48510) {
		coarse_again = 0x8f;
		coarse_dgain = 0x00;
		fine_dgain = 0x80;
		fine_again = gain_factor * 32 / 24640;
	} else if (gain_factor < 48510 * 2) {
		//open dgain begin  max digital gain 4X
		coarse_again = 0x8f;
		coarse_dgain = 0x00;
		fine_again = 0x3f;
		fine_dgain = gain_factor * 128 / 48510;
	} else if (gain_factor < 48510 * 4) {
		coarse_again = 0x8f;
		coarse_dgain = 0x01;
		fine_again = 0x3f;
		fine_dgain = gain_factor * 128 / 48510 / 2;
	} else if (gain_factor < 48510 * 8) {
		coarse_again = 0x8f;
		coarse_dgain = 0x03;
		fine_again = 0x3f;
		fine_dgain = gain_factor * 128 / 48510 / 4;
	} else if (gain_factor < 48510 * 16) {
		coarse_again = 0x8f;
		coarse_dgain = 0x07;
		fine_again = 0x3f;
		fine_dgain = gain_factor * 128 / 48510 / 8;
	}
	// dev_dbg(&client->dev, "c_again: 0x%x, c_dgain: 0x%x, f_again: 0x%x, f_dgain: 0x%0x\n",
	// 	    coarse_again, coarse_dgain, fine_again, fine_dgain);

	if (sc431hai->is_thunderboot && rkisp_tb_get_state() == RKISP_TB_NG) {
		sc431hai->is_thunderboot = false;
		__sc431hai_power_on(sc431hai);
	}

	ret = sc431hai_write_reg(sc431hai->client,
				SC431HAI_REG_DIG_GAIN,
				SC431HAI_REG_VALUE_08BIT,
				coarse_dgain);
	ret |= sc431hai_write_reg(sc431hai->client,
				 SC431HAI_REG_DIG_FINE_GAIN,
				 SC431HAI_REG_VALUE_08BIT,
				 fine_dgain);
	ret |= sc431hai_write_reg(sc431hai->client,
				 SC431HAI_REG_ANA_GAIN,
				 SC431HAI_REG_VALUE_08BIT,
				 coarse_again);
	ret |= sc431hai_write_reg(sc431hai->client,
				 SC431HAI_REG_ANA_FINE_GAIN,
				 SC431HAI_REG_VALUE_08BIT,
				 fine_again);


	return ret;
}

static int sc431hai_get_reso_dist(const struct sc431hai_mode *mode,
				 struct v4l2_mbus_framefmt *framefmt)
{
	return abs(mode->width - framefmt->width) +
	       abs(mode->height - framefmt->height);
}

static const struct sc431hai_mode *
sc431hai_find_best_fit(struct v4l2_subdev_format *fmt)
{
	struct v4l2_mbus_framefmt *framefmt = &fmt->format;
	int dist;
	int cur_best_fit = 0;
	int cur_best_fit_dist = -1;
	unsigned int i;

	for (i = 0; i < ARRAY_SIZE(supported_modes); i++) {
		dist = sc431hai_get_reso_dist(&supported_modes[i], framefmt);
		if (cur_best_fit_dist == -1 || dist < cur_best_fit_dist) {
			cur_best_fit_dist = dist;
			cur_best_fit = i;
		}
	}

	return &supported_modes[cur_best_fit];
}

static int sc431hai_set_fmt(struct v4l2_subdev *sd,
			   struct v4l2_subdev_pad_config *cfg,
			   struct v4l2_subdev_format *fmt)
{
	struct sc431hai *sc431hai = to_sc431hai(sd);
	const struct sc431hai_mode *mode;
	s64 h_blank, vblank_def;

	mutex_lock(&sc431hai->mutex);

	mode = sc431hai_find_best_fit(fmt);
	fmt->format.code = mode->bus_fmt;
	fmt->format.width = mode->width;
	fmt->format.height = mode->height;
	fmt->format.field = V4L2_FIELD_NONE;
	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
#else
		mutex_unlock(&sc431hai->mutex);
		return -ENOTTY;
#endif
	} else {
		sc431hai->cur_mode = mode;
		h_blank = mode->hts_def - mode->width;
		__v4l2_ctrl_modify_range(sc431hai->hblank, h_blank,
					 h_blank, 1, h_blank);
		vblank_def = mode->vts_def - mode->height;
		__v4l2_ctrl_modify_range(sc431hai->vblank, vblank_def,
					 SC431HAI_VTS_MAX - mode->height,
					 1, vblank_def);
		sc431hai->cur_fps = mode->max_fps;
		sc431hai->cur_vts = mode->vts_def;
	}

	mutex_unlock(&sc431hai->mutex);

	return 0;
}

static int sc431hai_get_fmt(struct v4l2_subdev *sd,
			   struct v4l2_subdev_pad_config *cfg,
			   struct v4l2_subdev_format *fmt)
{
	struct sc431hai *sc431hai = to_sc431hai(sd);
	const struct sc431hai_mode *mode = sc431hai->cur_mode;

	mutex_lock(&sc431hai->mutex);
	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
		fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
#else
		mutex_unlock(&sc431hai->mutex);
		return -ENOTTY;
#endif
	} else {
		fmt->format.width = mode->width;
		fmt->format.height = mode->height;
		fmt->format.code = mode->bus_fmt;
		fmt->format.field = V4L2_FIELD_NONE;
		/* format info: width/height/data type/virctual channel */
		if (fmt->pad < PAD_MAX && mode->hdr_mode != NO_HDR)
			fmt->reserved[0] = mode->vc[fmt->pad];
		else
			fmt->reserved[0] = mode->vc[PAD0];
	}
	mutex_unlock(&sc431hai->mutex);

	return 0;
}

static int sc431hai_enum_mbus_code(struct v4l2_subdev *sd,
				  struct v4l2_subdev_pad_config *cfg,
				  struct v4l2_subdev_mbus_code_enum *code)
{
	struct sc431hai *sc431hai = to_sc431hai(sd);

	if (code->index != 0)
		return -EINVAL;
	code->code = sc431hai->cur_mode->bus_fmt;

	return 0;
}

static int sc431hai_enum_frame_sizes(struct v4l2_subdev *sd,
				    struct v4l2_subdev_pad_config *cfg,
				    struct v4l2_subdev_frame_size_enum *fse)
{
	if (fse->index >= ARRAY_SIZE(supported_modes))
		return -EINVAL;

	if (fse->code != supported_modes[1].bus_fmt)
		return -EINVAL;

	fse->min_width  = supported_modes[fse->index].width;
	fse->max_width  = supported_modes[fse->index].width;
	fse->max_height = supported_modes[fse->index].height;
	fse->min_height = supported_modes[fse->index].height;

	return 0;
}

static int sc431hai_enable_test_pattern(struct sc431hai *sc431hai, u32 pattern)
{
	u32 val = 0;
	int ret = 0;

	ret = sc431hai_read_reg(sc431hai->client, SC431HAI_REG_TEST_PATTERN,
			       SC431HAI_REG_VALUE_08BIT, &val);
	if (pattern)
		val |= SC431HAI_TEST_PATTERN_BIT_MASK;
	else
		val &= ~SC431HAI_TEST_PATTERN_BIT_MASK;
	ret |= sc431hai_write_reg(sc431hai->client, SC431HAI_REG_TEST_PATTERN,
				 SC431HAI_REG_VALUE_08BIT, val);
	return ret;
}

static int sc431hai_g_frame_interval(struct v4l2_subdev *sd,
				    struct v4l2_subdev_frame_interval *fi)
{
	struct sc431hai *sc431hai = to_sc431hai(sd);
	const struct sc431hai_mode *mode = sc431hai->cur_mode;

	if (sc431hai->streaming)
		fi->interval = sc431hai->cur_fps;
	else
		fi->interval = mode->max_fps;

	return 0;
}

static int sc431hai_g_mbus_config(struct v4l2_subdev *sd,
				unsigned int pad_id,
				struct v4l2_mbus_config *config)
{
	struct sc431hai *sc431hai = to_sc431hai(sd);
	const struct sc431hai_mode *mode = sc431hai->cur_mode;
	u32 val = 0;

	val = 1 << (sc431hai->lane_num - 1) |
		V4L2_MBUS_CSI2_CHANNEL_0 |
		V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;

	if (mode->hdr_mode != NO_HDR)
		val |= V4L2_MBUS_CSI2_CHANNEL_1;
	if (mode->hdr_mode == HDR_X3)
		val |= V4L2_MBUS_CSI2_CHANNEL_2;

	config->type = V4L2_MBUS_CSI2_DPHY;
	config->flags = val;

	return 0;
}

static void sc431hai_get_module_inf(struct sc431hai *sc431hai,
				   struct rkmodule_inf *inf)
{
	memset(inf, 0, sizeof(*inf));
	strscpy(inf->base.sensor, SC431HAI_NAME, sizeof(inf->base.sensor));
	strscpy(inf->base.module, sc431hai->module_name,
		sizeof(inf->base.module));
	strscpy(inf->base.lens, sc431hai->len_name, sizeof(inf->base.lens));
}

static long sc431hai_ioctl(struct v4l2_subdev *sd, unsigned int cmd, void *arg)
{
	struct sc431hai *sc431hai = to_sc431hai(sd);
	struct rkmodule_hdr_cfg *hdr;
	long ret = 0;
	u32 stream = 0;

	switch (cmd) {
	case RKMODULE_GET_MODULE_INFO:
		sc431hai_get_module_inf(sc431hai, (struct rkmodule_inf *)arg);
		break;
	case RKMODULE_GET_HDR_CFG:
		hdr = (struct rkmodule_hdr_cfg *)arg;
		hdr->esp.mode = HDR_NORMAL_VC;
		hdr->hdr_mode = sc431hai->cur_mode->hdr_mode;
		break;
	case RKMODULE_SET_HDR_CFG:
		hdr = (struct rkmodule_hdr_cfg *)arg;
		if (hdr->hdr_mode != 0)
			ret = -1;
		break;
	case PREISP_CMD_SET_HDRAE_EXP:
		break;
	case RKMODULE_SET_QUICK_STREAM:

		stream = *((u32 *)arg);

		if (stream)
			ret = sc431hai_write_reg(sc431hai->client,
						SC431HAI_REG_CTRL_MODE,
						SC431HAI_REG_VALUE_08BIT,
						SC431HAI_MODE_STREAMING);
		else
			ret = sc431hai_write_reg(sc431hai->client,
						SC431HAI_REG_CTRL_MODE,
						SC431HAI_REG_VALUE_08BIT,
						SC431HAI_MODE_SW_STANDBY);
		break;
	default:
		ret = -ENOIOCTLCMD;
		break;
	}

	return ret;
}

#ifdef CONFIG_COMPAT
static long sc431hai_compat_ioctl32(struct v4l2_subdev *sd,
				   unsigned int cmd, unsigned long arg)
{
	void __user *up = compat_ptr(arg);
	struct rkmodule_inf *inf;
	struct rkmodule_awb_cfg *cfg;
	struct rkmodule_hdr_cfg *hdr;
	struct preisp_hdrae_exp_s *hdrae;
	long ret = 0;
	u32 stream = 0;

	switch (cmd) {
	case RKMODULE_GET_MODULE_INFO:
		inf = kzalloc(sizeof(*inf), GFP_KERNEL);
		if (!inf) {
			ret = -ENOMEM;
			return ret;
		}

		ret = sc431hai_ioctl(sd, cmd, inf);
		if (!ret) {
			ret = copy_to_user(up, inf, sizeof(*inf));
			if (ret)
				ret = -EFAULT;
		}
		kfree(inf);
		break;
	case RKMODULE_AWB_CFG:
		cfg = kzalloc(sizeof(*cfg), GFP_KERNEL);
		if (!cfg) {
			ret = -ENOMEM;
			return ret;
		}

		if (copy_from_user(cfg, up, sizeof(*cfg))) {
			kfree(cfg);
			return -EFAULT;
		}

		sc431hai_ioctl(sd, cmd, cfg);
		kfree(cfg);
		break;
	case RKMODULE_GET_HDR_CFG:
		hdr = kzalloc(sizeof(*hdr), GFP_KERNEL);
		if (!hdr) {
			ret = -ENOMEM;
			return ret;
		}

		ret = sc431hai_ioctl(sd, cmd, hdr);
		if (!ret) {
			ret = copy_to_user(up, hdr, sizeof(*hdr));
			if (ret)
				ret = -EFAULT;
		}
		kfree(hdr);
		break;
	case RKMODULE_SET_HDR_CFG:
		hdr = kzalloc(sizeof(*hdr), GFP_KERNEL);
		if (!hdr) {
			ret = -ENOMEM;
			return ret;
		}

		if (copy_from_user(hdr, up, sizeof(*hdr))) {
			kfree(hdr);
			return -EFAULT;
		}

		sc431hai_ioctl(sd, cmd, hdr);
		kfree(hdr);
		break;
	case PREISP_CMD_SET_HDRAE_EXP:
		hdrae = kzalloc(sizeof(*hdrae), GFP_KERNEL);
		if (!hdrae) {
			ret = -ENOMEM;
			return ret;
		}

		if (copy_from_user(hdrae, up, sizeof(*hdrae))) {
			kfree(hdrae);
			return -EFAULT;
		}

		sc431hai_ioctl(sd, cmd, hdrae);
		kfree(hdrae);
		break;
	case RKMODULE_SET_QUICK_STREAM:
		if (copy_from_user(&stream, up, sizeof(u32)))
			return -EFAULT;

		sc431hai_ioctl(sd, cmd, &stream);
		break;
	default:
		ret = -ENOIOCTLCMD;
		break;
	}

	return ret;
}
#endif

static int __sc431hai_start_stream(struct sc431hai *sc431hai)
{
	int ret;

	if (!sc431hai->is_thunderboot) {
		ret = sc431hai_write_array(sc431hai->client, sc431hai->cur_mode->reg_list);
		if (ret)
			return ret;

		/* In case these controls are set before streaming */
		ret = __v4l2_ctrl_handler_setup(&sc431hai->ctrl_handler);
		if (ret)
			return ret;
	}

	return sc431hai_write_reg(sc431hai->client,
				SC431HAI_REG_CTRL_MODE,
				SC431HAI_REG_VALUE_08BIT,
				SC431HAI_MODE_STREAMING);

}

static int __sc431hai_stop_stream(struct sc431hai *sc431hai)
{
	if (sc431hai->is_thunderboot) {
		sc431hai->is_first_streamoff = true;
		pm_runtime_put(&sc431hai->client->dev);
	}

	return sc431hai_write_reg(sc431hai->client,
				 SC431HAI_REG_CTRL_MODE,
				 SC431HAI_REG_VALUE_08BIT,
				 SC431HAI_MODE_SW_STANDBY);
}

static int sc431hai_s_stream(struct v4l2_subdev *sd, int on)
{
	struct sc431hai *sc431hai = to_sc431hai(sd);
	struct i2c_client *client = sc431hai->client;
	int ret = 0;

	mutex_lock(&sc431hai->mutex);
	on = !!on;
	if (on == sc431hai->streaming)
		goto unlock_and_return;

	if (on) {
		if (sc431hai->is_thunderboot && rkisp_tb_get_state() == RKISP_TB_NG) {
			sc431hai->is_thunderboot = false;
			__sc431hai_power_on(sc431hai);
		}
		ret = pm_runtime_get_sync(&client->dev);
		if (ret < 0) {
			pm_runtime_put_noidle(&client->dev);
			goto unlock_and_return;
		}

		ret = __sc431hai_start_stream(sc431hai);
		if (ret) {
			v4l2_err(sd, "start stream failed while write regs\n");
			pm_runtime_put(&client->dev);
			goto unlock_and_return;
		}
	} else {
		__sc431hai_stop_stream(sc431hai);
		pm_runtime_put(&client->dev);
	}

	sc431hai->streaming = on;

unlock_and_return:
	mutex_unlock(&sc431hai->mutex);

	return ret;
}

static int sc431hai_s_power(struct v4l2_subdev *sd, int on)
{
	struct sc431hai *sc431hai = to_sc431hai(sd);
	struct i2c_client *client = sc431hai->client;
	int ret = 0;

	mutex_lock(&sc431hai->mutex);

	/* If the power state is not modified - no work to do. */
	if (sc431hai->power_on == !!on)
		goto unlock_and_return;

	if (on) {
		ret = pm_runtime_get_sync(&client->dev);
		if (ret < 0) {
			pm_runtime_put_noidle(&client->dev);
			goto unlock_and_return;
		}

		ret = sc431hai_write_array(sc431hai->client, sc431hai_global_regs);
		if (ret) {
			v4l2_err(sd, "could not set init registers\n");
			pm_runtime_put_noidle(&client->dev);
			goto unlock_and_return;
		}

		sc431hai->power_on = true;
	} else {
		pm_runtime_put(&client->dev);
		sc431hai->power_on = false;
	}

unlock_and_return:
	mutex_unlock(&sc431hai->mutex);

	return ret;
}

/* Calculate the delay in us by clock rate and clock cycles */
static inline u32 sc431hai_cal_delay(u32 cycles)
{
	return DIV_ROUND_UP(cycles, SC431HAI_XVCLK_FREQ / 1000 / 1000);
}

static int __sc431hai_power_on(struct sc431hai *sc431hai)
{
	int ret;
	u32 delay_us;
	struct device *dev = &sc431hai->client->dev;

	if (!IS_ERR_OR_NULL(sc431hai->pins_default)) {
		ret = pinctrl_select_state(sc431hai->pinctrl,
					   sc431hai->pins_default);
		if (ret < 0)
			dev_err(dev, "could not set pins\n");
	}
	ret = clk_set_rate(sc431hai->xvclk, SC431HAI_XVCLK_FREQ);
	if (ret < 0)
		dev_warn(dev, "Failed to set xvclk rate (24MHz)\n");
	if (clk_get_rate(sc431hai->xvclk) != SC431HAI_XVCLK_FREQ)
		dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
	ret = clk_prepare_enable(sc431hai->xvclk);
	if (ret < 0) {
		dev_err(dev, "Failed to enable xvclk\n");
		return ret;
	}

	if (sc431hai->is_thunderboot)
		return 0;

	if (!IS_ERR(sc431hai->reset_gpio))
		gpiod_set_value_cansleep(sc431hai->reset_gpio, 0);

	ret = regulator_bulk_enable(SC431HAI_NUM_SUPPLIES, sc431hai->supplies);
	if (ret < 0) {
		dev_err(dev, "Failed to enable regulators\n");
		goto disable_clk;
	}

	if (!IS_ERR(sc431hai->reset_gpio))
		gpiod_set_value_cansleep(sc431hai->reset_gpio, 1);

	usleep_range(500, 1000);
	if (!IS_ERR(sc431hai->pwdn_gpio))
		gpiod_set_value_cansleep(sc431hai->pwdn_gpio, 1);

	if (!IS_ERR(sc431hai->reset_gpio))
		usleep_range(6000, 8000);
	else
		usleep_range(12000, 16000);

	/* 8192 cycles prior to first SCCB transaction */
	delay_us = sc431hai_cal_delay(8192);
	usleep_range(delay_us, delay_us * 2);

	return 0;

disable_clk:
	clk_disable_unprepare(sc431hai->xvclk);

	return ret;
}

static void __sc431hai_power_off(struct sc431hai *sc431hai)
{
	int ret;
	struct device *dev = &sc431hai->client->dev;

	if (sc431hai->is_thunderboot) {
		if (sc431hai->is_first_streamoff) {
			sc431hai->is_thunderboot = false;
			sc431hai->is_first_streamoff = false;
		} else {
			return;
		}
	}

	if (!IS_ERR(sc431hai->pwdn_gpio))
		gpiod_set_value_cansleep(sc431hai->pwdn_gpio, 0);
	clk_disable_unprepare(sc431hai->xvclk);
	if (!IS_ERR(sc431hai->reset_gpio))
		gpiod_set_value_cansleep(sc431hai->reset_gpio, 0);
	if (!IS_ERR_OR_NULL(sc431hai->pins_sleep)) {
		ret = pinctrl_select_state(sc431hai->pinctrl,
					   sc431hai->pins_sleep);
		if (ret < 0)
			dev_dbg(dev, "could not set pins\n");
	}
	regulator_bulk_disable(SC431HAI_NUM_SUPPLIES, sc431hai->supplies);
}

static int sc431hai_runtime_resume(struct device *dev)
{
	struct i2c_client *client = to_i2c_client(dev);
	struct v4l2_subdev *sd = i2c_get_clientdata(client);
	struct sc431hai *sc431hai = to_sc431hai(sd);

	return __sc431hai_power_on(sc431hai);
}

static int sc431hai_runtime_suspend(struct device *dev)
{
	struct i2c_client *client = to_i2c_client(dev);
	struct v4l2_subdev *sd = i2c_get_clientdata(client);
	struct sc431hai *sc431hai = to_sc431hai(sd);

	__sc431hai_power_off(sc431hai);

	return 0;
}

#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
static int sc431hai_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
{
	struct sc431hai *sc431hai = to_sc431hai(sd);
	struct v4l2_mbus_framefmt *try_fmt =
				v4l2_subdev_get_try_format(sd, fh->pad, 0);
	const struct sc431hai_mode *def_mode = &supported_modes[0];

	mutex_lock(&sc431hai->mutex);
	/* Initialize try_fmt */
	try_fmt->width = def_mode->width;
	try_fmt->height = def_mode->height;
	try_fmt->code = def_mode->bus_fmt;
	try_fmt->field = V4L2_FIELD_NONE;

	mutex_unlock(&sc431hai->mutex);
	/* No crop or compose */

	return 0;
}
#endif

static int sc431hai_enum_frame_interval(struct v4l2_subdev *sd,
				       struct v4l2_subdev_pad_config *cfg,
				       struct v4l2_subdev_frame_interval_enum *fie)
{
	if (fie->index >= ARRAY_SIZE(supported_modes))
		return -EINVAL;

	fie->code = supported_modes[fie->index].bus_fmt;
	fie->width = supported_modes[fie->index].width;
	fie->height = supported_modes[fie->index].height;
	fie->interval = supported_modes[fie->index].max_fps;
	fie->reserved[0] = supported_modes[fie->index].hdr_mode;
	return 0;
}

static const struct dev_pm_ops sc431hai_pm_ops = {
	SET_RUNTIME_PM_OPS(sc431hai_runtime_suspend,
			   sc431hai_runtime_resume, NULL)
};

#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
static const struct v4l2_subdev_internal_ops sc431hai_internal_ops = {
	.open = sc431hai_open,
};
#endif

static const struct v4l2_subdev_core_ops sc431hai_core_ops = {
	.s_power = sc431hai_s_power,
	.ioctl = sc431hai_ioctl,
#ifdef CONFIG_COMPAT
	.compat_ioctl32 = sc431hai_compat_ioctl32,
#endif
};

static const struct v4l2_subdev_video_ops sc431hai_video_ops = {
	.s_stream = sc431hai_s_stream,
	.g_frame_interval = sc431hai_g_frame_interval,
};

static const struct v4l2_subdev_pad_ops sc431hai_pad_ops = {
	.enum_mbus_code = sc431hai_enum_mbus_code,
	.enum_frame_size = sc431hai_enum_frame_sizes,
	.enum_frame_interval = sc431hai_enum_frame_interval,
	.get_fmt = sc431hai_get_fmt,
	.set_fmt = sc431hai_set_fmt,
	.get_mbus_config = sc431hai_g_mbus_config,
};

static const struct v4l2_subdev_ops sc431hai_subdev_ops = {
	.core	= &sc431hai_core_ops,
	.video	= &sc431hai_video_ops,
	.pad	= &sc431hai_pad_ops,
};

static void sc431hai_modify_fps_info(struct sc431hai *sc431hai)
{
	const struct sc431hai_mode *mode = sc431hai->cur_mode;

	sc431hai->cur_fps.denominator = mode->max_fps.denominator * mode->vts_def /
				       sc431hai->cur_vts;
}

static int sc431hai_set_ctrl(struct v4l2_ctrl *ctrl)
{
	struct sc431hai *sc431hai = container_of(ctrl->handler,
					       struct sc431hai, ctrl_handler);
	struct i2c_client *client = sc431hai->client;
	s64 max;
	int ret = 0;
	u32 val = 0;

	/* Propagate change of current control to all related controls */
	switch (ctrl->id) {
	case V4L2_CID_VBLANK:
		/* Update max exposure while meeting expected vblanking */
		max = sc431hai->cur_mode->height + ctrl->val - 6;
		__v4l2_ctrl_modify_range(sc431hai->exposure,
					 sc431hai->exposure->minimum, max,
					 sc431hai->exposure->step,
					 sc431hai->exposure->default_value);
		break;
	}

	if (!pm_runtime_get_if_in_use(&client->dev))
		return 0;

	switch (ctrl->id) {
	case V4L2_CID_EXPOSURE:
		if (sc431hai->cur_mode->hdr_mode == NO_HDR) {
			val = ctrl->val << 1;
			/* 4 least significant bits of expsoure are fractional part */
			ret = sc431hai_write_reg(sc431hai->client,
						SC431HAI_REG_EXPOSURE_H,
						SC431HAI_REG_VALUE_08BIT,
						SC431HAI_FETCH_EXP_H(val));
			ret |= sc431hai_write_reg(sc431hai->client,
						 SC431HAI_REG_EXPOSURE_M,
						 SC431HAI_REG_VALUE_08BIT,
						 SC431HAI_FETCH_EXP_M(val));
			ret |= sc431hai_write_reg(sc431hai->client,
						 SC431HAI_REG_EXPOSURE_L,
						 SC431HAI_REG_VALUE_08BIT,
						 SC431HAI_FETCH_EXP_L(val));
		}
		break;
	case V4L2_CID_ANALOGUE_GAIN:
		if (sc431hai->cur_mode->hdr_mode == NO_HDR)
			ret = sc431hai_set_gain_reg(sc431hai, ctrl->val);
		break;
	case V4L2_CID_VBLANK:
		ret = sc431hai_write_reg(sc431hai->client,
					SC431HAI_REG_VTS_H,
					SC431HAI_REG_VALUE_08BIT,
					(ctrl->val + sc431hai->cur_mode->height)
					>> 8);
		ret |= sc431hai_write_reg(sc431hai->client,
					 SC431HAI_REG_VTS_L,
					 SC431HAI_REG_VALUE_08BIT,
					 (ctrl->val + sc431hai->cur_mode->height)
					 & 0xff);
		if (!ret)
			sc431hai->cur_vts = ctrl->val + sc431hai->cur_mode->height;
		sc431hai_modify_fps_info(sc431hai);
		break;
	case V4L2_CID_TEST_PATTERN:
		ret = sc431hai_enable_test_pattern(sc431hai, ctrl->val);
		break;
	case V4L2_CID_HFLIP:
		ret = sc431hai_read_reg(sc431hai->client, SC431HAI_FLIP_MIRROR_REG,
				       SC431HAI_REG_VALUE_08BIT, &val);
		ret |= sc431hai_write_reg(sc431hai->client,
					 SC431HAI_FLIP_MIRROR_REG,
					 SC431HAI_REG_VALUE_08BIT,
					 SC431HAI_FETCH_MIRROR(val, ctrl->val));
		break;
	case V4L2_CID_VFLIP:
		ret = sc431hai_read_reg(sc431hai->client, SC431HAI_FLIP_MIRROR_REG,
				       SC431HAI_REG_VALUE_08BIT, &val);
		ret |= sc431hai_write_reg(sc431hai->client,
					 SC431HAI_FLIP_MIRROR_REG,
					 SC431HAI_REG_VALUE_08BIT,
					 SC431HAI_FETCH_FLIP(val, ctrl->val));
		break;
	default:
		dev_warn(&client->dev, "%s Unhandled id:0x%x, val:0x%x\n",
			 __func__, ctrl->id, ctrl->val);
		break;
	}

	pm_runtime_put(&client->dev);

	return ret;
}

static const struct v4l2_ctrl_ops sc431hai_ctrl_ops = {
	.s_ctrl = sc431hai_set_ctrl,
};

static int sc431hai_parse_of(struct sc431hai *sc431hai)
{
	struct device *dev = &sc431hai->client->dev;
	struct device_node *endpoint;
	struct fwnode_handle *fwnode;
	int rval;

	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
	if (!endpoint) {
		dev_err(dev, "Failed to get endpoint\n");
		return -EINVAL;
	}
	fwnode = of_fwnode_handle(endpoint);
	rval = fwnode_property_read_u32_array(fwnode, "data-lanes", NULL, 0);
	if (rval <= 0) {
		dev_warn(dev, " Get mipi lane num failed!\n");
		return -1;
	}

	sc431hai->lane_num = rval;

	if (sc431hai->lane_num == 2) {
		sc431hai->cur_mode = &supported_modes[1];
		dev_info(dev, "lane_num(%d)\n", sc431hai->lane_num);
	} else if (sc431hai->lane_num == 4) {
		sc431hai->cur_mode = &supported_modes[0];
		dev_info(dev, "lane_num(%d)\n", sc431hai->lane_num);
	} else {
		dev_err(dev, "unsupported lane_num(%d)\n", sc431hai->lane_num);
		return -1;
	}
	return 0;
}

static int sc431hai_initialize_controls(struct sc431hai *sc431hai)
{
	const struct sc431hai_mode *mode;
	struct v4l2_ctrl_handler *handler;
	struct device *dev = &sc431hai->client->dev;

	s64 exposure_max, vblank_def;
	u32 h_blank;
	int ret;
	int dst_pixel_rate = 0;

	handler = &sc431hai->ctrl_handler;
	mode = sc431hai->cur_mode;
	ret = v4l2_ctrl_handler_init(handler, 9);
	if (ret)
		return ret;
	handler->lock = &sc431hai->mutex;

	sc431hai->link_freq = v4l2_ctrl_new_int_menu(handler, NULL,
				V4L2_CID_LINK_FREQ,
				ARRAY_SIZE(link_freq_menu_items) - 1, 0,
				link_freq_menu_items);
	__v4l2_ctrl_s_ctrl(sc431hai->link_freq, mode->mipi_freq_idx);

	if (ret < 0)
		dev_err(dev, "get data num failed");

	if (mode->mipi_freq_idx == 0)
		dst_pixel_rate = PIXEL_RATE_WITH_315M_10BIT;
	else if (mode->mipi_freq_idx == 1)
		dst_pixel_rate = PIXEL_RATE_WITH_630M_10BIT;

	sc431hai->pixel_rate = v4l2_ctrl_new_std(handler, NULL,
						V4L2_CID_PIXEL_RATE, 0,
						PIXEL_RATE_WITH_MAX,
						1, dst_pixel_rate);

	h_blank = mode->hts_def - mode->width;
	sc431hai->hblank = v4l2_ctrl_new_std(handler, NULL, V4L2_CID_HBLANK,
					    h_blank, h_blank, 1, h_blank);
	if (sc431hai->hblank)
		sc431hai->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
	vblank_def = mode->vts_def - mode->height;
	sc431hai->vblank = v4l2_ctrl_new_std(handler, &sc431hai_ctrl_ops,
					    V4L2_CID_VBLANK, vblank_def,
					    SC431HAI_VTS_MAX - mode->height,
					    1, vblank_def);
	exposure_max = mode->vts_def - 6;
	sc431hai->exposure = v4l2_ctrl_new_std(handler, &sc431hai_ctrl_ops,
					      V4L2_CID_EXPOSURE,
					      SC431HAI_EXPOSURE_MIN,
					      exposure_max,
					      SC431HAI_EXPOSURE_STEP,
					      mode->exp_def);
	sc431hai->anal_gain = v4l2_ctrl_new_std(handler, &sc431hai_ctrl_ops,
					       V4L2_CID_ANALOGUE_GAIN,
					       SC431HAI_GAIN_MIN,
					       SC431HAI_GAIN_MAX,
					       SC431HAI_GAIN_STEP,
					       SC431HAI_GAIN_DEFAULT);
	v4l2_ctrl_new_std(handler, &sc431hai_ctrl_ops,
			  V4L2_CID_HFLIP, 0, 1, 1, 0);
	v4l2_ctrl_new_std(handler, &sc431hai_ctrl_ops,
			  V4L2_CID_VFLIP, 0, 1, 1, 0);
	if (handler->error) {
		ret = handler->error;
		dev_err(&sc431hai->client->dev,
			"Failed to init controls(%d)\n", ret);
		goto err_free_handler;
	}

	sc431hai->subdev.ctrl_handler = handler;
	sc431hai->cur_fps = mode->max_fps;
	sc431hai->cur_vts = mode->vts_def;

	return 0;

err_free_handler:
	v4l2_ctrl_handler_free(handler);

	return ret;
}

static int sc431hai_check_sensor_id(struct sc431hai *sc431hai,
				   struct i2c_client *client)
{
	struct device *dev = &sc431hai->client->dev;
	u32 id = 0;
	int ret;

	if (sc431hai->is_thunderboot) {
		dev_info(dev, "Enable thunderboot mode, skip sensor id check\n");
		return 0;
	}

	ret = sc431hai_read_reg(client, SC431HAI_REG_CHIP_ID,
			       SC431HAI_REG_VALUE_16BIT, &id);
	if (id != CHIP_ID) {
		dev_err(dev, "Unexpected sensor id(%06x), ret(%d)\n", id, ret);
		return -ENODEV;
	}

	dev_info(dev, "Detected OV%06x sensor\n", CHIP_ID);

	return 0;
}

static int sc431hai_configure_regulators(struct sc431hai *sc431hai)
{
	unsigned int i;

	for (i = 0; i < SC431HAI_NUM_SUPPLIES; i++)
		sc431hai->supplies[i].supply = sc431hai_supply_names[i];

	return devm_regulator_bulk_get(&sc431hai->client->dev,
				       SC431HAI_NUM_SUPPLIES,
				       sc431hai->supplies);
}

static int sc431hai_probe(struct i2c_client *client,
			 const struct i2c_device_id *id)
{
	struct device *dev = &client->dev;
	struct device_node *node = dev->of_node;
	struct sc431hai *sc431hai;
	struct v4l2_subdev *sd;
	char facing[2];
	int ret;
	u32 i, hdr_mode = 0;

	dev_info(dev, "driver version: %02x.%02x.%02x",
		 DRIVER_VERSION >> 16,
		 (DRIVER_VERSION & 0xff00) >> 8,
		 DRIVER_VERSION & 0x00ff);

	sc431hai = devm_kzalloc(dev, sizeof(*sc431hai), GFP_KERNEL);
	if (!sc431hai)
		return -ENOMEM;

	of_property_read_u32(node, OF_CAMERA_HDR_MODE, &hdr_mode);
	ret = of_property_read_u32(node, RKMODULE_CAMERA_MODULE_INDEX,
				   &sc431hai->module_index);
	ret |= of_property_read_string(node, RKMODULE_CAMERA_MODULE_FACING,
				       &sc431hai->module_facing);
	ret |= of_property_read_string(node, RKMODULE_CAMERA_MODULE_NAME,
				       &sc431hai->module_name);
	ret |= of_property_read_string(node, RKMODULE_CAMERA_LENS_NAME,
				       &sc431hai->len_name);
	if (ret) {
		dev_err(dev, "could not get module information!\n");
		return -EINVAL;
	}

	sc431hai->is_thunderboot = IS_ENABLED(CONFIG_VIDEO_ROCKCHIP_THUNDER_BOOT_ISP);

	sc431hai->client = client;
	for (i = 0; i < ARRAY_SIZE(supported_modes); i++) {
		if (hdr_mode == supported_modes[i].hdr_mode) {
			sc431hai->cur_mode = &supported_modes[i];
			break;
		}
	}
	if (i == ARRAY_SIZE(supported_modes))
		sc431hai->cur_mode = &supported_modes[0];

	sc431hai->xvclk = devm_clk_get(dev, "xvclk");
	if (IS_ERR(sc431hai->xvclk)) {
		dev_err(dev, "Failed to get xvclk\n");
		return -EINVAL;
	}

	if (sc431hai->is_thunderboot) {
		sc431hai->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_ASIS);
		if (IS_ERR(sc431hai->reset_gpio))
			dev_warn(dev, "Failed to get reset-gpios\n");

		sc431hai->pwdn_gpio = devm_gpiod_get(dev, "pwdn", GPIOD_ASIS);
		if (IS_ERR(sc431hai->pwdn_gpio))
			dev_warn(dev, "Failed to get pwdn-gpios\n");
	} else {
		sc431hai->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
		if (IS_ERR(sc431hai->reset_gpio))
			dev_warn(dev, "Failed to get reset-gpios\n");

		sc431hai->pwdn_gpio = devm_gpiod_get(dev, "pwdn", GPIOD_OUT_LOW);
		if (IS_ERR(sc431hai->pwdn_gpio))
			dev_warn(dev, "Failed to get pwdn-gpios\n");
	}

	sc431hai->pinctrl = devm_pinctrl_get(dev);
	if (!IS_ERR(sc431hai->pinctrl)) {
		sc431hai->pins_default =
			pinctrl_lookup_state(sc431hai->pinctrl,
					     OF_CAMERA_PINCTRL_STATE_DEFAULT);
		if (IS_ERR(sc431hai->pins_default))
			dev_err(dev, "could not get default pinstate\n");

		sc431hai->pins_sleep =
			pinctrl_lookup_state(sc431hai->pinctrl,
					     OF_CAMERA_PINCTRL_STATE_SLEEP);
		if (IS_ERR(sc431hai->pins_sleep))
			dev_err(dev, "could not get sleep pinstate\n");
	} else {
		dev_err(dev, "no pinctrl\n");
	}

	ret = sc431hai_configure_regulators(sc431hai);
	if (ret) {
		dev_err(dev, "Failed to get power regulators\n");
		return ret;
	}

	ret = sc431hai_parse_of(sc431hai);
	if (ret != 0)
		return -EINVAL;

	mutex_init(&sc431hai->mutex);

	sd = &sc431hai->subdev;
	v4l2_i2c_subdev_init(sd, client, &sc431hai_subdev_ops);
	ret = sc431hai_initialize_controls(sc431hai);
	if (ret)
		goto err_destroy_mutex;

	ret = __sc431hai_power_on(sc431hai);
	if (ret)
		goto err_free_handler;

	ret = sc431hai_check_sensor_id(sc431hai, client);
	if (ret)
		goto err_power_off;

#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
	sd->internal_ops = &sc431hai_internal_ops;
	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
		     V4L2_SUBDEV_FL_HAS_EVENTS;
#endif
#if defined(CONFIG_MEDIA_CONTROLLER)
	sc431hai->pad.flags = MEDIA_PAD_FL_SOURCE;
	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
	ret = media_entity_pads_init(&sd->entity, 1, &sc431hai->pad);
	if (ret < 0)
		goto err_power_off;
#endif

	memset(facing, 0, sizeof(facing));
	if (strcmp(sc431hai->module_facing, "back") == 0)
		facing[0] = 'b';
	else
		facing[0] = 'f';

	snprintf(sd->name, sizeof(sd->name), "m%02d_%s_%s %s",
		 sc431hai->module_index, facing,
		 SC431HAI_NAME, dev_name(sd->dev));
	ret = v4l2_async_register_subdev_sensor_common(sd);
	if (ret) {
		dev_err(dev, "v4l2 async register subdev failed\n");
		goto err_clean_entity;
	}

	pm_runtime_set_active(dev);
	pm_runtime_enable(dev);
	if (sc431hai->is_thunderboot)
		pm_runtime_get_sync(dev);
	else
		pm_runtime_idle(dev);

	return 0;

err_clean_entity:
#if defined(CONFIG_MEDIA_CONTROLLER)
	media_entity_cleanup(&sd->entity);
#endif
err_power_off:
	__sc431hai_power_off(sc431hai);
err_free_handler:
	v4l2_ctrl_handler_free(&sc431hai->ctrl_handler);
err_destroy_mutex:
	mutex_destroy(&sc431hai->mutex);

	return ret;
}

static int sc431hai_remove(struct i2c_client *client)
{
	struct v4l2_subdev *sd = i2c_get_clientdata(client);
	struct sc431hai *sc431hai = to_sc431hai(sd);

	v4l2_async_unregister_subdev(sd);
#if defined(CONFIG_MEDIA_CONTROLLER)
	media_entity_cleanup(&sd->entity);
#endif
	v4l2_ctrl_handler_free(&sc431hai->ctrl_handler);
	mutex_destroy(&sc431hai->mutex);

	pm_runtime_disable(&client->dev);
	if (!pm_runtime_status_suspended(&client->dev))
		__sc431hai_power_off(sc431hai);
	pm_runtime_set_suspended(&client->dev);

	return 0;
}

#if IS_ENABLED(CONFIG_OF)
static const struct of_device_id sc431hai_of_match[] = {
	{ .compatible = "smartsens,sc431hai" },
	{},
};
MODULE_DEVICE_TABLE(of, sc431hai_of_match);
#endif

static const struct i2c_device_id sc431hai_match_id[] = {
	{ "smartsens,sc431hai", 0 },
	{ },
};

static struct i2c_driver sc431hai_i2c_driver = {
	.driver = {
		.name = SC431HAI_NAME,
		.pm = &sc431hai_pm_ops,
		.of_match_table = of_match_ptr(sc431hai_of_match),
	},
	.probe		= &sc431hai_probe,
	.remove		= &sc431hai_remove,
	.id_table	= sc431hai_match_id,
};

static int __init sensor_mod_init(void)
{
	return i2c_add_driver(&sc431hai_i2c_driver);
}

static void __exit sensor_mod_exit(void)
{
	i2c_del_driver(&sc431hai_i2c_driver);
}

#if defined(CONFIG_VIDEO_ROCKCHIP_THUNDER_BOOT_ISP) && !defined(CONFIG_INITCALL_ASYNC)
subsys_initcall(sensor_mod_init);
#else
device_initcall_sync(sensor_mod_init);
#endif

module_exit(sensor_mod_exit);

MODULE_DESCRIPTION("smartsens sc431hai sensor driver");
MODULE_LICENSE("GPL");
