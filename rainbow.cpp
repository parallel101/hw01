#include "rainbow.h"
#include <stb_image_write.h>
#include <vector>

void test_rainbow() {
    std::vector<char> buf(512 * 512 * 3);
    for (int j = 0; j < 512; j++) {
        for (int i = 0; i < 512; i++) {
            buf[(j * 512 + i) * 3 + 0] = i / 2;
            buf[(j * 512 + i) * 3 + 1] = j / 2;
            buf[(j * 512 + i) * 3 + 2] = 0;
        }
    }
    stbi_write_png("rainbow.png", 512, 512, 3, buf.data(), 0);
}
