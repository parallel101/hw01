add_library(stbiw STATIC stbi_write_png.cpp)
target_include_directories(stbiw PUBLIC .)
