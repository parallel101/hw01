#define STB_IMAGE_WRITE_IMPLEMENTATION
#include <stb_image_write.h>

// 头文件中包含了函数的声明和定义
// 函数声明默认展开，通过包含头文件即可获取函数的声明
// 函数定义默认不展开，通过宏控制函数定义的展开，保证函数定义只有一份
// 这个方式即保证了库header_only的形式
// 又可以将函数的声明和定义分离，方便编译成库，加速编译
