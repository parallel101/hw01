cmake_minimum_required(VERSION 3.12)

add_library(stbiw STATIC main.cpp)
target_include_directories(stbiw PUBLIC include)
