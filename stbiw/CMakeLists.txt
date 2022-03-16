cmake_minimum_required(VERSION 3.12)
project(hellostbiw LANGUAGES CXX)

add_library(stbiw SHARED stb_image_write.cc)
target_include_directories(stbiw PUBLIC .)