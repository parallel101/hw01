# 答案及解释

问题的核心在于，`main.cpp` 中调用了 `mandel.cpp` 中的一个函数和 `rainbow.cpp` 中定义的一个函数，而这两个函数又调用了子文件夹 `stbiw` 里的头文件 `stb_image_write.h` 中定义的函数 `stbi_write_png(...)`。而 `stb_image_write.h` 为了方便用户使用，把所有内容都集成到了一个头文件，然后巧妙的用是否定义了 `STB_IMAGE_WRITE_IMPLEMENTATION` 宏 作为开关来分开头文件中所有的函数声明部分和函数定义部分。这个开关默认是关闭的。所以所有引用了该头文件的 cpp 都只获得了函数的声明，而没有函数的定义。所以解决方案的核心就在于，如何只让这些函数定义只被编译一次（因为如果被编译多次会出现函数重复定义的LNK错误），也就是如何只让 `STB_IMAGE_WRITE_IMPLEMENTATION` 这个开关被打开一次。

当然可以在任意一个（且仅一个） cpp 中，也就是任意一个 translation unit 中 `#define STB_IMAGE_WRITE_IMPLEMENTATION`。但是这样就没有体现出来库的设计美学。

## 方法1

在 `stbiw` 子文件夹中创建一个 cpp，在里面打开开关之后，引用头文件。定义该子文件夹的编译规则为，由该 cpp 生成一个静态库，把当前文件夹作为 `include_directories` PUBLC 传播出去。

这里，在 cpp 中使用 <> 去引入头文件是更符合设计范式的，因为可以避免引入了用户自定义的同名头文件。

