#message(FATAL_ERROR "请修改 stbiw/CMakeLists.txt！要求生成一个名为 stbiw 的库")
#cmake_minimum_required(VERSION 3.12)
##set_target_properties(${TARGET} PROPERTIES LINKER_LANGUAGE Cxx) 

##target_add_definitions(stbiw PUBLIC STBI_WRITE_NO_STDIO = 1)
add_library(stbiw STATIC stb_image_write.cpp)
##add_library(stbiw SHARED  stb_image_write.cpp)
target_include_directories(stbiw PUBLIC .)
