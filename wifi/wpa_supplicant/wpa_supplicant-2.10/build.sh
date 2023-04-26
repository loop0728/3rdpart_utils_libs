#!/bin/sh

#set -x
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

LIBNL_PATH=/home/koda.xu/github_prj/wifi_libs/libnl-3/libnl-3.2.25/output/${GCC_VERSION}
LIBSSL_PATH=/home/koda.xu/github_prj/wifi_tools/openssl/output/${GCC_VERSION}
READLINE_PATH=/home/koda.xu/github_prj/common_tools/readline/output/${GCC_VERSION}
NCURSES_PATH=/home/koda.xu/github_prj/common_tools/ncurses/output/${GCC_VERSION}

cat > wpa_supplicant/.config << EOF
CONFIG_BACKEND=file
CONFIG_CTRL_IFACE=y
CONFIG_DEBUG_FILE=y
CONFIG_DEBUG_SYSLOG=y
CONFIG_DEBUG_SYSLOG_FACILITY=LOG_DAEMON
CONFIG_DRIVER_NL80211=y
CONFIG_DRIVER_WEXT=y
CONFIG_DRIVER_WIRED=y
CONFIG_EAP_GTC=y
CONFIG_EAP_LEAP=y
CONFIG_EAP_MD5=y
CONFIG_EAP_MSCHAPV2=y
CONFIG_EAP_OTP=y
CONFIG_EAP_PEAP=y
CONFIG_EAP_TLS=y
CONFIG_EAP_TTLS=y
CONFIG_IEEE8021X_EAPOL=y
CONFIG_IPV6=y
CONFIG_LIBNL32=y
CONFIG_PEERKEY=y
CONFIG_PKCS12=y
CONFIG_READLINE=y
CONFIG_SMARTCARD=y
CONFIG_WPS=y
CONFIG_MESH=y
EOF

echo "CC=${CROSS_COMPILE}gcc" >> wpa_supplicant/.config
echo "LD=${CROSS_COMPILE}ld" >> wpa_supplicant/.config
echo "CFLAGS += -I${LIBNL_PATH}/include/libnl3 -I${LIBSSL_PATH}/include -I${READLINE_PATH}/include -I${NCURSES_PATH}/include" >> wpa_supplicant/.config
echo "CFLAGS += -lnl-3 -lnl-genl-3 -lssl -lcrypto" >> wpa_supplicant/.config
echo "LIBS += -L${LIBNL_PATH}/lib -L${LIBSSL_PATH}/lib -L${READLINE_PATH}/lib -L${NCURSES_PATH}/lib" >> wpa_supplicant/.config

OUTPUT_DIR=/home/koda.xu/github_prj/wifi_tools/wpa_supplicant/output/${GCC_VERSION}
export PKG_CONFIG_PATH=${LIBNL_PATH}/lib/pkgconfig

cd wpa_supplicant && make BINDIR=${OUTPUT_DIR}/sbin LIBDIR=${OUTPUT_DIR}/lib -j32
make BINDIR=${OUTPUT_DIR}/sbin LIBDIR=${OUTPUT_DIR}/lib install -j32

chmod 755 ${OUTPUT_DIR}/sbin/*
${CROSS_COMPILE}strip --strip-unneeded ${OUTPUT_DIR}/sbin/*
