cmake_minimum_required(VERSION 3.27)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
project(hellocmake LANGUAGES CXX)

if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

add_subdirectory(stbiw)

add_executable(main main.cpp rainbow.cpp mandel.cpp)
target_link_libraries(main PUBLIC stbiw)
