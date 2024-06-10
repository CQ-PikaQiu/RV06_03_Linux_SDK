#!/bin/sh

# default NO, set YES to enable cdc
# set kernel's defconfig CONFIG_USB_CONFIGFS_ACM=y to enable cdc
CDC_ENABLE=NO

USB_FUNCTIONS_DIR=/sys/kernel/config/usb_gadget/rockchip/functions
USB_CONFIGS_DIR=/sys/kernel/config/usb_gadget/rockchip/configs/b.1

configure_uvc_resolution_mjpeg()
{
    UVC_DISPLAY_W=$1
    UVC_DISPLAY_H=$2
    UVC_DISPLAY_DIR=${USB_FUNCTIONS_DIR}/$UVC_GS/streaming/mjpeg/m/${UVC_DISPLAY_W}_${UVC_DISPLAY_H}p
    mkdir ${UVC_DISPLAY_DIR}
    echo $UVC_DISPLAY_W > ${UVC_DISPLAY_DIR}/wWidth
    echo $UVC_DISPLAY_H > ${UVC_DISPLAY_DIR}/wHeight
    echo 333333 > ${UVC_DISPLAY_DIR}/dwDefaultFrameInterval
    echo $((UVC_DISPLAY_W*UVC_DISPLAY_H*20)) > ${UVC_DISPLAY_DIR}/dwMinBitRate
    echo $((UVC_DISPLAY_W*UVC_DISPLAY_H*20)) > ${UVC_DISPLAY_DIR}/dwMaxBitRate
    echo $((UVC_DISPLAY_W*UVC_DISPLAY_H*2)) > ${UVC_DISPLAY_DIR}/dwMaxVideoFrameBufferSize
    echo -e "333333\n666666\n1000000\n2000000" > ${UVC_DISPLAY_DIR}/dwFrameInterval
}

configure_uvc_resolution_h264()
{
	UVC_DISPLAY_W=$1
	UVC_DISPLAY_H=$2
	UVC_DISPLAY_DIR=${USB_FUNCTIONS_DIR}/$UVC_GS/streaming/framebased/f1/${UVC_DISPLAY_W}_${UVC_DISPLAY_H}p
	mkdir ${UVC_DISPLAY_DIR}
	echo $UVC_DISPLAY_W > ${UVC_DISPLAY_DIR}/wWidth
	echo $UVC_DISPLAY_H > ${UVC_DISPLAY_DIR}/wHeight
	echo 333333 > ${UVC_DISPLAY_DIR}/dwDefaultFrameInterval
	echo $((UVC_DISPLAY_W*UVC_DISPLAY_H*10)) > ${UVC_DISPLAY_DIR}/dwMinBitRate
	echo $((UVC_DISPLAY_W*UVC_DISPLAY_H*10)) > ${UVC_DISPLAY_DIR}/dwMaxBitRate
	echo -e "333333\n400000\n500000\n666666\n1000000\n2000000" > ${UVC_DISPLAY_DIR}/dwFrameInterval
	echo -ne \\x48\\x32\\x36\\x34\\x00\\x00\\x10\\x00\\x80\\x00\\x00\\xaa\\x00\\x38\\x9b\\x71 > ${USB_FUNCTIONS_DIR}/$UVC_GS/streaming/framebased/f1/guidFormat
}

