#include "mandel.h"
#include <stb_image_write.h>
#include <vector>
#include <complex>

void test_mandel() {
    std::vector<char> buf(512 * 512);
    for (int j = 0; j < 512; j++) {
        for (int i = 0; i < 512; i++) {
            float x = i / 512.f * 3.0f - 2.0f;
            float y = j / 512.f * 3.0f - 1.5f;
            std::complex<float> c(x, y);
            std::complex<float> z(0, 0);
            for (int steps = 0; steps < 256 / 4; steps++) {
                z = z * z + c;
                if (std::norm(z) >= 4.f) {
                    buf[j * 512 + i] = 255 - steps * 4;
                    break;
                }
            }
        }
    }
    stbi_write_png("mandel.png", 512, 512, 1, buf.data(), 0);
}
