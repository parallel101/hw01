add_library(stbiw STATIC)

target_sources(stbiw
PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/stb_image_write.cpp
)

target_include_directories(stbiw
INTERFACE 
    ${CMAKE_CURRENT_SOURCE_DIR}
)