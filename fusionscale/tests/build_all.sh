#!/usr/bin/env bash
set -euo pipefail

DXC="$(pwd)/tools/dxc/bin/dxc"

"$DXC" -T cs_6_0 -E main \
    shaders/fusionscale_easu.hlsl \
    -Fo build/fusionscale_easu.dxil

"$DXC" -T cs_6_0 -E main \
    shaders/fusionscale_rcas.hlsl \
    -Fo build/fusionscale_rcas.dxil

test -s build/fusionscale_easu.dxil
test -s build/fusionscale_rcas.dxil

echo "FusionScale baseline: PASS"
echo "EASU: $(stat -c%s build/fusionscale_easu.dxil) bytes"
echo "RCAS: $(stat -c%s build/fusionscale_rcas.dxil) bytes"
