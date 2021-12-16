# message(FATAL_ERROR "请修改 stbiw/CMakeLists.txt！要求生成一个名为 stbiw 的库")
cmake_minimum_required(VERSION 3.12)
project(stbiwproj LANGUAGES CXX)
# 1. 添加 stbiw.cpp文件 作为 stbiw库的源文件
add_library(stbiw STATIC ./stbiw.cpp)
# 2. 添加 宏定义 
# 使用 PRIVATE 修饰 让 STB_IMAGE_WRITE_IMPLEMENTATION 宏定义只在当前项目中生效，不传播到main项目中
target_compile_definitions(stbiw PRIVATE -DSTB_IMAGE_WRITE_IMPLEMENTATION)
target_include_directories(stbiw PUBLIC .)
# 设计 STB_IMAGE_WRITE_IMPLEMENTATION 的原因是为了让stb_image_write.h中的内容只在
# 定义了 STB_IMAGE_WRITE_IMPLEMENTATION的项目中被展开，避免重复定义