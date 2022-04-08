## For proper develoer documentation, visit https://supreme-gamers.com/gearlock
# This script will be executed during post-fs-data stage.
# You must delete this if you dont need it.

# Define your props inside a var in <prop> <value> format
ARM_TRANSLATION="
ro.product.cpu.abilist x86_64,x86,arm64-v8a,armeabi-v7a,armeabi
ro.product.cpu.abilist32 x86,armeabi-v7a,armeabi
ro.product.cpu.abilist64 x86_64,arm64-v8a
ro.dalvik.vm.native.bridge libhoudini.so
ro.enable.native.bridge.exec 1
ro.dalvik.vm.isa.arm x86
ro.dalvik.vm.isa.arm64 x86_64
"

# Now call the var over gearprop with quotes
gearprop "$ARM_TRANSLATION"