#message(FATAL_ERROR "请修改 stbiw/CMakeLists.txt！要求生成一个名为 stbiw 的库")
#By specifying INTERFACE as the second parameter to add_library, we are no longer allowed to provide source files since the library is not meant to generate any build output.
add_library(stbiw INTERFACE)
target_include_directories(stbiw INTERFACE .)
