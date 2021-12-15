# message(FATAL_ERROR "请修改 stbiw/CMakeLists.txt！要求生成一个名为 stbiw 的库")

add_library(stbiw STATIC 
        stb_image_write.cpp # 使用 ln stb_image_write.h stb_image_write.cpp 创建
)

# 添加 PRIVATE 属性, 这个编译命令就只在本次编译看得见, 所以不会有多次定义.
target_compile_options (stbiw
        PRIVATE -DSTB_IMAGE_WRITE_IMPLEMENTATION
)

target_include_directories(stbiw # 所在文件夹本来就是include_dir, 也可以不加
        PUBLIC .
)
