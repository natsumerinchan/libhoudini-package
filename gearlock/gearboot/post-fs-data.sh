## For proper develoer documentation, visit https://supreme-gamers.com/gearlock
# This script will be executed during post-fs-data stage.
# You must delete this if you dont need it.

# Define your props inside a var in <prop> <value> format

mount -o remount,rw /
mount -o remount,rw /system
if test -d "$SYSTEM_DIR/lib64/hw"; then
	SYSTEM_ARCH=x86_64
else
	SYSTEM_ARCH=x86
fi

ARM_TRANSLATION_x86="
ro.product.cpu.abilist x86,armeabi-v7a,armeabi
ro.product.cpu.abilist32 x86,armeabi-v7a,armeabi
ro.vendor.product.cpu.abilist x86,armeabi-v7a,armeabi
ro.vendor.product.cpu.abilist32 x86,armeabi-v7a,armeabi
ro.odm.product.cpu.abilist x86,armeabi-v7a,armeabi
ro.odm.product.cpu.abilist32 x86,armeabi-v7a,armeabi
ro.dalvik.vm.native.bridge libhoudini.so
ro.enable.native.bridge.exec 1
ro.dalvik.vm.isa.arm x86
ro.zygote zygote32
"

ARM_TRANSLATION_x86_64="
ro.product.cpu.abilist x86_64,x86,arm64-v8a,armeabi-v7a,armeabi
ro.product.cpu.abilist32 x86,armeabi-v7a,armeabi
ro.product.cpu.abilist64 x86_64,arm64-v8a
ro.vendor.product.cpu.abilist x86_64,x86,arm64-v8a,armeabi-v7a,armeabi
ro.vendor.product.cpu.abilist32 x86,armeabi-v7a,armeabi
ro.vendor.product.cpu.abilist64 x86_64,arm64-v8a
ro.odm.product.cpu.abilist x86_64,x86,arm64-v8a,armeabi-v7a,armeabi
ro.odm.product.cpu.abilist32 x86,armeabi-v7a,armeabi
ro.odm.product.cpu.abilist64 x86_64,arm64-v8a
ro.dalvik.vm.native.bridge libhoudini.so
ro.enable.native.bridge.exec 1
ro.enable.native.bridge.exec64 1
ro.dalvik.vm.isa.arm x86
ro.dalvik.vm.isa.arm64 x86_64
ro.zygote zygote64_32
"

# Now call the var over gearprop with quotes

if test "$SYSTEM_ARCH" != "x86_64"; then
        gearprop "$ARM_TRANSLATION_x86"
else
        gearprop "$ARM_TRANSLATION_x86_64"
fi
