#!/bin/sh

rcK()
{
	for i in $(ls /oem/usr/etc/init.d/S??*) ;do

		# Ignore dangling symlinks (if any).
		[ ! -f "$i" ] && continue

		case "$i" in
			*.sh)
				# Source shell script for speed.
				(
					trap - INT QUIT TSTP
					set stop
					. $i
				)
				;;
			*)
				# No sh extension, so fork subprocess.
				$i stop
				;;
		esac
	done
}

echo "Stop Application ..."
killall lvgl_app_v9
killall udhcpc

while [ 1 ];
do
	sleep 1
	ps|grep lvgl_app_v9|grep -v grep
	if [ $? -ne 0 ]; then
		echo "lvgl_app_v9 exit"
		break
	else
		echo "lvgl_app_v9 active"
	fi
done

rcK
