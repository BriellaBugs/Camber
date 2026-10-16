#!/usr/bin/env bash

set -euo pipefail

run() {
    printf '== '; printf '%q ' "$@"; echo
    "$@"
}

run ls "$1"
run lsblk -f "$1"
run sudo dd if=output/images/sdcard.img of="$1" oflag=direct status=progress bs=16M
