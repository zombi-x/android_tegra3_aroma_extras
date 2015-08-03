#!/sbin/sh
# Set OC Switch
sed -i 's,override_edp_limit=0,override_edp_limit=1,g' /system/boot/preinit.cfg
