#!/sbin/sh
sed -i 's,id=zombi_tf700t-userdebug 5.1.1 LYZ28E eng.sbdags.20150718.190052,id=TF700T_ZOMBi-POP-5.1.1-OMNI-DEODEX RC1,g' /system/build.prop
sed -i 's,id=zombi_tf300t-userdebug 5.1.1 LYZ28E eng.sbdags.20150718.180518,id=TF300T_ZOMBi-POP-5.1.1-OMNI-DEODEX RC1,g' /system/build.prop
sed -i 's,id=zombi_tf201t-userdebug 5.1.1 LYZ28E eng.sbdags.20150718.183326,id=TF201T_ZOMBi-POP-5.1.1-OMNI-DEODEX RC1,g' /system/build.prop
#sed -i 's,-20150718-,-20150728-,g' /system/build.prop
sed -i 's,dalvik.vm.heapgrowthlimit=48m,dalvik.vm.heapgrowthlimit=92m,g' /system/build.prop
sed -i 's,wifi.supplicant_scan_interval=15,wifi.supplicant_scan_interval=180,g' /system/build.prop
#sed -i '/dalvik.vm.dexopt-flags=m=y/d' /system/build.prop
sed -i 's,dalvik.vm.heapstartsize=5m,dalvik.vm.heapstartsize=8m,g' /system/build.prop
sed -i 's,dalvik.vm.heapmaxfree=2m,dalvik.vm.heapmaxfree=8m,g' /system/build.prop
#sed -i 's,dalvik.vm.heapsize=384m,dalvik.vm.heapsize=256m,g' /system/build.prop
#sed -i 's,persist.sys.root_access=0,persist.sys.root_access=1,g' /system/build.prop
sed -i '/ro.sf.lcd_density=240/d' /system/build.prop
sed -i '/ro.sf.lcd_density=160/d' /system/build.prop
echo "" >> /system/build.prop
echo "# ZOMBi-POP" >> /system/build.prop
#echo "persist.adb.notify=0" >> /system/build.prop
#echo "persist.service.adb.enable=1" >> /system/build.prop
#echo "persist.service.mount.playsnd=0" >> /system/build.prop
#echo "persist.service.debuggable=1" >> /system/build.prop
#echo "ro.kernel.android.checkjni=0" >> /system/build.prop
#echo "" >> /system/build.prop
#echo "# Battery savers" >> /system/build.prop
#echo "ro.ril.disable.power.collapse=0" >> /system/build.prop
#echo "" >> /system/build.prop
#echo "# Increase jpg quality to 100%" >> /system/build.prop
#echo "ro.media.enc.jpeg.quality=100" >> /system/build.prop
#echo "ro.media.dec.jpeg.memcap=80000000" >> /system/build.prop
#echo "ro.media.enc.hprof.vid.bps=8000000" >> /system/build.prop
#echo "" >> /system/build.prop
#echo "# Smoother video streaming" >> /system/build.prop
#echo "media.stagefright.enable-player=true" >> /system/build.prop
#echo "media.stagefright.enable-meta=true" >> /system/build.prop
#echo "media.stagefright.enable-scan=false" >> /system/build.prop
#echo "media.stagefright.enable-http=true" >> /system/build.prop
#echo "" >> /system/build.prop
#echo "# Device will boot faster" >> /system/build.prop
#echo "ro.config.hw_quickpoweron=true" >> /system/build.prop
#echo "" >> /system/build.prop
#echo "# Allow dalvik to use JIT (Just in Time) Compiler" >> /system/build.prop
#echo "dalvik.vm.execution-mode=init:jit" >> /system/build.prop
#echo "dalvik.vm.verify-bytecode=false" >> /system/build.prop
#echo "dalvik.vm.checkjni=false" >> /system/build.prop
#echo "dalvik.vm.dexopt-data-only=1" >> /system/build.prop
#echo "dalvik.vm.check-dex-sum=false" >> /system/build.prop
#echo "dalvik.vm.dexopt-flags=m=y,o=f,u=n,v=a" >> /system/build.prop
#echo "dalvik.vm.dexopt-flags=m=v,o=y" >> /system/build.prop
#echo "" >> /system/build.prop
echo "# Improve Touch Pressure" >> /system/build.prop
#echo "debug.performance.tuning=1" >> /system/build.prop
echo "windowsmgr.max_events_per_sec=300" >> /system/build.prop
echo "view.touch_slop=2" >> /system/build.prop
echo "view.scroll_friction=0.001" >> /system/build.prop
echo "view.minimum_fling_velocity=8" >> /system/build.prop
echo "view.maximum_fling_velocity=999" >> /system/build.prop
echo "ro.min_pointer_dur=8" >> /system/build.prop
echo "touch.size.calibration=geometric" >> /system/build.prop
echo "touch.size.scale=100" >> /system/build.prop
echo "touch.pressure.calibration=amplitude" >> /system/build.prop
echo "touch.pressure.scale=0.001" >> /system/build.prop
echo "ro.min.fling_velocity=12000" >> /system/build.prop
echo "ro.max.fling_velocity=30000" >> /system/build.prop
echo "" >> /system/build.prop
