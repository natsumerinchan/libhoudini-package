# libhoudini-for-x86_64-android11
(Sorry for my poor English)

[ **简体中文** ](README_zh_cn.md) || **English** 

#### 1、Description
A Gearlock package for install libhoudini translation on x86_64 Android11,extracted from Windows Subsystem for Android™️ (WSA).

#### 2、Supports Platform
Only supports x86_64 Android11.

#### 3、Environment

- Computer：Lenovo Legion Y7000 2020 (82AV)
- Cpu:Intel core i5-10200H
- Gpu:
  - Integrated Graphics：Intel(R) UHD Graphics 630
  - Discrete Graphics：Nvidia GeForce GTX 1650
- RAM：16GB DDR4 (8GB+8GB)
- OS: [AOSP11-stock](https://sourceforge.net/projects/blissos-dev/files/Android-Generic/PC/aosp/stock/11/)

#### 4、Instructions

1. [Install Gearlock on Android x86 ](https://wiki.supreme-gamers.com/gearlock/user-guide/installation-and-updating/).
2. [Download and install this package](https://github.com/natsumerinchan/libhoudini-for-x86_64-android11/releases)
3. Go to Settings and turn on the arm compatibility switch,reboot.
4. Enjoy！

#### 5、Extracts

[You can use this batch file to extract libhoudini files by yourselves.](https://gist.github.com/natsumerinchan/b7a44acadfa66d0e07ead299423695c4)

<details>
<summary>Show all</summary>

1. Arm_32(armeabi,armeabi-v7a)
- /system/bin/houdini
- /system/bin/arm/linker
- /system/lib/libhoudini.so
- /system/lib/arm/*
- /system/lib/arm/nb/*

2. Arm_64(arm64-v8a)
- /system/bin/houdini64
- /system/bin/arm64/linker64
- /system/lib64/libhoudini.so
- /system/lib64/arm64/*
- /system/lib64/arm64/nb/*

</details>

#### 6、How to build

```
git clone https://github.com/AXIM0S/gearlock-dev-kit; cd ./gearlock-dev-kit
```

```
./configure; rm -rf ./workdir 
```
- choose "3) Custom Core Package"

```
git clone https://github.com/natsumerinchan/libhoudini-for-x86_64-android11.git workdir
```

```
rm -rf ./workdir/*.md ./workdir/LICENSE ./workdir/.git ./workdir/.gitignore
```

```
./build
``` 
- choose "1) I configured it manually"

#### 7、Specify app native libraries

`pm install --abi %ARCH% %APK_PATH% `

ARCH:
- armeabi
- armeabi-v7a
- arm64-v8a
- x86
- x86_64

#### 8、Effect
1. AIDA64
![输入图片说明](https://raw.githubusercontent.com/natsumerinchan/My_Own_Drawing_Bed/main/libhoudini-for-x86_64-android11/AIDA64.png)

2. Desktop
![输入图片说明](https://raw.githubusercontent.com/natsumerinchan/My_Own_Drawing_Bed/main/libhoudini-for-x86_64-android11/Desktop.png)

3. PCR
![输入图片说明](https://raw.githubusercontent.com/natsumerinchan/My_Own_Drawing_Bed/main/libhoudini-for-x86_64-android11/PCR.png)

4. Wallpaper Engine
![输入图片说明](https://raw.githubusercontent.com/natsumerinchan/My_Own_Drawing_Bed/main/libhoudini-for-x86_64-android11/Wallpaper_Engine.png)

#### 9、Unsupported applications
1.Blue Archive (Can open the title page, but it crashes on loading.)
- (PrimeOS 2.1.2 has fixed this bug,you can use it or you can also extract libhoudini file from PrimeOS.iso to replace "~/gearlock-dev-kit/workdir/system" directory and build package by yourselves.)
