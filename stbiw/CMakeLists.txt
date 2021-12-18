add_library(stbiw stb_image_write.h)
set_target_properties(stbiw PROPERTIES LINKER_LANGUAGE CXX)
target_compile_definitions(stbiw PRIVATE STB_IMAGE_WRITE_IMPLEMENTATION)
target_include_directories(stbiw PUBLIC .)
