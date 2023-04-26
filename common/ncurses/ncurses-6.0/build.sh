#!/bin/sh

GCC_VERSION=9.1.0
#GCC_VERSION=6.4.0

if [ "${GCC_VERSION}" = "9.1.0"  ];then
PATH=/tools/toolchain/gcc-sigmastar-9.1.0-2020.07-x86_64_arm-linux-gnueabihf/bin:$PATH
CROSS_COMPILE=arm-linux-gnueabihf-
ARCH=arm
else
PATH=/home/koda.xu/tmp/cus_xiaomi/sourcecode/project/cus_toolchain/gcc-linaro-6.4.0-2022.05-x86_64_arm-linux-gnueabihf/bin:$PATH
CROSS_COMPILE=arm-linux-gnueabihf-
ARCH=arm
fi

OUTPUT_DIR=/home/koda.xu/github_prj/common_tools/ncurses/output/${GCC_VERSION}

./configure \
    --host=arm-linux-gnueabihf \
    CPPFLAGS="-P" \
    --prefix=${OUTPUT_DIR} \
    --with-shared \
    --without-debug

make clean -j32
make -j32
make install -j32
chmod 755 ${OUTPUT_DIR}/lib/lib*
${CROSS_COMPILE}strip --strip-unneeded ${OUTPUT_DIR}/lib/lib*
chmod 755 ${OUTPUT_DIR}/bin/*
${CROSS_COMPILE}strip --strip-unneeded ${OUTPUT_DIR}/bin/*
