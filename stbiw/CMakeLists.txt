project(stbiw LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)

set(INCLUDE_DIR  ${CMAKE_CURRENT_SOURCE_DIR}/include)

aux_source_directory(
    ${CMAKE_CURRENT_SOURCE_DIR}
    STBIW_SRCS
)
add_library(${PROJECT_NAME} STATIC ${STBIW_SRCS})
target_include_directories(
	${PROJECT_NAME}
	PUBLIC
	${INCLUDE_DIR}
)

