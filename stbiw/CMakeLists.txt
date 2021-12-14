project(stbiw)

set(CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS} "-Wall")

add_library(${PROJECT_NAME} STATIC
    stb_image_write.cpp
)

message("在第一次判断是否define STB_IMAGE_WRITE_IMPLEMENTATION时，函数的定义被编译器记录，之后都会因为这个宏而跳过编译，从而保证每次引入头文件时不会多次引入函数定义")