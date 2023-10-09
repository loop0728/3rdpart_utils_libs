### 编译说明：   
如果要创建新的平台对应的工具，需要做如下操作：   
1. 在 port 目录下创建新的目录；   
2. 在 build.sh 脚本中添加依赖的 toolchain；   
3. 在 build.sh 脚本中的if语句内添加类似下面的语句：   
```
if [ "$1" == "clean" ];then
    …
    ./build_platform.sh XXX_YYY clean       // add line
else
    …
    ./build_platform.sh XXX_YYY link        // add line
fi
```

添加完成后，修改 build.sh 和 build_platform.sh 脚本的执行权限。   
执行 `./build.sh` 即可生成对应的coremark工具;   
执行 `./build.sh clean` 即可清除前面生成的工具文件。   

编译工具完成后，拷贝到目标测试平台，直接运行即可。   

### 在分析coremark测试结果时，可以注意以下几点：
1. CoreMark分数是最重要的指标，用于比较不同处理器或系统的相对性能。较高的分数表示更好的性能。   
2. 运行时间可以用来评估处理器在完成整个测试时所需的时间。较短的运行时间表示处理器执行测试工作负载的速度更快。   
3. CPU频率和缓存大小是硬件指标，可以帮助理解CoreMark分数背后的硬件环境。较高的CPU频率和较大的缓存通常有助于提高性能。   




