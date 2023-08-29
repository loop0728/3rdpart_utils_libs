#!/bin/sh

PATH=/home/koda.xu/tmp/cus_xiaomi/sourcecode/project/cus_toolchain/gcc-linaro-6.4.0-2022.05-x86_64_arm-linux-gnueabihf/bin:$PATH
CROSS_COMPILE=arm-linux-gnueabihf-
ARCH=arm

make clean
STATIC=1 CC=${CROSS_COMPILE}gcc CXX=${CROSS_COMPILE}g++ LD=${CROSS_COMPILE}ld  make -j32
