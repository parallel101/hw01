add_library(stbiw STATIC stbiw.cc)
target_compile_definitions(stbiw PRIVATE -DSTB_IMAGE_WRITE_IMPLEMENTATION)
target_include_directories(stbiw PUBLIC .)
