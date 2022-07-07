# Libhoudini-package-template

 **简体中文** || [ **English** ](README.md)

#### 1、介绍
给Android11 x86_64 安装libhoudini arm兼容层，提取自Windows Subsystem for Android™️ (WSA)

#### 2、提取内容

[你可以用这个批处理脚本自行提取WSA libhoudini文件](https://gist.github.com/natsumerinchan/b7a44acadfa66d0e07ead299423695c4)

<details>
<summary>显示全部</summary>

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

#### 3、如何构建

```
git clone https://github.com/AXIM0S/gearlock-dev-kit; cd ./gearlock-dev-kit
```

```
./configure; rm -rf ./workdir
```
- 选择"3) Custom Core Package"

```
git clone -b template https://github.com/natsumerinchan/libhoudini-package.git workdir
```

```
rm -rf ./workdir/*.md ./workdir/LICENSE ./workdir/.git ./workdir/.gitignore
```

- 把你从其他地方提取或获取的libhoudini文件放入"~/gearlock-dev-kit/workdir/system"

```
./build
```
- 选择"1) I configured it manually"
