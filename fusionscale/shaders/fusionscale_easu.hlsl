
#define A_GPU 1
#define A_HLSL 1

Texture2D<float4> InputTexture : register(t0);
SamplerState InputSampler : register(s0);

RWTexture2D<float4> OutputTexture : register(u0);

cbuffer FsrConstants : register(b0)
{
    uint4 con0;
    uint4 con1;
    uint4 con2;
    uint4 con3;
};

cbuffer FusionConstants : register(b1)
{
    float2 OutputSize;
    float QualityStrength;
    float Padding;
};

float FusionQuality(float2 uv)
{
    float2 d = uv - 0.5;
    float radius2 = dot(d, d);

    return 1.0 - smoothstep(0.08, 0.35, radius2);
}

#include "../include/fusionscale_a.h"

#define FSR_EASU_F 1
#include "../include/fusionscale_fsr1.h"

AF4 FsrEasuRF(AF2 p)
{
    return InputTexture.GatherRed(InputSampler, p);
}

AF4 FsrEasuGF(AF2 p)
{
    return InputTexture.GatherGreen(InputSampler, p);
}

AF4 FsrEasuBF(AF2 p)
{
    return InputTexture.GatherBlue(InputSampler, p);
}

[numthreads(8, 8, 1)]
void main(uint3 dispatchThreadId : SV_DispatchThreadID)
{
    AU2 ip = AU2(dispatchThreadId.xy);

    AF3 pix;
    FsrEasuF(pix, ip, con0, con1, con2, con3);

    OutputTexture[ip] = AF4(pix.x, pix.y, pix.z, 1.0);
}
