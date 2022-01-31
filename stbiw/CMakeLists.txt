add_library(stbiw SHARED stb_image_write.cpp)

target_compile_definitions(stbiw PRIVATE STB_IMAGE_WRITE_IMPLEMENTATION)
target_include_directories(stbiw PUBLIC .)
