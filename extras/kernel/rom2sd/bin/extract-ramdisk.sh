#!/sbin/busybox sh

# get file descriptor for output
# thanks to Chainfire - http://forum.xda-developers.com/showthread.php?t=1023150
OUTFD=$(ps | grep -v "grep" | grep -o -E "update_binary(.*)" | cut -d " " -f 3)
# TWRP names the extracted update-binary "updater"
[ $OUTFD != "" ] || OUTFD=$(ps | grep -v "grep" | grep -o -E "updater(.*)" | cut -d " " -f 3)

# same as ui_print command in updater_script, for example:
#
# ui_print "hello world!"
#
# will output "hello world!" to recovery, while
#
# ui_print
#
# outputs an empty line

ui_print() {
  if [ $OUTFD != "" ]; then
    echo "ui_print ${1} " >&$OUTFD
    echo "ui_print " >&$OUTFD
  else
    echo "${1}"
  fi;
}


ui_redirect() {
  while read -r line
  do
    echo "ui_print $line" >&$OUTFD
    echo "ui_print " >&$OUTFD
  done
}


# extract the ramdisk from the kernel in the staging partition
/tmp/extract-ramdisk /dev/block/mmcblk0p4 > /tmp/ramdisk.gz

# extract the files inside
mkdir /system/boot
mkdir /system/boot/ramdisk
cd /system/boot/ramdisk
gzip -d -c /tmp/ramdisk.gz | cpio -i || cat /tmp/ramdisk.gz | lzma -d -c | cpio -i

# check for existence of single data fstab and swap back
if [ -e /tmp/fstab/fstab.cardhu ]; then
	cp /tmp/fstab/fstab.cardhu fstab.cardhu
fi

# check for existence of init-android and swap back to init if exists in ramdisk
if [ -e init-android ]; then
	mv init-android init
fi

# kill the blob header so that the new kernel isn't flashed by the bootloader
dd if=/dev/zero of=/dev/block/mmcblk0p4 bs=32 count=1

# now change the ramdisk for ROM2SD:

# change mountpoints in rc files
for i in *.rc; do
	sed -i 's/mmcblk0p1\([^0-9]\)/mmcblk1p3\1/g' $i
	sed -i 's/mmcblk0p8\([^0-9]\)/mmcblk1p2\1/g' $i
done

# Insert systemi and datai into fstab and change existing mount points
for f in fstab.*; do
	sed -i '/mmcblk0p8/{;h;s-/data-/datai-p;g;s-mmcblk0p8-mmcblk1p2-;}' $f
    sed -i '/mmcblk0p1/{;h;s-/system-/systemi-p;g;s-mmcblk0p1-mmcblk1p3-;}' $f
done

# Add mounts and sdcard daemon for /datai - Add entry to init.rc to call init.data2sd.rc

grep init.data2sd.rc init.rc >/dev/null || sed -i '/init.carrier.rc$/a \
import /init.data2sd.rc' init.rc

grep init.data2sd.rc init.rc >/dev/null || sed -i '/init.zombi.rc$/a \
import /init.data2sd.rc' init.rc

      
# load wifi modules
grep cfg80211.ko init.cardhu.rc >/dev/null || sed -i '/^on boot$/a \
    insmod /system/lib/modules/cfg80211.ko\
    insmod /system/lib/modules/bcmdhd.ko' init.cardhu.rc

ui_print "----- ramdisk extracted and edited! -----"
