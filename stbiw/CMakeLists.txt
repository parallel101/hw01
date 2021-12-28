#message(FATAL_ERROR "请修改 stbiw/CMakeLists.txt！要求生成一个名为 stbiw 的库")

# 添加静态库
add_library(stbiw STATIC stb_image_write.cpp)

# 规定include文件夹
target_include_directories(stbiw PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})