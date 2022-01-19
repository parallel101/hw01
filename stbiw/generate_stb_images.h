#pragma once

#ifdef _MSC_VER
#ifdef stbiw_EXPORTS
#define STBIW_API __declspec(dllexport)
#else
#define STBIW_API __declspec(dllimport)
#endif
#else
#define STBIW_API
#endif

#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"

STBIW_API int call_stbi_write_png(const char *imageName, int x, int y, int comp, const void *buff, int step_bytes);

