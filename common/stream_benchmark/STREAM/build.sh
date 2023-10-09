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

OUTPUT_DIR=${PWD}/../output/${GCC_VERSION}

mkdir -p ${OUTPUT_DIR}

output=stream

#make OUTPUT_TARGET=${output} clean -j4
#rm ${OUTPUT_DIR}/${output}

if [ "$1" != "clean" ]; then
    make CC=${CROSS_COMPILE}gcc OUTPUT_TARGET=${output} -j4
    ${CROSS_COMPILE}strip --strip-unneeded ${output}
    mv ${output} ${OUTPUT_DIR}
else
    make OUTPUT_TARGET=${output} clean -j4
    rm ${OUTPUT_DIR}/${output}
fi





