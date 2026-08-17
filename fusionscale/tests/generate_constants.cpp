#include <cstdint>
#include <cstdio>
#include <fstream>

#define A_CPU 1
#define A_GCC 1

#include "fusionscale_a.h"

#include "fusionscale_fsr1.h"

int main()
{
    AU1 con0[4]{};
    AU1 con1[4]{};
    AU1 con2[4]{};
    AU1 con3[4]{};

    FsrEasuCon(
        con0, con1, con2, con3,
        1280.0f, 720.0f,
        1280.0f, 720.0f,
        1920.0f, 1080.0f
    );

    std::ofstream out("build/easu_constants.bin", std::ios::binary);

    if (!out)
    {
        std::fprintf(stderr, "Failed to create constants file\n");
        return 1;
    }

    out.write(reinterpret_cast<const char*>(con0), sizeof(con0));
    out.write(reinterpret_cast<const char*>(con1), sizeof(con1));
    out.write(reinterpret_cast<const char*>(con2), sizeof(con2));
    out.write(reinterpret_cast<const char*>(con3), sizeof(con3));

    if (!out)
    {
        std::fprintf(stderr, "Failed while writing constants\n");
        return 1;
    }

    std::printf("Generated EASU constants: build/easu_constants.bin\n");
    return 0;
}
