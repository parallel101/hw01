cmake_minimum_required(VERSION 3.12)

project(stbiw)

add_library(stbiw stb_image_write.cpp)

target_include_directories(stbiw INTERFACE .)
