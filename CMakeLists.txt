cmake_minimum_required(VERSION 3.12)
project(hellocmake LANGUAGES CXX)

add_subdirectory(stbiw)

add_executable(main main.cpp)
target_link_libraries(main PUBLIC stbiw)
