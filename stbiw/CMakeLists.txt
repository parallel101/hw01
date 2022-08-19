cmake_minimum_required(VERSION 3.12)
project(lib_stbiw LANGUAGES CXX)

add_library(stbiw SHARED stb_image_write.cpp)
target_include_directories(stbiw PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

# `add_definitions`添加宏定义到当前目录和子目录下的所有源文件中, 但是不会对外部的源文件产生影响
# add_definitions(-DSTB_IMAGE_WRITE_IMPLEMENTATION=1)

# 设置为 private, 避免宏被传播到所有引用它的文件中, 而导致的重定义错误
target_compile_definitions(stbiw PRIVATE -DSTB_IMAGE_WRITE_IMPLEMENTATION=1)

# 不能使用 `INTERFACE` 进行编译, 因为 `STB_IMAGE` 里用的是 `#ifdef` 而不是 `#ifndef`
# add_library(stbiw INTERFACE)
# target_include_directories(stbiw INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})

# option(STB_IMAGE_WRITE_IMPLEMENTATION "Enable stb_image_write implementation" OFF)
# if (NOT ${STB_IMAGE_WRITE_IMPLEMENTATION})
#     message(STATUS "stb_image_write is not enabled.")
# endif()
