project(stbiw LANGUAGES CXX)

if( (CMAKE_CXX_COMPILER_ID MATCHES GNU) OR (CMAKE_CXX_COMPILER_ID MATCHES Clang) )
    add_compile_options(-Wextra -Wall -Wno-unused)
endif()
set(CMAKE_CXX_STANDARD 11)

aux_source_directory(
    ${CMAKE_CURRENT_SOURCE_DIR}
    STBIW_SRCS
)

# Build stbiw shared library
add_library(
    ${PROJECT_NAME}
    SHARED
    ${STBIW_SRCS}
)
target_include_directories(
    ${PROJECT_NAME}
    PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
)

# Build stbiw static library
add_library(
    ${PROJECT_NAME}_static
    STATIC
    ${STBIW_SRCS}
)

target_include_directories(
    ${PROJECT_NAME}_static
    PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
)
