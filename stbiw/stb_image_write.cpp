// 通过宏避免多个文件引用同一个头文件导致的重定义问题，因为相关函数的声明、定义都放在了 stb_image_write.h 文件中
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include <stb_image_write.h>
