#include <cstdint>
#include <cstdio>

#define A_CPU 1
#define A_GCC 1

#include "fusionscale_a.h"

#define FSR_EASU_F 1
#include "fusionscale_fsr1.h"

int main()
{
    AU1 con0[4]{};
    AU1 con1[4]{};
    AU1 con2[4]{};
    AU1 con3[4]{};

    FsrEasuCon(
        con0,
        con1,
        con2,
        con3,
        1280.0f, 720.0f,
        1280.0f, 720.0f,
        1920.0f, 1080.0f
    );

    for (int i = 0; i < 4; ++i)
        std::printf("con0[%d] = 0x%08X\n", i, con0[i]);

    for (int i = 0; i < 4; ++i)
        std::printf("con1[%d] = 0x%08X\n", i, con1[i]);

    for (int i = 0; i < 4; ++i)
        std::printf("con2[%d] = 0x%08X\n", i, con2[i]);

    for (int i = 0; i < 4; ++i)
        std::printf("con3[%d] = 0x%08X\n", i, con3[i]);

    return 0;
}
