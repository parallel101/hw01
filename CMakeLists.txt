cmake_minimum_required(VERSION 3.12)
project(hellocmake LANGUAGES CXX)

if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

add_subdirectory(stbiw)

# 不能这么加, 因为函数的实现也在头文件里, 而这里有多个源文件包含了这个头文件, 这
# 样函数就会在这些文件里多次定义
# add_definitions(-DSTB_IMAGE_WRITE_IMPLEMENTATION)

add_executable(main main.cpp rainbow.cpp mandel.cpp)
target_link_libraries(main PUBLIC stbiw)
