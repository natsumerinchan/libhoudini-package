# libhoudini-for-x86_64-android11

 **简体中文** || [ **English** ](README.md)

#### 1、介绍
给Android11 x86_64 安装libhoudini arm兼容层，提取自Windows Subsystem for Android™️ (WSA)

#### 2、支持平台
仅支持x86_64 Android11

#### 3、测试环境

- Computer：联想拯救者Y7000 2020 (82AV)
- CPU:Intel core i5-10200H
- GPU:
  + 核显：Intel(R) UHD Graphics 630
  + 独显：Nvidia GeForce GTX 1650
- 内存：16GB DDR4 (8GB+8GB)
- 系统: [AOSP11-stock](https://sourceforge.net/projects/blissos-dev/files/Android-Generic/PC/aosp/stock/11/)

#### 4、安装方法
 
1.  [给android x86安装gearlock](https://wiki.supreme-gamers.com/gearlock/user-guide/installation-and-updating/)
2.  [下载并安装本拓展](https://github.com/natsumerinchan/libhoudini-for-x86_64-android11/releases)
3.  进入设置打开arm兼容开关，然后重启
4.  Enjoy！

#### 5、提取内容

[你可以用这个批处理脚本自行提取libhoudini文件](https://gist.github.com/natsumerinchan/b7a44acadfa66d0e07ead299423695c4)

<details>
<summary>显示全部</summary>

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

#### 6、如何构建

```
git clone https://github.com/AXIM0S/gearlock-dev-kit; cd ./gearlock-dev-kit
```

```
./configure; rm -rf ./workdir
```
- 选择"3) Custom Core Package"

```
git clone https://github.com/natsumerinchan/libhoudini-package.git workdir
```

```
rm -rf ./workdir/*.md ./workdir/LICENSE ./workdir/.git ./workdir/.gitignore
```

```
./build
```
- 选择"1) I configured it manually"

#### 7、让应用使用指定的原生库

`pm install --abi $ARCH $APK_PATH `

ARCH:
 - armeabi
 - armeabi-v7a
 - arm64-v8a
 - x86
 - x86_64

#### 8、效果
1. AIDA64
![输入图片说明](https://raw.githubusercontent.com/natsumerinchan/My_Own_Drawing_Bed/main/libhoudini-for-x86_64-android11/AIDA64.png)

2. 桌面
![输入图片说明](https://raw.githubusercontent.com/natsumerinchan/My_Own_Drawing_Bed/main/libhoudini-for-x86_64-android11/Desktop.png)

3. 公主连结R
![输入图片说明](https://raw.githubusercontent.com/natsumerinchan/My_Own_Drawing_Bed/main/libhoudini-for-x86_64-android11/PCR.png)

4. Wallpaper Engine
![输入图片说明](https://raw.githubusercontent.com/natsumerinchan/My_Own_Drawing_Bed/main/libhoudini-for-x86_64-android11/Wallpaper_Engine.png)

#### 9、已知bug
1.Blue Archive (能进入标题页面但加载时会闪退.)
- 由于应用程序的data未被识别，它将使游戏在加载时崩溃。为了解决这个问题，有两个解决方案 :

   ***这些方法是为那些能够编译自定义Android-x86镜像的人准备的。***
  + 编写一个脚本，每当有一个应用程序被打开时，自动将data权限设置为777 (这是PrimeOS使用的方法 - **不推荐**)
    * Cherry-pick这两个提交 :
    https://github.com/supremegamers/device_generic_common/commit/2d47891376c96011b2ee3c1ccef61cb48e15aed6
    https://github.com/supremegamers/android_frameworks_base/commit/24a08bf800b2e461356a9d67d04572bb10b0e819
   
    效果 : [SGNight](https://github.com/SGNight) 在ProjectSakura-x86上进行的测试
   ![效果](https://cdn.discordapp.com/attachments/631759304097267712/967155258985943090/IMG_20220423_013402.jpg)
   
   + 使用绑定挂载文件系统 (**推荐**)
   
   正确的方法是使用文件系统，如`sdcardfs`或`esdfs`，这样它可以正确地绑定挂载应用程序的data或obb。这种方法今天仍然被安卓设备所使用。      

     * 找一个包括这些文件系统的内核 :
        
        ** 对于 `sdcardfs`, 请checkout [maurossi](https://github.com/maurossi/linux) 或 [youling257](https://github.com/youling257/android-mainline)的仓库 : 
        (建议把 `CONFIG_SDCARD_FS` 从 =m改为 =y)
        
        ** 对于 `esdfs`, 请checkout [HMTheBoy154](https://github.com/hmtheboy154/Darkmatter-kernel) (umbral 分支) or [youling257](https://github.com/youling257/android-mainline) (5.18 以上的分支). `esdfs`和`pkglist`来自ChromiumOS的第三方内核仓库。
        
    * 转到device/generic/common并revert[此提交](https://github.com/supremegamers/device_generic_common/commit/ff34d6d549f026156188cf1467f26628e5cac658)
    
    ***(对于想使用esdfs的人来说，接下来的这些步骤是必须的, 来自 [HMTheBoy154](https://github.com/hmtheboy154/) 的建议)***
    * 仍然在device/generic/common中，打开device.mk并添加这些行 
    ```
    PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.sys.sdcardfs=false \
    persist.sys.sdcardfs=force_off
    ```
    
    * 转到system/vold，cherry-pick[此提交](https://github.com/supremegamers/platform_system_vold/commit/17ab73250d5acee423bd98fc885f87783baf9bd7) 
    
    效果 : [HMTheBoy154](https://github.com/hmtheboy154) 在BlissOS 15.6 (Android 12L)上进行的测试
    ![photo_2022-07-19_14-01-19](https://user-images.githubusercontent.com/39849246/179693211-a6a711a0-a968-418e-bfb0-aef289d34f54.jpg)

#### 10、Credits

- [gearlock](https://github.com/axonasif/gearlock)

- [gearlock-dev-kit](https://github.com/axonasif/gearlock-dev-kit)