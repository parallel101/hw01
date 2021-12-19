# 将当前的文件生成静态库也就是.a 文件， 避免了发布代码的困难， 但是增加了生成执行程序的大小。
# 将头头文件和实现分离
# 将当前的库变成include的目录，将target_include_directories 的声明方式为PUBLIC
add_library(stbiw STATIC stb_img_write.cpp)
target_include_directories(stbiw PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})