configure_uvc_resolution_h265()
{
	UVC_DISPLAY_W=$1
	UVC_DISPLAY_H=$2
	UVC_DISPLAY_DIR=${USB_FUNCTIONS_DIR}/$UVC_GS/streaming/framebased/f2/${UVC_DISPLAY_W}_${UVC_DISPLAY_H}p
	mkdir ${UVC_DISPLAY_DIR}
	echo $UVC_DISPLAY_W > ${UVC_DISPLAY_DIR}/wWidth
	echo $UVC_DISPLAY_H > ${UVC_DISPLAY_DIR}/wHeight
	echo 333333 > ${UVC_DISPLAY_DIR}/dwDefaultFrameInterval
	echo $((UVC_DISPLAY_W*UVC_DISPLAY_H*10)) > ${UVC_DISPLAY_DIR}/dwMinBitRate
	echo $((UVC_DISPLAY_W*UVC_DISPLAY_H*10)) > ${UVC_DISPLAY_DIR}/dwMaxBitRate
	echo -e "333333\n400000\n500000" > ${UVC_DISPLAY_DIR}/dwFrameInterval
	echo -ne \\x48\\x32\\x36\\x35\\x00\\x00\\x10\\x00\\x80\\x00\\x00\\xaa\\x00\\x38\\x9b\\x71 > ${USB_FUNCTIONS_DIR}/$UVC_GS/streaming/framebased/f2/guidFormat
}

uvc_device_config()
{
	UVC_GS=$1
	UVC_NAME=$2
	uvc_w=$3
	uvc_h=$4
	mkdir ${USB_FUNCTIONS_DIR}/$UVC_GS
	echo $UVC_NAME > ${USB_FUNCTIONS_DIR}/$UVC_GS/device_name
	echo 3072 > ${USB_FUNCTIONS_DIR}/$UVC_GS/streaming_maxpacket
	echo 2 > ${USB_FUNCTIONS_DIR}/$UVC_GS/uvc_num_request
	#echo 1 > /sys/kernel/config/usb_gadget/rockchip/functions/$UVC_GS/streaming_bulk

	mkdir ${USB_FUNCTIONS_DIR}/$UVC_GS/control/header/h
	ln -s ${USB_FUNCTIONS_DIR}/$UVC_GS/control/header/h ${USB_FUNCTIONS_DIR}/$UVC_GS/control/class/fs/h
	ln -s ${USB_FUNCTIONS_DIR}/$UVC_GS/control/header/h ${USB_FUNCTIONS_DIR}/$UVC_GS/control/class/ss/h

	## mjpeg support config
	mkdir ${USB_FUNCTIONS_DIR}/$UVC_GS/streaming/mjpeg/m
	configure_uvc_resolution_mjpeg $uvc_w $uvc_h

	## h.264 support config
	mkdir ${USB_FUNCTIONS_DIR}/$UVC_GS/streaming/framebased/f1
	configure_uvc_resolution_h264 $uvc_w $uvc_h

	## h.265 support config
	mkdir ${USB_FUNCTIONS_DIR}/$UVC_GS/streaming/framebased/f2
	configure_uvc_resolution_h265 $uvc_w $uvc_h

	mkdir /sys/kernel/config/usb_gadget/rockchip/functions/$UVC_GS/streaming/header/h
	ln -s ${USB_FUNCTIONS_DIR}/$UVC_GS/streaming/mjpeg/m ${USB_FUNCTIONS_DIR}/$UVC_GS/streaming/header/h/m
	ln -s ${USB_FUNCTIONS_DIR}/$UVC_GS/streaming/framebased/f1 ${USB_FUNCTIONS_DIR}/$UVC_GS/streaming/header/h/f1
	ln -s ${USB_FUNCTIONS_DIR}/$UVC_GS/streaming/framebased/f2 ${USB_FUNCTIONS_DIR}/$UVC_GS/streaming/header/h/f2
	ln -s ${USB_FUNCTIONS_DIR}/$UVC_GS/streaming/header/h ${USB_FUNCTIONS_DIR}/$UVC_GS/streaming/class/fs/h
	ln -s ${USB_FUNCTIONS_DIR}/$UVC_GS/streaming/header/h ${USB_FUNCTIONS_DIR}/$UVC_GS/streaming/class/hs/h
	ln -s ${USB_FUNCTIONS_DIR}/$UVC_GS/streaming/header/h ${USB_FUNCTIONS_DIR}/$UVC_GS/streaming/class/ss/h
}

