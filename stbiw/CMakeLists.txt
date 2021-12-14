project(stbiw LANGUAGES CXX)
add_library(stbiw STATIC stb.cpp)
target_include_directories(stbiw PUBLIC .)
