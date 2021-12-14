# message(FATAL_ERROR "请修改 stbiw/CMakeLists.txt！要求生成一个名为 stbiw 的库")

aux_source_directory(. DIR_STBIW)
add_library(stbiw STATIC ${DIR_STBIW})
target_include_directories(stbiw PUBLIC .)