project(stbiw LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)

# Build stbiw shared library
add_library(
    ${PROJECT_NAME}
    SHARED
    src/stb_image_write.cpp
)
target_include_directories(
    ${PROJECT_NAME}
    PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

# Build stbiw static library
add_library(
    ${PROJECT_NAME}_static
    STATIC
    src/stb_image_write.cpp
)

target_include_directories(
    ${PROJECT_NAME}_static
    PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

if( (CMAKE_CXX_COMPILER_ID MATCHES GNU) OR (CMAKE_CXX_COMPILER_ID MATCHES Clang) )
    target_compile_options(${PROJECT_NAME} PRIVATE -Wextra -Wall -Wno-unused)
endif()
