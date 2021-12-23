#message(FATAL_ERROR "请修改 stbiw/CMakeLists.txt！要求生成一个名为 stbiw 的库")
#By specifying INTERFACE as the second parameter to add_library, we are no longer allowed to provide source files since the library is not meant to generate any build output.
add_library(stbiw INTERFACE)
target_include_directories(stbiw INTERFACE .)


# header-only 的设计是为了使得依赖比较方便吧？直接包头文件就行，虽然确实拖慢了编译速度。而且每个头文件是一个功能，很好的解耦，不需要引入无需引入的功能。