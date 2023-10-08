#!/bin/bash

# Name: toolchain_build.sh
# Author: Peter Peng
# Ver: 0.1

set -e

PWD_DIR=`pwd`
ROOT_DIR=`dirname $PWD_DIR`
SETUP_DIR=$ROOT_DIR/setup
BUILD_DIR=$ROOT_DIR/build
SRC_DIR=$ROOT_DIR/src
SCRIPT_DIR=$ROOT_DIR/script

function BinutilsBuild
{
    echo "[INFO] $BINUTILS_VERSION build begin"

    if [ ! -d $SRC_DIR/$BINUTILS_VERSION ]; then
        cd $SRC_DIR
        echo "[DEBUG] $BINUTILS_VERSION: uncompress tar.bz2"
        tar -jxf $SETUP_DIR/$BINUTILS_VERSION.tar.bz2
        cd - > /dev/null
    fi

    if [ ! -d $BUILD_DIR/$BINUTILS_VERSION ]; then
        mkdir $BUILD_DIR/$BINUTILS_VERSION
    fi

    cd $BUILD_DIR/$BINUTILS_VERSION

    echo "[DEBUG] $BINUTILS_VERSION: configure"
    sh $SRC_DIR/$BINUTILS_VERSION/configure --target=$TARGET --prefix=$PREFIX --disable-nls --enable-shared

    echo "[DEBUG] $BINUTILS_VERSION: make"
    make -j32

    echo "[DEBUG] $BINUTILS_VERSION: make install"
    make install

    cd - > /dev/null

    echo "[INFO] $BINUTILS_VERSION build succeed"
}

function GCCBuild_BOOTSTRAP
{
    echo "[INFO] $GCC_VERSION build bootstrap begin"

    if [ ! -d $SRC_DIR/$GCC_VERSION ]; then
        cd $SRC_DIR
        if [ -f $SETUP_DIR/$GCC_VERSION.tar.bz2 ];then
            echo "[DEBUG] $GCC_VERSION: uncompress tar.bz2"
            tar -jxf $SETUP_DIR/$GCC_VERSION.tar.bz2
        fi
        if [ -f $SETUP_DIR/$GCC_VERSION.tar.gz ];then
            echo "[DEBUG] $GCC_VERSION: uncompress tar.gz"
            tar -zxf $SETUP_DIR/$GCC_VERSION.tar.gz
        fi
        cd $GCC_VERSION
        ./contrib/download_prerequisites
    fi

    if [ ! -d $BUILD_DIR/"$GCC_VERSION"_bootstrap ]; then
        mkdir $BUILD_DIR/"$GCC_VERSION"_bootstrap
    fi

    cd $BUILD_DIR/"$GCC_VERSION"_bootstrap

    echo "[DEBUG] $GCC_VERSION: configure"
    sh $SRC_DIR/$GCC_VERSION/configure --target=$TARGET --prefix=$PREFIX --disable-shared --disable-threads --without-headers --disable-libmudflap --enable-languages=c,c++ --disable-nls

    echo "[DEBUG] $GCC_VERSION: make all-gcc"
    make all-gcc

    echo "[DEBUG] $GCC_VERSION: make install-gcc"
    make install-gcc

    echo "[DEBUG] $GCC_VERSION: make all-target-libgcc"
    make all-target-libgcc

    echo "[DEBUG] $GCC_VERSION: make install-target-libgcc"
    make install-target-libgcc

    cd - > /dev/null

    echo "[INFO] $GCC_VERSION build bootstrap succeed"
}

