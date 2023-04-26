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

EXE_PREFIX=arm-linux-gnueabihf-${GCC_VER}-
CC=arm-linux-gnueabihf-gcc
AR=arm-linux-gnueabihf-ar
RELEAE_DIR=/home/koda.xu/github_prj/debug_tools/gdb/output/gdb-9.1/gcc_${GCC_VER}


echo exe_prefix is ${EXE_PREFIX}

/home/koda.xu/github_prj/debug_tools/gdb/gdb-9.1/configure  \
    CC=arm-linux-gnueabihf-gcc  \
    CXX=arm-linux-gnueabihf-g++  \
    AR=arm-linux-gnueabihf-ar    \
    LD=arm-linux-gnueabihf-ld   \
    --host=arm-linux \
    --prefix=${RELEAE_DIR}    \
    --program-prefix=${EXE_PREFIX}

make -j32
make install -j32
arm-linux-gnueabihf-strip --strip-unneeded ${RELEAE_DIR}/bin/*


