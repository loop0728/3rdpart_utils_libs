源码：
https://busybox.net/downloads/busybox-1.20.2.tar.bz2

配置：
sstar_alkaid_arm-linux-gnueabihf-glibc_defconfig

最后还需要修改：   
在下面的文件中添加头文件包含，"#include <sys/resource.h>"   
loginutils/passwd.c   
runit/chpst.c   
networking/inetd.c   
networking/ntpd.c   
shell/shell_common.c   
miscutils/time.c   

编译：
```
make sstar_alkaid_arm-linux-gnueabihf-glibc_defconfig
make clean -j16;make -j16
make install

生成_install目录
```

打包：
```
cd _install
tar -zcf _install.tar.gz .
```

若需要替换sdk中的busybox，将 `_install.tar.gz` 拷贝到 project/image/busybox/ 中再重命名即可。如重命名为：   
busybox-1.20.2-arm-linux-gnueabihf-glibc-9.1.0-dynamic.tar.gz



