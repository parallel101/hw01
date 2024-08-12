#message(FATAL_ERROR "请修改 stbiw/CMakeLists.txt！要求生成一个名为 stbiw 的库")

add_library(stbiw STATIC stb_image_write.cpp)
#放入目录，这里头文件不必再引入，已经在cpp中链接

target_include_directories(stbiw PUBLIC .)
#这里private就不可以咯，感觉我对public，private理解不深，小彭老师可以介绍下吗
