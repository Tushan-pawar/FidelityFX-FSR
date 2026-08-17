#!/usr/bin/env bash
set -euo pipefail

DXC="$(pwd)/tools/dxc/bin/dxc"
SHADER="$(pwd)/shaders/fusionscale_easu.hlsl"
OUTPUT="$(pwd)/build/fusionscale_easu.dxil"

"$DXC" \
    -T cs_6_0 \
    -E main \
    "$SHADER" \
    -Fo "$OUTPUT"

test -s "$OUTPUT"

echo "FusionScale EASU compilation: PASS"
echo "DXIL: $OUTPUT"
