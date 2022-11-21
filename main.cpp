#define  STB_IMAGE_WRITE_IMPLEMENTATION
#include <stb_image_write.h>
#include "rainbow.h"
#include "mandel.h"

int main() {
    test_rainbow();
    test_mandel();
    return 0;
}
