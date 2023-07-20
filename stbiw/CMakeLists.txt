# message(FATAL_ERROR "请修改 stbiw/CMakeLists.txt！要求生成一个名为 stbiw 的库")

set(SOURCES stb_config.cpp)

add_library(stbiw ${SOURCES})
target_include_directories(stbiw PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})