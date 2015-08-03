#!/sbin/sh
sed -i 's, test-keys, test-keys-1280x800,g' /system/build.prop
sed -i 's, test-keys-PRIME-PRIME, test-keys-PRIME,g' /system/build.prop
sed -i 's, test-keys-PRIME-INFINTY, test-keys-PRIME,g' /system/build.prop
sed -i 's, test-keys-PRIME-SBDAGS, test-keys-PRIME,g' /system/build.prop