代码在 [`main`](https://github.com/RodenLuo/hw01) 分支中

## 方法2

继承方法1，但是通过flag来打开开关。

在库中创建一个 cpp ，只引入头文件，不打开开关。在 `CMakeLists.txt` 中，使用编译的flag。作业的说明中说了，不能使用下面这个。

```cmake
target_compile_definitions(stbiw PUBLIC -DSTB_IMAGE_WRITE_IMPLEMENTATION)
```

是因为这个 PUBLIC 会把这个 flag 传播到链接了这个库的 `main` 上，而 `main` 的依赖项中有两个都引入了这个库的头文件，会导致重复定义。

把 `PUBLIC` 改成 `PRIVATE` 即可。

不可以用 `INTERFACE`，因为会传播出去从而导致重复定义。

> INTERFACE 可以指定只给链接该库的 exe，而不给库本身的 flag。[来源](https://github.com/parallel101/hw01/pull/3#pullrequestreview-831605662)

代码在 [`solution2`](https://github.com/RodenLuo/hw01/tree/solution2) 分支中


---

需要新建一个 cpp 文件显得有点鸡肋，又探索了一下能不能不建立这个 cpp

---

## 方法3

尝试了一下让库只依赖于头文件 `add_library(stbiw STATIC stb_image_write.h)`。

此时报错 

```bash
CMake Error: CMake can not determine linker language for target: stbiw
```

添加了 `project(stbiwLib LANGUAGES CXX)` 依然不行


根据[这里](http://mariobadr.com/creating-a-header-only-library-with-cmake.html)，尝试了 `INTERFACE` , 遇到的问题是，此时没有办法定义 PRIVATE 的flag，所以这条路并没有走通。


代码在 [`no_cpp`](https://github.com/RodenLuo/hw01/tree/no_cpp) 分支中

---

静态库会把函数定义拷贝到主程序中，而当库中的函数会被多个程序使用时，可以使用动态库，在程序中只提供被调函数的入口，以及动态库的位置，而不拷贝整个程序。这样会节省硬盘（和内存？），但会让程序稍慢（找寻和调用函数需要时间）。下面提供动态库的方法

---

## 方法4

直接把 `方法1` 里的 `PUBLIC` 改成 `SHARED` 即可在 Ubuntu 中运行。`ldd` 检测到相应的动态库

```bash
$ ldd build/main
        linux-vdso.so.1 (0x00007fffcf7a8000)
        libstbiw.so => /mnt/d/parallel101/hw01/build/stbiw/libstbiw.so (0x00007fc3bb7ef000)
        libstdc++.so.6 => /lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007fc3bb600000)
        libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007fc3bb5e0000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007fc3bb3e0000)
        libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007fc3bb291000)
        /lib64/ld-linux-x86-64.so.2 (0x00007fc3bb810000)
```

该方法在 Windows 下会报错

```bash
LINK : fatal error LNK1104: cannot open file 'stbiw\Debug\stbiw.lib' [D:\parallel101\hw01\build\main.vcxproj]
```

使用这里的[方法](https://github.com/parallel101/hw01/pull/2#discussion_r768381699)可以解决。如果使用了 `set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)` ，就并不需要 `__declspec(dllexport)` 了。

但是此时，需要把 `build\stbiw\Debug\stbiw.dll` 拷贝到 `build\Debug` 里，或者添加那个 dll 文件所在文件夹到 PATH 环境变量中，才能运行 `main.exe`。


代码在 [`dynamic-link`](https://github.com/RodenLuo/hw01/tree/dynamic-link) 分支中


## 方法5

同 方法4 ，但是使用 `__declspec(dllexport)` 和 `__declspec(dllimport)`。我在头文件的函数声明中，添加了import，在头文件的函数定义中，添加了export。代码在这个 [commit:f8c73f8](https://github.com/RodenLuo/hw01/commit/f8c73f883bdc8366f4171ed5e450f45a4eccecb3) 中。


warning
```bash
D:\parallel101\hw01\stbiw\stb_image_write.h(1216,1): warning C4273: 'stbi_write_png': inconsistent dll linkage [D:\parallel101 
\hw01\build\stbiw\stbiw.vcxproj]
```

但是可以运行

```bash
$env:PATH += ";build\stbiw\Debug"
.\build\Debug\main.exe
```

Warning 可能是说我在同一个文件中，即 export 了，又 import 了。只在头文件的声明那里，添加 export 即可。且可成功编译和运行。也就是说，并不需要 “在使用该函数的地方声明则要改成 import [参考](https://github.com/parallel101/hw01/pull/3#pullrequestreview-831605662)”。代码在 [commit:cb0cae4](https://github.com/RodenLuo/hw01/commit/cb0cae419874c8e9b1d043f499edffdb1c4b8cb4)

根据提示"PRIVATE 指定只给该库本身，而不给该库的 exe 的 flag；INTERFACE 可以指定只给链接该库的 exe，而不给库本身的 flag"。所以如果有这个需求的话，可以参照[这里](https://stackoverflow.com/questions/2592523/about-inconsistent-dll-linkage)定义一个宏，来解决这个问题。

```cmake
add_library(stbiw SHARED stbiw.cpp)

if (WIN32)
    target_compile_definitions(stbiw PUBLIC -D_WIN_EXPORT)
    target_compile_definitions(stbiw INTERFACE -D_IMPORTCTRLS)
endif()

target_include_directories(stbiw PUBLIC .)
```

```c++
#ifdef _WIN_EXPORT
#ifdef _IMPORTCTRLS 
   #define _DLL_EXPORT __declspec(dllimport) 
#else 
   #define _DLL_EXPORT  __declspec(dllexport) 
#endif 
#else
   #define _DLL_EXPORT
#endif

#ifndef STBI_WRITE_NO_STDIO
STBIWDEF _DLL_EXPORT int stbi_write_png(...)
```

上述逻辑是，放置一个开关 `_DLL_EXPORT` ，如果不是 Win , 这个开关就什么都不做。如果是 Win , 如果是在编译库，就设置成 export ，如果是在编译调用了这个库的其他 target ，就设置成 import。

如前所述，删掉这行，`target_compile_definitions(stbiw INTERFACE -D_IMPORTCTRLS)` ，只在编译库的时候，启动 export 也是可以的。也很好理解，只要生成了 lib 文件，就可以进行链接了。并不理解为什么会有需要定义 import 的情况。

代码在 [`dllexport`](https://github.com/RodenLuo/hw01/tree/dllexport) 分支中


# 一些体会

## `""` vs `<>`
一直没有太理解把引用头文件时的 `""` 改成 `<>` 到底是谁起了作用。实验了一下。如果只在根目录下`add_subdirectory(stbiw)`，而不`target_link_libraries(main PUBLIC stbiw)`，
子目录下的`target_include_directories(stbiw PUBLIC .)`中的PUBLIC是没有传播到根目录下的target里面的。也就是说，`add_subdirectory(stbiw)`只是说去编译子文件中的内容，没有其他效果。

`target_include_directories(stbiw PUBLIC .)`有两个作用，第一个是在编译当前这个 `stbiw` target的时候，把 `.` 作为了 `include_directories`，所以就可以在 `stbiw/stbiw.cpp` 中使用 `<>`；第二个是向外 PUBLIC 传播，所以通过 `target_link_libraries(main PUBLIC stbiw)` 这句话，`main` 这个target，就可以不仅链接到 `stbiw` 库，同时还感染了这个库的 PUBLIC 的 `include_directories`，所以在 `rainbow.cpp` 中，也可以使用 `<>` 来引用了。

## 跨平台

在 Windows 下编译之后，会生成 Visual Studio 的 .sln 文件。然而在 Ubuntu 下的 g++ 没有生成什么 IDE 的文件。 Mac 下的 AppleClang++ 居然也没有生成 Xcode 项目文件。空了再查查。


# 高性能并行编程与优化 - 第01讲的回家作业

通过 pull request 提交作业。会批分数，但是：

没有结业证书，回家作业仅仅作为评估学习效果和巩固知识的手段，不必为分数感到紧张 :)
量力而行，只要能在本课中，学到昨天的自己不懂的知识，就是胜利，没必要和别人攀比。

- 课件：https://github.com/parallel101/course
- 录播：https://space.bilibili.com/263032155

作业提交时间不限 :) 即使完结了还想交的话我也会看的~ 不过最好在下一讲开播前完成。

- 如何开 pull request：https://zhuanlan.zhihu.com/p/51199833
- 如何设置 https 代理：https://www.jianshu.com/p/b481d2a42274

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

## 采分点提示

像这样：
```cmake
target_compile_definitions(stbiw PUBLIC -DSTB_IMAGE_WRITE_IMPLEMENTATION)
```
是不行的，因为 mandel.cpp 和 rainbow.cpp 两个文件都 include 了 stb_image_write.h，
这样同一个函数会被定义两遍！
