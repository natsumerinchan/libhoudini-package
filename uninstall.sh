#!/gearlock/bin/bash
## For proper developer documentation, visit https://wiki.supreme-gamers.com/gearlock/developer-guide
##
# GEN_UNINS is disabled by default (auto uninstallation script generation)
# It logs all the files present inside your package `system` & `data` dir
# and merge that as a function with your custom `uninstall.sh`.
# 
# You can use different uninstallation combinations, please check the developer documentation to know more.
# 
# Note: You don't need to manually deal with this file, GearLock will take care of it.
# 
# Use `return` instead of `exit` to stop uninstallation for any error, GearLock will transform this whole file into a bash function.
# 
# Tip: $UNINS_SCRIPT variable is provided by GXPM which returns
# full path for the locally prepared uninstallation script.

geco "\n++ Deleting the Arm translation layer"
mount -o remount,rw /
mount -o remount,rw /system
rm -rf "$SYSTEM_DIR/etc/binfmt_misc/*"
rm -rf "$SYSTEM_DIR/bin/houdini"
rm -rf "$SYSTEM_DIR/bin/arm/linker"
rm -rf "$SYSTEM_DIR/lib/libhoudini.so"
rm -rf "$SYSTEM_DIR/lib/arm"
rm -rf "$SYSTEM_DIR/bin/houdini64"
rm -rf "$SYSTEM_DIR/bin/arm64/linker64"
rm -rf "$SYSTEM_DIR/lib64/libhoudini.so"
rm -rf "$SYSTEM_DIR/lib64/arm64"
geco "\n++ Done."