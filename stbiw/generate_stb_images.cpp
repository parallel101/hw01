#include "generate_stb_images.h"
#include <iostream>

int call_stbi_write_png(const char *imageName, int x, int y, int comp, const void *buff, int step_bytes){
	if(!stbi_write_png(imageName, x, y, comp, buff, step_bytes)){
		std::cout << "stbi write png images error." << std::endl;
		return 0;
	}
	std::cout << "stbi write png iamges done." << std::endl;
	return 1;
}
