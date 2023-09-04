#!/bin/sh

#GCC_VER=9.1.0
GCC_VER=6.4.0

if [ "${GCC_VER}" = "9.1.0" ];then
PATH=/tools/toolchain/gcc-sigmastar-9.1.0-2020.07-x86_64_arm-linux-gnueabihf/bin:$PATH
CROSS_COMPILE=arm-linux-gnueabihf-
ARCH=arm
else
PATH=/home/koda.xu/tmp/cus_xiaomi/sourcecode/project/cus_toolchain/gcc-linaro-6.4.0-2022.05-x86_64_arm-linux-gnueabihf/bin:$PATH
CROSS_COMPILE=arm-linux-gnueabihf-
ARCH=arm
fi

CC=arm-linux-gnueabihf-gcc
AR=arm-linux-gnueabihf-ar
RELEASE_DIR=$(pwd)/output/gcc_${GCC_VER}
#EXE_PREFIX=arm-linux-gnueabihf-${GCC_VER}-


echo release_dir is ${RELEASE_DIR}

./autogen.sh

./configure  \
    CC=arm-linux-gnueabihf-gcc  \
    CXX=arm-linux-gnueabihf-g++  \
    AR=arm-linux-gnueabihf-ar    \
    LD=arm-linux-gnueabihf-ld   \
    --host=arm-linux \
    --prefix=${RELEASE_DIR} \
    --without-jffs  \
    --without-ubifs \
    --without-lzo
    #--program-prefix=${EXE_PREFIX}

make -j32
make install -j32
arm-linux-gnueabihf-strip --strip-unneeded ${RELEASE_DIR}/sbin/*


