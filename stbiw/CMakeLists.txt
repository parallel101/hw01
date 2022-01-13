cmake_minimum_required(VERSION 3.12)
project(hellostbiw LANGUAGES CXX)

add_library(stbiw STATIC stb_image_write.cpp)
target_include_directories(stbiw PUBLIC .)
