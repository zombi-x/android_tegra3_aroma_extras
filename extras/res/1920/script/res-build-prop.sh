#!/sbin/sh
sed -i 's, test-keys, test-keys-1920x1200,g' /system/build.prop
sed -i 's, test-keys-INFINITY-INFINITY, test-keys-INFINITY,g' /system/build.prop
sed -i 's, test-keys-INFINITY-SBDAGS, test-keys-INFINITY,g' /system/build.prop
sed -i 's, test-keys-INFINITY-PRIME, test-keys-INFINITY,g' /system/build.prop
