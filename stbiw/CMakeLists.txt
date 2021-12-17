#message(FATAL_ERROR "请修改 stbiw/CMakeLists.txt！要求生成一个名为 stbiw 的库")
add_library(stbiw STATIC stb_image_write.cpp) # 在需要被编译的 .cpp 中声明 头文件
target_include_directories(stbiw PUBLIC .) # 作为公开的可使用库
