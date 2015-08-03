#!/sbin/sh

SYSTEMLIB=/system/lib

set_perm() {
  chown $1.$2 $4
  chown $1:$2 $4
  chmod $3 $4
}

API=$(cat /system/build.prop | grep ro.build.version.sdk= | dd bs=1 skip=21 count=2)
SUMOD=0755
SUGOTE=true
SUPOLICY=true
MKSH=/system/bin/mksh
if [ ! -f $MKSH ]; then
  MKSH=/system/bin/sh
fi

mkdir /system/bin/.ext
cp /system/xbin/su /system/xbin/daemonsu
if ($SUGOTE); then 
  cp /system/xbin/su /system/xbin/sugote
  cp $MKSH /system/xbin/sugote-mksh
fi
cp /system/xbin/su /system/bin/.ext/.su
ln -s /system/etc/install-recovery.sh /system/bin/install-recovery.sh
touch /system/etc/.installed_su_daemon
echo 1 > /system/etc/.installed_su_daemon

set_perm 0 0 0777 /system/bin/.ext
set_perm 0 0 $SUMOD /system/bin/.ext/.su
set_perm 0 0 $SUMOD /system/xbin/su
if ($SUGOTE); then 
  set_perm 0 0 0755 /system/xbin/sugote
  set_perm 0 0 0755 /system/xbin/sugote-mksh
fi
if ($SUPOLICY); then
  set_perm 0 0 0755 /system/xbin/supolicy
  set_perm 0 0 0644 /system/lib/libsupol.so
fi
set_perm 0 0 0755 /system/xbin/daemonsu
set_perm 0 0 0755 /system/etc/install-recovery.sh
set_perm 0 0 0755 /system/etc/init.d/99SuperSUDaemon
set_perm 0 0 0644 /system/etc/.installed_su_daemon
rm /system/bin/app_process
ln -s /system/xbin/daemonsu /system/bin/app_process
mv /system/bin/app_process32 /system/bin/app_process32_original
ln -s /system/xbin/daemonsu /system/bin/app_process32
cp /system/bin/app_process32_original /system/bin/app_process_init
set_perm 0 2000 0755 /system/bin/app_process_init
set_perm 0 0 0755 /system/app/SuperSU
set_perm 0 0 0644 /system/app/SuperSU/Superuser.apk

LD_LIBRARY_PATH=$SYSTEMLIB /system/xbin/su --install


