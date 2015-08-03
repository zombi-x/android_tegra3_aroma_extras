#!/sbin/sh
# Set performance cpu speed
sed -i 's,mhz_performance=1800,mhz_performance=1500,g' /system/boot/preinit.cfg
