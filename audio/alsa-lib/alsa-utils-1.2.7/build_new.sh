#!/bin/sh

#ALSA_INSTAL_PATH=/home/koda.xu/github_prj/alsa-lib/alsa_output/alsa-1.2.7.2/alsa_lib
ALSA_INSTAL_PATH=/home/koda.xu/github_prj/alsa-lib/output

./configure \
    --prefix=$ALSA_INSTAL_PATH/alsa \
    --host=arm-linux \
    --with-curses=ncurses \
    CC="arm-linux-gnueabihf-gcc -lasound -I$ALSA_INSTAL_PATH/alsa/include -L$ALSA_INSTAL_PATH/alsa/lib" \
    --disable-xmlto \
    --disable-alsamixer

make -j32
make install

# --with-alsa-inc-prefix  指定alsa-lib编译好的文件的include目录
# --with-alsa-prefix  指定alsa-lib编译好的文件的lib目录
# --disable-alsamixer  alsamixer是图形化的amixer工具，可能会出现乱码，禁用
# --with-systemdsystemunitdir  指定目录创建system目录。install时默认会在/lib目录创建system目录，非root权限时执行make install失败。
# --with-udev-rules-dir  指定生成的rules文件的目录，默认在/lib目录创建rules文件
# --with-asound-state-dir  指定生成state文件的目录，默认在/var/lib目录下创建state文件
