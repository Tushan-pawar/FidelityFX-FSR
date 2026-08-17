
#include <cmath>
#include <cstdio>

static float FusionQuality(float u, float v)
{
    float dx = u - 0.5f;
    float dy = v - 0.5f;
    float r2 = dx * dx + dy * dy;

    float t = (r2 - 0.08f) / (0.35f - 0.08f);
    t = t < 0.0f ? 0.0f : (t > 1.0f ? 1.0f : t);

    t = t * t * (3.0f - 2.0f * t);

    return 1.0f - t;
}

int main()
{
    const float points[][2] =
    {
        {0.50f, 0.50f},
        {0.50f, 0.25f},
        {0.10f, 0.10f},
        {0.90f, 0.90f}
    };

    for (const auto& p : points)
    {
        std::printf(
            "uv=(%.2f, %.2f) quality=%.6f\n",
            p[0], p[1], FusionQuality(p[0], p[1])
        );
    }

    return 0;
}
