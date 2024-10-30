# message(FATAL_ERROR "请修改 stbiw/CMakeLists.txt！要求生成一个名为 stbiw 的库")

add_library(stbiw STATIC stb_image_write.cpp)
target_include_directories(stbiw PUBLIC .)