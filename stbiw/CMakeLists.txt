# message(FATAL_ERROR "请修改 stbiw/CMakeLists.txt！要求生成一个名为 stbiw 的库")
string(REGEX REPLACE ".+/(.+)$" "\\1" matchesOut ${CMAKE_CURRENT_SOURCE_DIR})
message(STATUS "--------------")
message(STATUS "Build Library: ${matchesOut}")
message(STATUS "--------------")

set(subPorjectName ${matchesOut})

aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR}/ sourceFiles)

add_library(${subPorjectName} SHARED ${sourceFiles})
target_include_directories(${subPorjectName} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})