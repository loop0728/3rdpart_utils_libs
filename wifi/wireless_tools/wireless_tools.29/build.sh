#!/bin/sh

#GCC_VERSION=9.1.0
GCC_VERSION=6.4.0

if [ "${GCC_VERSION}" = "9.1.0"  ];then
PATH=/tools/toolchain/gcc-sigmastar-9.1.0-2020.07-x86_64_arm-linux-gnueabihf/bin:$PATH
CROSS_COMPILE=arm-linux-gnueabihf-
ARCH=arm
else
PATH=/home/koda.xu/tmp/cus_xiaomi/sourcecode/project/cus_toolchain/gcc-linaro-6.4.0-2022.05-x86_64_arm-linux-gnueabihf/bin:$PATH
CROSS_COMPILE=arm-linux-gnueabihf-
ARCH=arm
fi

OUTPUT_DIR=/home/koda.xu/github_prj/wifi_tools/wireless_tools/output/${GCC_VERSION}

make clean -j32
make CC=${CROSS_COMPILE}gcc AR=${CROSS_COMPILE}ar LD=${CROSS_COMPILE}ld RANLIB=${CROSS_COMPILE}ranlib -j32
make PREFIX=${OUTPUT_DIR} INSTALL_MAN=${OUTPUT_DIR}/share/man  install -j32
chmod 755 ${OUTPUT_DIR}/sbin/* ${OUTPUT_DIR}/lib/*
${CROSS_COMPILE}strip --strip-unneeded ${OUTPUT_DIR}/sbin/* ${OUTPUT_DIR}/lib/*
