cmake_minimum_required(VERSION 3.12)
project(stbiw CXX)

if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

add_library(stbiw SHARED generate_stb_images.cpp)
target_include_directories(stbiw PUBLIC .)
