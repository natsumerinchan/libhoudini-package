# Libhoudini-package-template
(Sorry for my poor English)

[ **简体中文** ](README_zh_cn.md) || **English** 

#### 1、Description
A Gearlock package for install libhoudini translation on x86_64 Android11,extracted from Windows Subsystem for Android™️ (WSA).

#### 2、Extracts

[You can use this batch file to extract WSA libhoudini files by yourselves.](https://gist.github.com/natsumerinchan/b7a44acadfa66d0e07ead299423695c4)

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

#### 3、How to build

```
git clone https://github.com/AXIM0S/gearlock-dev-kit; cd ./gearlock-dev-kit
```

```
./configure; rm -rf ./workdir 
```
- choose "3) Custom Core Package"

```
git clone -b template https://github.com/natsumerinchan/libhoudini-package.git workdir
```

```
rm -rf ./workdir/*.md ./workdir/LICENSE ./workdir/.git ./workdir/.gitignore
```

- Put the libhoudini file which you extracted or obtained elsewhere into "~/gearlock-dev-kit/workdir/system" directory.

```
./build
``` 
- choose "1) I configured it manually"
