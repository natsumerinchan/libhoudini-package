#!/gearlock/bin/bash
## For proper developer documentation, visit https://wiki.supreme-gamers.com/gearlock/developer-guide
# This script will be executed during post-fs-data stage.
# You must delete this if you dont need it.
# Note: You don't need to manually deal with this file, GearLock will take care of it.

# Define your props inside a var in <prop> <value> format

ARM_TRANSLATION="
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

gearprop "$ARM_TRANSLATION"
