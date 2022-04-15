# libhoudini-for-x86_64-android11

[English](https://github.com/natsumerinchan/libhoudini-for-x86_64-android11)

#### 1、介绍
给Android11 x86_64 安装libhoudini arm兼容层，提取自Windows Subsystem for Android™️ (WSA)

#### 2、支持架构
仅支持x86_64 Android11及更高版本

#### 3、测试环境

- Computer：联想拯救者Y7000 2020 (AV86)
- Cpu:Intel core i5-10200H
- Gpu:
  - 核显：Intel(R) UHD Graphics 630
  - 独显：Nvidia GeForce GTX 1650
- 内存：16GB DDR4 (8GB+8GB)
- 系统: [AOSP11-stock](https://sourceforge.net/projects/blissos-dev/files/Android-Generic/PC/aosp/stock/11/)

#### 4、安装方法
 
1.  [给android x86安装gearlock](https://wiki.supreme-gamers.com/gearlock/user-guide/installation-and-updating/)
2.  [下载并安装本拓展](https://github.com/natsumerinchan/libhoudini-for-x86_64-android11/releases)
3.  进入设置打开arm兼容开关，然后重启
4.  Enjoy！

#### 5、提取内容
<details>
<summary>显示全部</summary>

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
