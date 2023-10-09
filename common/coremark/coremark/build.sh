#!/bin/sh

GCC_VERSION=9.1.0
#GCC_VERSION=6.4.0

if [ "${GCC_VERSION}" = "9.1.0"  ];then
    export PATH=/tools/toolchain/gcc-sigmastar-9.1.0-2020.07-x86_64_arm-linux-gnueabihf/bin:$PATH
    export CROSS_COMPILE=arm-linux-gnueabihf-
    export ARCH=arm
else
    export PATH=/home/koda.xu/tmp/cus_xiaomi/sourcecode/project/cus_toolchain/gcc-linaro-6.4.0-2022.05-x86_64_arm-linux-gnueabihf/bin:$PATH
    export CROSS_COMPILE=arm-linux-gnueabihf-
    export ARCH=arm
fi


if [ "$1" == "clean" ];then
    ./build_platform.sh arm_ca7 clean
    ./build_platform.sh arm_ca7_mt2 clean
else
    ./build_platform.sh arm_ca7 link
    ./build_platform.sh arm_ca7_mt2 link "-DMULTITHREAD=2 -DUSE_FORK"
fi
