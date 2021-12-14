// STB_IMAGE_WRITE_IMPLEMENTATION 类似于#pragma once头文件保护，使得stb的系列函数定义只存在一次，避免可能的重复定义错误。
// 在其他引用stbw库的项目中，include stb_image_write.h 时，就不需要define这一步了。
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"