cdc_device_config()
{
	mkdir  ${USB_FUNCTIONS_DIR}/acm.g0
	CONFIG_STR=`cat /sys/kernel/config/usb_gadget/rockchip/configs/b.1/strings/0x409/configuration`
	STR=${CONFIG_STR}_acm
	echo $STR > ${USB_CONFIGS_DIR}/strings/0x409/configuration
	USB_CNT=`echo $STR | awk -F"_" '{print NF-1}'`
	let USB_CNT=USB_CNT+2
	echo "acm on++++++ ${USB_CNT}"
	ln -s ${USB_FUNCTIONS_DIR}/acm.g0 ${USB_CONFIGS_DIR}/f${USB_CNT}
}

##main
UVC_W=1920
if expr "$1" + 0 2>/dev/null; then
	UVC_W=$1
fi
UVC_H=1080
if expr "$2" + 0 2>/dev/null; then
	UVC_H=$2
fi
#init usb config

insmod /oem/usr/ko/usb-common.ko
insmod /oem/usr/ko/usbcore.ko
insmod /oem/usr/ko/udc-core.ko
insmod /oem/usr/ko/libcomposite.ko
insmod /oem/usr/ko/usb_f_fs.ko
insmod /oem/usr/ko/usb_f_uvc.ko
if [ "$CDC_ENABLE" = "YES" ];then
	insmod /oem/usr/ko/u_serial.ko
	insmod /oem/usr/ko/usb_f_acm.ko
fi
insmod /oem/usr/ko/phy-rockchip-inno-usb2.ko
insmod /oem/usr/ko/dwc3-of-simple.ko
insmod /oem/usr/ko/dwc3.ko

mount -t configfs none /sys/kernel/config
mkdir -p /sys/kernel/config/usb_gadget/rockchip
mkdir -p /sys/kernel/config/usb_gadget/rockchip/strings/0x409
mkdir -p ${USB_CONFIGS_DIR}/strings/0x409
echo 0x2207 > /sys/kernel/config/usb_gadget/rockchip/idVendor
echo 0x0310 > /sys/kernel/config/usb_gadget/rockchip/bcdDevice
echo 0x0200 > /sys/kernel/config/usb_gadget/rockchip/bcdUSB
echo 239 > /sys/kernel/config/usb_gadget/rockchip/bDeviceClass
echo 2 > /sys/kernel/config/usb_gadget/rockchip/bDeviceSubClass
echo 1 > /sys/kernel/config/usb_gadget/rockchip/bDeviceProtocol
SERIAL_NUM=`cat /proc/cpuinfo |grep Serial | awk -F ":" '{print $2}'`
echo "serialnumber is $SERIAL_NUM"
echo $SERIAL_NUM > /sys/kernel/config/usb_gadget/rockchip/strings/0x409/serialnumber
echo "rockchip" > /sys/kernel/config/usb_gadget/rockchip/strings/0x409/manufacturer
echo "UVC" > /sys/kernel/config/usb_gadget/rockchip/strings/0x409/product
echo 0x1 > /sys/kernel/config/usb_gadget/rockchip/os_desc/b_vendor_code
echo "MSFT100" > /sys/kernel/config/usb_gadget/rockchip/os_desc/qw_sign
echo 500 > /sys/kernel/config/usb_gadget/rockchip/configs/b.1/MaxPower
#ln -s /sys/kernel/config/usb_gadget/rockchip/configs/b.1 /sys/kernel/config/usb_gadget/rockchip/os_desc/b.1
echo 0x0016 > /sys/kernel/config/usb_gadget/rockchip/idProduct

uvc_device_config uvc.gs1 "UVC main" $UVC_W $UVC_H

echo "uvc" > ${USB_CONFIGS_DIR}/strings/0x409/configuration
ln -s ${USB_FUNCTIONS_DIR}/uvc.gs1 ${USB_CONFIGS_DIR}/f2

if [ "$CDC_ENABLE" = "YES" ];then
	cdc_device_config
fi

UDC=`ls /sys/class/udc/| awk '{print $1}'`
echo $UDC > /sys/kernel/config/usb_gadget/rockchip/UDC
