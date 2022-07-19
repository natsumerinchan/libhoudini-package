# libhoudini-for-x86_64-android11
(Sorry for my poor English)

[ **简体中文** ](README_zh_cn.md) || **English** 

#### 1、Description
A Gearlock package for install libhoudini translation on x86_64 Android11,extracted from Windows Subsystem for Android™️ (WSA).

#### 2、Supports Platform
Only supports x86_64 Android11.

#### 3、Environment

- Computer：Lenovo Legion Y7000 2020 (82AV)
- CPU:Intel core i5-10200H
- GPU:
  + Integrated Graphics：Intel(R) UHD Graphics 630
  + Discrete Graphics：Nvidia GeForce GTX 1650
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

1. Arm_64(arm64-v8a)
- /system/bin/houdini64
- /system/bin/arm64/linker64
- /system/lib64/libhoudini.so
- /system/lib64/arm64/*

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
git clone https://github.com/natsumerinchan/libhoudini-package.git workdir
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
![AIDA64](https://raw.githubusercontent.com/natsumerinchan/My_Own_Drawing_Bed/main/libhoudini-for-x86_64-android11/AIDA64.png)

2. Desktop
![Desktop](https://raw.githubusercontent.com/natsumerinchan/My_Own_Drawing_Bed/main/libhoudini-for-x86_64-android11/Desktop.png)

3. PCR
![PCR](https://raw.githubusercontent.com/natsumerinchan/My_Own_Drawing_Bed/main/libhoudini-for-x86_64-android11/PCR.png)

4. Wallpaper Engine
![Wallpaper Engine](https://raw.githubusercontent.com/natsumerinchan/My_Own_Drawing_Bed/main/libhoudini-for-x86_64-android11/Wallpaper_Engine.png)

#### 9、Known bugs
1.Blue Archive (Can open the title page, but it crashes on loading.)
- Due to app's data is not recognized it will make the game crash on loading. To fix this, there're 2 solutions :
   
   ***These method are for people who can be able to compile custom Android-x86 images***
  + Make a script that set data permission to 777 whenever an app is being opened (PrimeOS method - **NOT RECOMMEND**)
    * Cherry-pick these two commits :
    https://github.com/supremegamers/device_generic_common/commit/2d47891376c96011b2ee3c1ccef61cb48e15aed6
    https://github.com/supremegamers/android_frameworks_base/commit/24a08bf800b2e461356a9d67d04572bb10b0e819
   
    Result : Tested by [SGNight](https://github.com/SGNight) using ProjectSakura-x86
   ![Result](https://cdn.discordapp.com/attachments/631759304097267712/967155258985943090/IMG_20220423_013402.jpg)
   
   + Use bind mounting file-systems (**RECOMMEND**)
   
   The proper way is to use file-systems such as `sdcardfs` or `esdfs` so that it can bind mount both apps data or obb correctly. This method is still being used by Android devices today.      

     * Find a kernel that include the file-systems :
        
        ** For `sdcardfs`, check out [maurossi](https://github.com/maurossi/linux) or [youling257](https://github.com/youling257/android-mainline) repo : 
        (recommend to set `CONFIG_SDCARD_FS` to =y instead of =m)
        
        ** For `esdfs`, check out [HMTheBoy154](https://github.com/hmtheboy154/Darkmatter-kernel) (umbral branch) or [youling257](https://github.com/youling257/android-mainline) (5.18 branch and above). `esdfs` and `pkglist` are pulled from ChromiumOS's third_party kernel repo.
        
    * Go to device/generic/common and revert [this commit](https://github.com/supremegamers/device_generic_common/commit/ff34d6d549f026156188cf1467f26628e5cac658)
    
    ***(These next step are required for people who want to use esdfs instead, which [HMTheBoy154](https://github.com/hmtheboy154/) recommend)***
    * Still in device/generic/common, open device.mk and add these line 
    ```
    PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.sys.sdcardfs=false \
    persist.sys.sdcardfs=force_off
    ```
    
    * Go to system/vold, cherry-pick [this commit](https://github.com/supremegamers/platform_system_vold/commit/17ab73250d5acee423bd98fc885f87783baf9bd7) 
    
    Result : Tested by [HMTheBoy154](https://github.com/hmtheboy154) using BlissOS 15.6 (Android 12L)
    ![photo_2022-07-19_14-01-19](https://user-images.githubusercontent.com/39849246/179693211-a6a711a0-a968-418e-bfb0-aef289d34f54.jpg)

    
