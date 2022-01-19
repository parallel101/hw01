cmake_minimum_required(VERSION 3.12)
project(generate_two_images LANGUAGES CXX)

if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()


add_executable(main main.cpp rainbow.cpp mandel.cpp)
target_link_libraries(main PUBLIC stbiw)
