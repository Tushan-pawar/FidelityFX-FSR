
#define A_GPU 1
#define A_HLSL 1

#include "../include/fusionscale_a.h"

#define FSR_RCAS_F 1
#include "../include/fusionscale_fsr1.h"

Texture2D<float4> InputTexture : register(t0);
SamplerState InputSampler : register(s0);

RWTexture2D<float4> OutputTexture : register(u0);

cbuffer RcasConstants : register(b0)
{
    AU4 con;
};

AF4 FsrRcasLoadF(ASU2 p)
{
    return InputTexture.Load(int3(p, 0));
}

void FsrRcasInputF(inout AF1 r, inout AF1 g, inout AF1 b)
{
    // Baseline: no input transform.
}

[numthreads(8, 8, 1)]
void main(uint3 dispatchThreadId : SV_DispatchThreadID)
{
    AU2 ip = AU2(dispatchThreadId.xy);

    AF1 pixR;
    AF1 pixG;
    AF1 pixB;

    FsrRcasF(
        pixR,
        pixG,
        pixB,
        ip,
        con
    );

    OutputTexture[ip] = AF4(pixR, pixG, pixB, 1.0);
}
