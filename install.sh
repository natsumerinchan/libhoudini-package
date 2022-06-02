#!/gearlock/bin/bash
## For proper developer documentation, visit https://wiki.supreme-gamers.com/gearlock/developer-guide
# Check `!zygote.sh` to configure your package functions or gearlock can also guide you during the build process

#####--- Import Functions ---#####
get_base_dir # Returns execution directory path in $BD variable
# get_net_stat
check_compat 7.2.22
#####--- Import Functions ---#####

# Ensure compatible GearLock version
if test "$COMPAT" != "yes"; then
	geco "\n[!!!] Please update GearLock to install this package" && exit 101
fi

# Ensure Recovery mode
if test "$RECOVERY" != "yes"; then
	geco "\n[!!!] Please use Recovery mode to install this package" && exit 101
fi

# Check if /system is writable
! touch -c "$SYSTEM_DIR/lib" >/dev/null 2>&1 && geco "[!!!] $SYSTEM_DIR is not writable, did you ${PINK}SuperCharge${RC} it yet ?" && exit 101

# Show sdk version and device architecture

if test -d "$SYSTEM_DIR/lib64/hw"; then
	SYSTEM_ARCH=x86_64
else
	SYSTEM_ARCH=x86
fi

geco "[INFO] -SDK: $SDK"
geco "[INFO] -Platform: $SYSTEM_ARCH"

# Ensure Android version
if test "$SDK" != "30"; then
	geco "\n[!!!] This package only supports Android11." && exit 101
fi

# Ensure Device Architecture
if test "$SYSTEM_ARCH" != "x86_64"; then
	geco "\n[!!!] Unsupport Platform: -$SYSTEM_ARCH ;This package only supports x86_64 devices!" && exit 101
fi

# Check Built-in Arm Translation
if test -d "$SYSTEM_DIR/lib/arm"; then
	geco "\n[!!!] Arm Translation is exist!Please find a way to remove built-in one." && exit 101
else
	if test -d "$SYSTEM_DIR/lib64/arm64"; then
	    geco "\n[!!!] Arm Translation is exist!Please find a way to remove built-in one." && exit 101
	else
	    geco "\n[!!!] Built-in Arm Translation is not exist.You can continue."
	fi
fi

# Before installation
read -rn1 -p "$(geco "++++ Do you want to continue? ? [y/${GREEN}N${RC}]") " c
test "${c,,}" != 'y' && exit 101 #(exit-code ref: https://wiki.supreme-gamers.com/gearlock/developer-guide/#install-sh-exit-code)

# Set permissions
chmod -R -f 777 "$BD/system/"

# Copy files
geco "+ Merging files in your operating-system"
gclone "$BD/system/" "$SYSTEM_DIR" # You must use quotes " " if any of your file-name contains *spaces or special characters
