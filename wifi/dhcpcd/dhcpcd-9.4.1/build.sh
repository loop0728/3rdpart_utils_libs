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

OUTPUT_DIR=/home/koda.xu/github_prj/wifi_tools/dhcpcd/output/${GCC_VERSION}

./configure \
    --host=arm-linux-gnueabihf  \
    CC=${CROSS_COMPILE}gcc  \
    --prefix=${OUTPUT_DIR}                \
    --sysconfdir=${OUTPUT_DIR}/etc            \
    --libexecdir=${OUTPUT_DIR}/lib/dhcpcd \
    --dbdir=${OUTPUT_DIR}/lib/dhcpcd      \
    --runstatedir=${OUTPUT_DIR}/run           \
    --disable-privsep

make clean -j32
make -j32
make install -j32
chmod 755 ${OUTPUT_DIR}/sbin/*
${CROSS_COMPILE}strip --strip-unneeded ${OUTPUT_DIR}/sbin/*
