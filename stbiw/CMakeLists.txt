# message(FATAL_ERROR "请修改 stbiw/CMakeLists.txt！要求生成一个名为 stbiw 的库")

cmake_minimum_required(VERSION 3.12)
project(stbiw)

add_library(${PROJECT_NAME} STATIC
    ${CMAKE_CURRENT_SOURCE_DIR}/include/stb_image_write.h
    ${CMAKE_CURRENT_SOURCE_DIR}/src/stb_image_write.cpp
)
target_include_directories(${PROJECT_NAME}
    PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include
)