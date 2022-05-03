add_library(stbiw STATIC use.cpp)
set_target_properties(stbiw PROPERTIES LINKER_LANGUAGE CXX)
target_include_directories(stbiw PUBLIC .)
