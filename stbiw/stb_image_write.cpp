#ifndef STB_IMAGE_WRITE_IMPLEMENTATION
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"
#endif

/*
    ifndef防止重复引入头文件
    #define 定义库的实现

   在CMakeLists.txt添加静态库
   使用target_include_directories将该库的包含在依赖的目录中，以使用<>访问

*/