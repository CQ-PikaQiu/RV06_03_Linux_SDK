#!/bin/bash
set -e

cwd=$(dirname $(readlink -f $0))
cd ${cwd}
CMD_VERSION="1.0.0"

function TEST_CASE()
{
	md5=$1
	shift
	$cwd/make_meta/make_meta_host --update --meta_path=$cwd/meta.img $@ &>/dev/null
	if md5sum $cwd/meta.img |grep -w $md5 &>/dev/null; then
		echo "TEST SUCCESS $@"
	else
		echo "TEST FAILURE $@"
	fi
	$cwd/make_meta/make_meta_host -r $cwd/meta.img &>/dev/null
}

$cwd/build_meta.sh -s sc230ai

TEST_CASE 89da98fbd1e183e68806421fbc6fb2c3 --rk_cam_hdr 5
TEST_CASE db9e8e753fc28324c4e217aff5e7dde9 --rk_cam_w 1234
TEST_CASE a7d5545f2b434fbf2c2033e46323dae2 --rk_cam_h 1234
TEST_CASE c76bf0fca782b3cb9aec94364af4f774 --rk_cam_fps 20
TEST_CASE 989c32c5a81967ec78d796ed22c054d5 --rk_led_value 40
TEST_CASE d087170586fcff9383b062fceb97ac99 --rk_night_mode 2
TEST_CASE e87afe1017a158eb3560d7ff7206eec6 --rk_venc_w 1234
TEST_CASE 7fc43861db888e3a89ffba7f60e83917 --rk_venc_h 1234
TEST_CASE 306dc070ef1453fe1ba76fae401e98c7 --rk_venc_type 2
TEST_CASE c8b8b46057acba2fdeed9d2d0863bd0b --rk_cam_mirror_flip 3
TEST_CASE e1c7ef28fe51a1bfc80295d6063601fa --rk_venc_bitrate 1234
TEST_CASE 7443c87d5b28e9c79687dce1f0faffc8 --rk_color_mode 1
TEST_CASE 47b7625cff2233b761853bc5c22f9ab3 --rk_cam_mirror_flip 3 \
	--rk_cam_w 1234 --rk_cam_h 1234 --rk_led_value 40  \
	--rk_night_mode 2  --rk_venc_w 1234  --rk_venc_h 1234 \
	--rk_venc_type 2  --rk_venc_bitrate 1234  --rk_cam_fps 20 \
	--rk_cam_hdr 5 --rk_color_mode 1
