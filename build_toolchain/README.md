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
```

