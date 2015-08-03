#!/sbin/sh
sed -i 's, test-keys, test-keys-1440x900,g' /system/build.prop
sed -i 's, test-keys-SBDAGS-SBDAGS, test-keys-SBDAGS,g' /system/build.prop
sed -i 's, test-keys-SBDAGS-INFINTY, test-keys-SBDAGS,g' /system/build.prop
sed -i 's, test-keys-SBDAGS-PRIME, test-keys-SBDAGS,g' /system/build.prop
