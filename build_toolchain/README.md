### prepare
```
sudo apt-get install libncurses5-dev
sudo apt-get install gperf
sudo apt-get install bison
sudo apt-get install flex
sudo apt-get install texinfo
sudo apt-get install help2man
sudo apt-get install gawk
```
### build step:
```
cd script
修改 toolchain_config.lst 设置编译平台参数和使用的源码版本
./toolchain_mkpj.sh [path/to/ganerate/toolchain]
cd [path/to/ganerate/toolchain]
./toolchain_build.sh all

注：执行toolchain_mkpj.sh会先判断build_toolchain/source目录下是否已经有下载完成的包。
如果有，就会直接拷贝到指定的toolchain目标目录下的setup目录；
如果没有，就会从脚本中的连接中下载源码包到指定的toolchain目标目录下的setup目录。
如果已经下载了源码包，可以拷贝到build_toolchain/source目录下，提高toolchain编译总耗时。
```

