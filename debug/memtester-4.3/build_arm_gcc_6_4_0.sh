#!/bin/sh

PATH=/home/koda.xu/tmp/cus_xiaomi/sourcecode/project/cus_toolchain/gcc-linaro-6.4.0-2022.05-x86_64_arm-linux-gnueabihf/bin:$PATH
CROSS_COMPILE=arm-linux-gnueabihf-
ARCH=arm


# 将 cc 替换为 arm-linux-gnueabihf-gcc 但忽略包含 arm-linux- 的行
sed -i '/arm-linux-/!s/cc/arm-linux-gnueabihf-gcc/' conf-cc
sed -i '/arm-linux-/!s/cc/arm-linux-gnueabihf-gcc/' conf-ld

make clean
make -j32
