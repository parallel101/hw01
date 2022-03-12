cmake_minimum_required(VERSION 3.12)
project(stbiw LANGUAGES CXX)

# message(FATAL_ERROR "请修改 stbiw/CMakeLists.txt！要求生成一个名为 stbiw 的库")

add_library(stbiw SHARED stb_instantiate.cpp)
target_include_directories(stbiw PUBLIC .)
