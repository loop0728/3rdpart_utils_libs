#!/bin/bash

# Name: toolchain_mkpj.sh
# Author: Peter Peng
# Ver: 0.1

set -e

ProjectDir=""

function Usage
{
    echo "usage: `basename $0` [DIR]"
    echo "Create a toolchain project."
    echo ""
}

function ProjectMkdir
{
    if [ ! -d $ProjectDir ]; then
        echo "[INFO] $ProjectDir is not exist, create it"
        mkdir -p $ProjectDir
    else
        echo "[INFO] $ProjectDir is exist"
    fi

    [ ! -d $ProjectDir/script ] && mkdir $ProjectDir/script
    [ ! -d $ProjectDir/setup ] && mkdir $ProjectDir/setup
    [ ! -d $ProjectDir/src ] && mkdir $ProjectDir/src
    [ ! -d $ProjectDir/build ] && mkdir $ProjectDir/build
    [ ! -d $ProjectDir/tool-chain ] && mkdir $ProjectDir/tool-chain

    cp toolchain_build.sh $ProjectDir/script
    cp toolchain_config.lst $ProjectDir/script
}

function SourceSetup
{
    local src=`pwd`/../source
    local dest=$PRJROOT/setup

    if [ -f $src/$BINUTILS_VERSION.tar.bz2 ]; then
        echo "[INFO] pkg: $BINUTILS_VERSION.tar.bz2 is exist, Copy it"
        cp $src/$BINUTILS_VERSION.tar.bz2 $dest
    else
        echo "[INFO] pkg: $BINUTILS_VERSION.tar.bz2 is not exist, Download it"
        cd $dest
        wget http://ftp.gnu.org/gnu/binutils/$BINUTILS_VERSION.tar.bz2
        cd - > /dev/null
    fi

    if [ "1" == "0" ];then
        if [ -f $src/$GCC_VERSION.tar.bz2 ]; then
            echo "[INFO] pkg: $GCC_VERSION.tar.bz2 is exist, Copy it"
            cp $src/$GCC_VERSION.tar.bz2 $dest
        else
            echo "[INFO] pkg: $GCC_VERSION.tar.bz2 is not exist, Download it"
            cd $dest
            wget http://ftp.gnu.org/gnu/gcc/$GCC_VERSION/$GCC_VERSION.tar.bz2
            cd - > /dev/null
        fi
    fi

    if [ -f $src/$GCC_VERSION.tar.gz ]; then
        echo "[INFO] pkg: $GCC_VERSION.tar.gz is exist, Copy it"
        cp $src/$GCC_VERSION.tar.gz $dest
    else
        echo "[INFO] pkg: $GCC_VERSION.tar.gz is not exist, Download it"
        cd $dest
        wget http://ftp.gnu.org/gnu/gcc/$GCC_VERSION/$GCC_VERSION.tar.gz
        cd - > /dev/null
    fi

    if [ -f $src/$GLIBC_VERSION.tar.bz2 ]; then
        echo "[INFO] pkg: $GLIBC_VERSION.tar.bz2 is exist, Copy it"
        cp $src/$GLIBC_VERSION.tar.bz2 $dest
    else
        echo "[INFO] pkg: $GLIBC_VERSION.tar.bz2 is not exist, Download it"
        cd $dest
        wget https://ftp.gnu.org/gnu/glibc/$GLIBC_VERSION.tar.bz2
        cd - > /dev/null
    fi

    if [ -f $src/$KERNEL_VERSION.tar.xz ]; then
        echo "[INFO] pkg: $KERNEL_VERSION.tar.xz is exist, Copy it"
        cp $src/$KERNEL_VERSION.tar.xz $dest
    else
        echo "[INFO] pkg: $KERNEL_VERSION.tar.xz is not exist, Download it"
        cd $dest
        wget https://www.kernel.org/pub/linux/kernel/v4.x/$KERNEL_VERSION.tar.xz
        cd - > /dev/null
    fi
}

#------------------------------------------------------------------------------------------
# main
#------------------------------------------------------------------------------------------

if [ $# != 1 ]; then
    Usage
    exit 1; 
fi

ProjectDir=$1
source toolchain_config.lst $ProjectDir

ProjectMkdir

SourceSetup

echo ""
tree -L 2 $ProjectDir

