# libhoudini-for-x86_64-android11
(Sorry for my poor English)

[简体中文](https://github.com/natsumerinchan/libhoudini-for-x86_64-android11/blob/master/README_zh_cn.md)

#### 1、Description
A Gearlock package for install libhoudini translation on x86_64 Android11,libhoudini extracted from Windows Subsystem for Android™️ (WSA).

#### 2、Support Architecture
Only support x86_64 Android11 and higher versions.

#### 3、Environment

- Computer：Lenovo Legion Y7000 2020 (AV86)
- Cpu:Intel core i5-10200H
- Gpu:
  - Integrated Graphics：Intel(R) UHD Graphics 630
  - Discrete Graphics：Nvidia GeForce GTX 1650
- RAM：16GB DDR4 (8GB+8GB)
- OS: [AOSP11-stock](https://sourceforge.net/projects/blissos-dev/files/Android-Generic/PC/aosp/stock/11/)

#### 4、Instructions

1. [Install gearlock on Android x86 ](https://wiki.supreme-gamers.com/gearlock/user-guide/installation-and-updating/).
2. [Download and install this package](https://github.com/natsumerinchan/libhoudini-for-x86_64-android11/releases).
3. Go to Settings and turn on the arm compatibility switch,reboot.
4. Enjoy！

#### 5、Extracts

<details>
<summary>Show all</summary>

1. Arm_32(armeabi,armeabi-v7a)
- /system/bin/houdini
- /system/bin/arm/linker
- /system/lib/libhoudini.so
- /system/lib/arm/*
- /system/lib/arm/nb/*
- /system/vendor/lib/libhoudini.so
- /system/vendor/etc/binfmt_misc/arm_exe
- /system/vendor/etc/binfmt_misc/arm_dyn
2. Arm_64(arm64-v8a)
- /system/bin/houdini64
- /system/bin/arm64/linker64
- /system/lib64/libhoudini.so
- /system/lib64/arm64/*
- /system/lib64/arm64/nb/*
- /system/vendor/lib64/libhoudini.so
- /system/vendor/etc/binfmt_misc/arm64_exe
- /system/vendor/etc/binfmt_misc/arm64_dyn

</details>
