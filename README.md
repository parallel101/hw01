# 高性能并行编程与优化 - 第01讲的回家作业
## Debug心得体会

在homework1中，我用的是window来测试的。 

打开在build目录中生成的hellocmake.sln，我分别用debug mode和release mode跑了一遍，最后出来了像这样的图片。



## 作业要求

在 main.cpp 中为了导出两个"美好的图像"，使用了 `stb_image_write.h` 这个头文件。
他在 CMakeLists.txt 中也引用了 stbiw 这个库，然而这个库还没有被定义。

你的任务就是 **定义 stbiw 这个库**，他的内容应该包含 `stbi_write_png()` 的实现，
以及允许通过尖括号导入头文件 `<stb_image_write.h>`。

运用上课所学知识，尽量不修改 main.cpp 的内容，只修改 stbiw 子目录下的内容，
完成任务。最好以子模块 + 库的形式，实在不行的话直接改 main.cpp 也可以。

运行成功后，应该会在主程序同目录发现两个"美好的图像"：mandel.png 和 rainbow.png

## 参考信息

stb_image_write.h 原仓库地址: https://github.com/nothings/stb

你需要在一个且仅一个 .cpp 文件定义了 `STB_IMAGE_WRITE_IMPLEMENTATION` 这个宏，
才能决定让 stbi 系列函数在这里实现。

如果你不仅完成了作业，还能解释清楚为什么 stbi 必须要这样设计，可能会给你满分！
