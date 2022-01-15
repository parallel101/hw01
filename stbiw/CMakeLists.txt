#message(FATAL_ERROR "请修改 stbiw/CMakeLists.txt！要求生成一个名为 stbiw 的库")
add_library(stbiw INTERFACE)
target_include_directories(stbiw INTERFACE ./)
#target_compile_definitions(stbiw INTERFACE STB_IMAGE_WRITE_IMPLEMENTATION=)