function GLIBCBuild
{
    echo "[INFO] $GLIBC_VERSION build begin"

    if [ ! -d $SRC_DIR/$GLIBC_VERSION ]; then
        cd $SRC_DIR
        echo "[DEBUG] $GLIBC_VERSION: uncompress tar.bz2"
        tar -jxf $SETUP_DIR/$GLIBC_VERSION.tar.bz2
        cd - > /dev/null
    fi

    if [ ! -d $BUILD_DIR/$GLIBC_VERSION ]; then
        mkdir $BUILD_DIR/$GLIBC_VERSION
    fi

    cd $BUILD_DIR/$GLIBC_VERSION

    echo "[DEBUG] $GLIBC_VERSION: configure"
    sh $SRC_DIR/$GLIBC_VERSION/configure \
        --host=$TARGET \
        --prefix=$GLIBC_TARGET_PREFIX \
        --with-tls \
        --disable-werror \
        --disable-profile \
        --enable-add-ons \
        --with-headers=$TARGET_PREFIX/include \
        libc_cv_forced_unwind=yes \
        libc_cv_c_cleanup=yes \
        libc_cv_arm_tls=yes \
        --enable-nls

    echo "[DEBUG] $GLIBC_VERSION: make"
    make CC=$TARGET-gcc AR=$TARGET-ar RANLIB=$TARGET-ranlib -j32

    echo "[DEBUG] $GLIBC_VERSION: make install"
    make install

    cd - > /dev/null

    echo "[INFO] $GLIBC_VERSION build succeed"
}

function GCCBuild
{
    echo "[INFO] $GCC_VERSION build begin"

    if [ ! -d $BUILD_DIR/$GCC_VERSION ]; then
        mkdir $BUILD_DIR/$GCC_VERSION
    fi

    cd $BUILD_DIR/$GCC_VERSION

    echo "[DEBUG] $GCC_VERSION: configure"
    sh $SRC_DIR/$GCC_VERSION/configure \
        --target=$TARGET \
        --prefix=$PREFIX \
        --with-headers=$TARGET_PREFIX/include \
        --with-headers=$GLIBC_TARGET_PREFIX/include \
        --with-libs=$TARGET_PREFIX/lib \
        --with-libs=$GLIBC_TARGET_PREFIX/lib \
        --enable-languages=c,c++,lto \
        --enable-shared \
        --enable-nls

    echo "[DEBUG] $GCC_VERSION: make"
    make -j32

    echo "[DEBUG] $GCC_VERSION: make install"
    make install

    cd - > /dev/null

    echo "[INFO] $GCC_VERSION build succeed"
}

function InstallKernelHeaders
{
    echo "[INFO] $KERNEL_VERSION install headers begin"

    if [ ! -d $SRC_DIR/$KERNEL_VERSION ]; then
        cd $SRC_DIR
        echo "[DEBUG] $KERNEL_VERSION: uncompress tar.xz"
        tar -xf $SETUP_DIR/$KERNEL_VERSION.tar.xz
        cd - > /dev/null
    fi

    cd $SRC_DIR/$KERNEL_VERSION

    echo "[DEBUG] $KERNEL_VERSION: make headers_install"
    make ARCH=$ARCH CROSS_COMPILE=$TARGET- INSTALL_HDR_PATH=$PREFIX/$TARGET headers_install

    cd - > /dev/null

    echo "[INFO] $KERNEL_VERSION install headers succeed"
}

function display_help()
{
    echo -e "\033[1;34m"
cat >&2 <<EOF
./toolchain_build.sh [command]

    all             Build All
    binutils        Build Binutils
    kernel          Install Kernel Headers
    bootstrap       Build BOOTSTRAP
    glibc           Build GLIBC
    gcc             Build GCC

EOF
    echo -e "\033[0m"
}

function print_err()
{
    info=$1
    echo
    echo -e "\033[1;31m${info}\033[0m"
    echo
}

function main()
{
case "$1" in
    "all")
        BinutilsBuild
        InstallKernelHeaders
        GCCBuild_BOOTSTRAP
        GLIBCBuild
        GCCBuild
        ;;
    "binutils")
        BinutilsBuild
        ;;
    "kernel")
        InstallKernelHeaders
        ;;
    "bootstrap")
        GCCBuild_BOOTSTRAP
        ;;
    "glibc")
        GLIBCBuild
        ;;
    "gcc")
        GCCBuild
        ;;
    "" | "help")
        display_help
        ;;
    *)
        print_err "invalid parameters, type \"./toolchain_build.sh help\" to see available commands."
        exit -1 ;;
esac
}


#------------------------------------------------------------------------------------------
# main
#------------------------------------------------------------------------------------------

source toolchain_config.lst $ROOT_DIR

main $1
