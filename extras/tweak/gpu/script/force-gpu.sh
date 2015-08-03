#!/sbin/sh

echo "# Force GPU" >> /system/build.prop
echo "persist.sys.ui.hw=1" >> /system/build.prop
echo "" >> /system/build.prop
