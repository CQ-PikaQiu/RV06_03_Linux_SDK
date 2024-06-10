#!/bin/bash

cd $RK_PROJECT_PACKAGE_OEM_DIR/usr/lib/
rm object_detection_pfp_896x512.data
mv object_detection_pfp_512x288.data object_detection_pfp.data
rm auto_lane_obj_det.data
rm object_detection_pfcp.data
rm librknnmrt_rockauto.so
rm librockauto.so
rm libivs.so
rm librkAVS_genLut.so
rm librkAVS_genStitch.so
rm librkrawstream.so
rm librockit_full.so
rm librockit_tiny.so
rm librve.so
rm librkdemuxer.so
rm libjpeg.so*
cd -

rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/lib/libstdc++.so.6.0.25-gdb.py

# delete nouse ko
rm -f $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/gcm.ko
rm -f $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/ccm.ko
rm -f $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/sha256_generic.ko
rm -f $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/libaes.ko
rm -f $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/libsha256.ko
rm -f $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/gf128mul.ko
rm -f $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/cmac.ko
rm -f $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/rve.ko
rm -f $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/libarc4.ko
rm -f $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/aes_generic.ko
rm -f $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/ctr.ko
rm -f $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/mac80211.ko
rm -f $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/atmb_iot_supplicant_demo
rm -f $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/gc2053.ko
rm -f $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/sc530ai.ko
rm -f $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/os04a10.ko
rm -f $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/8189fs.ko
rm -f $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/ipv6.ko
