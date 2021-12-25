# message(FATAL_ERROR "请修改 stbiw/CMakeLists.txt！要求生成一个名为 stbiw 的库")
add_library(stbiw STATIC stb_image_write.cpp) #生成stbiw静态库
target_include_directories(stbiw PUBLIC .)#定义stbiw的搜索路径为当前路径