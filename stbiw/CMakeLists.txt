# message(FATAL_ERROR "请修改 stbiw/CMakeLists.txt！要求生成一个名为 stbiw 的库")

# 1. 将 stb_image_write.cpp 编译成静态库
add_library(stbiw STATIC stb_image_write.cpp)

# 2. 核心：允许主程序通过 <stb_image_write.h> 找到它
# PUBLIC 表示链接 stbiw 的程序也会自动获得这个包含路径
target_include_directories(stbiw PUBLIC .)