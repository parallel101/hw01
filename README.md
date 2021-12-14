# hw01

第01讲的回家作业

# 要求

在 main.cpp 中为了导出一个美好的图像，使用了 `stb_image_write.h` 这个头文件。

在 CMakeLists.txt 中也引用了 stbiw 这个库，然而这个库还没有被定义。
你的任务就是定义 stbiw 这个库，他的内容应该包含 stbi_write_png 的实现。

最好以子模块 + 库的形式，实在搞不定的话同一个目录下 include 也可以。但是分数会低。

# 参考

stb_image_write.h 下载地址: https://github.com/nothings/stb/blob/master/stb_image_write.h

你需要一个 .cpp 文件定义了 STB_IMAGE_WRITE_IMPLEMENTATION 这个宏，才能决定让 stbi 系列函数在这里实现。

像这样：
```cmake
target_compile_definitions(stbiw PUBLIC -DSTB_IMAGE_WRITE_IMPLEMENTATION)
```
是不行的，因为如果两个 .cpp 文件都 include 了 stb_image_write.h，那么同一个函数会被定义两遍！
