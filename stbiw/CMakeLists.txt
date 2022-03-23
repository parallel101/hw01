# message(FATAL_ERROR "请修改 stbiw/CMakeLists.txt！要求生成一个名为 stbiw 的库")
project(stbiw LANGUAGES CXX)
add_library(stbiw STATIC stb.cpp)
target_include_directories(stbiw PUBLIC .)
