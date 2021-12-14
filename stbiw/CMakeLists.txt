project(stbiw)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")

add_library(${PROJECT_NAME} STATIC
    src/stb_image_write.cpp
)

target_include_directories( ${PROJECT_NAME}
    PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include
)