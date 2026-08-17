
float FusionQuality(float2 uv)
{
    float2 d = uv - 0.5;
    float radius2 = dot(d, d);

    // 1.0 = full quality, 0.0 = lowest quality.
    return 1.0 - smoothstep(0.08, 0.35, radius2);
}
