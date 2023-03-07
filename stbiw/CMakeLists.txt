# message(FATAL_ERROR "请修改 stbiw/CMakeLists.txt！要求生成一个名为 stbiw 的库")
cmake_minimum_required(VERSION 3.10)

set(CMAKE_C_COMPILER "gcc")
set(CMAKE_CXX_COMPILER "g++")


aux_source_directory(NEEDED DIR_STBIW)
add_library(stbiw STATIC ${DIR_STBIW})
target_include_directories(stbiw PUBLIC .)



