#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

set -euo pipefail

make rpi-firmware-dirclean
#make linux-dirclean
#make pi-infotainment-dirclean

make camber_rpi3_defconfig

make all
