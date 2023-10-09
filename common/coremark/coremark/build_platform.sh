#!/bin/sh

echo "platform: " $1
PORT_DIR=port/linux_$1 OUTNAME=coremark-$1 XCFLAGS=$3 make $2
