#define STB_IMAGE_WRITE_IMPLEMENTATION
#ifdef _WIN32
#define STBIWDEF extern "C" __declspec(dllexport)
#endif
#include "stb_image_write.h"
