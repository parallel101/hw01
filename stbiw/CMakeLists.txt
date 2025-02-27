add_library(stbiw STATIC stb_image_write.cpp)
target_include_directories(stbiw PUBLIC .)
#target_compile_definitions(stbiw PUBLIC -DSTB_IMAGE_WRITE_IMPLEMENTATION)
