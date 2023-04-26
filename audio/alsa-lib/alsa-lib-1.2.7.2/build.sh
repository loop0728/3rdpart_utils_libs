#!/bin/sh

#GCC_VERSION=9.1.0
GCC_VERSION=6.4.0

if [ "${GCC_VERSION}" = "9.1.0" ];then
export PATH=/tools/toolchain/gcc-sigmastar-9.1.0-2020.07-x86_64_arm-linux-gnueabihf/bin:$PATH
export CROSS_COMPILE=arm-linux-gnueabihf-
export ARCH=arm
else
export PATH=/home/koda.xu/tmp/cus_xiaomi/sourcecode/project/cus_toolchain/gcc-linaro-6.4.0-2022.05-x86_64_arm-linux-gnueabihf/bin:$PATH
export CROSS_COMPILE=arm-linux-gnueabihf-
export ARCH=arm
fi

#ALSA_INSTALL_PATH=/home/koda.xu/github_prj/alsa-lib/alsa_output/alsa-1.2.7.2/alsa_lib
ALSA_INSTALL_PATH=/home/koda.xu/github_prj/alsa-lib/output/${GCC_VERSION}
#CC=arm-linux-gnueabihf-gcc
#CXX=arm-linux-gnueabihf-g++

./configure \
    --prefix=$ALSA_INSTALL_PATH/alsa/ \
    --host=arm-linux \
    --disable-aload \
    --disable-seq \
    --disable-alisa \
    --disable-old-symbols \
    --disable-python \
    --enable-debug \
    CC=arm-linux-gnueabihf-gcc \
    CXX=arm-linux-gnueabihf-g++ \
    --with-plugindir=$ALSA_INSTALL_PATH/alsa/lib \
    --with-configdir=$ALSA_INSTALL_PATH/alsa/etc

make -j32
make install

# --host  指定编译器
# --prefix 指定编译后文件的安装路径，后续的安装命令会在改目录下创建lib和include两个目录
# --with-configdir 指定conf文件的安装目录，该目录中对我们最有用的alsa.conf，此文件会被直接移植到目标系统中
# --with-alsa-devdir 指定音频设备文件的目录，例如在/dev/snd



