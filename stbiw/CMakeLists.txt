add_library(stbiw STATIC stbiw.cpp)
#set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
target_include_directories(stbiw PUBLIC .)
#message(FATAL_ERROR "请修改 stbiw/CMakeLists.txt！要求生成一个名为 stbiw 的库")
