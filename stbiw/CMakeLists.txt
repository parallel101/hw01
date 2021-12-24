project(stbiw)

add_library(stbiw SHARED lib.cpp)
target_include_directories(stbiw PUBLIC "${STBIW_INCLUDE_DIR}")
