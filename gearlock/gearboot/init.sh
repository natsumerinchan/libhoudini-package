#!/gearlock/bin/bash
## For proper developer documentation, visit https://wiki.supreme-gamers.com/gearlock/developer-guide
# This script will be executed during init stage.
# You must delete this if you dont need it.
# Note: You don't need to manually deal with this file, GearLock will take care of it.

# Enable native bridge for target executables

mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc

cp /system/etc/binfmt_misc/arm_exe /proc/sys/fs/binfmt_misc/register
cp /system/etc/binfmt_misc/arm_dyn /proc/sys/fs/binfmt_misc/register
cp /system/etc/binfmt_misc/arm64_exe /proc/sys/fs/binfmt_misc/register
cp /system/etc/binfmt_misc/arm64_dyn /proc/sys/fs/binfmt_misc/register
