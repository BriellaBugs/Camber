#!/bin/sh

set -u
set -e

# Empty mountpoint in the rootfs for the data partition
mkdir -p "${TARGET_DIR}/usr/local"

# Mount the data partition on /usr/local (idempotent)
FSTAB="${TARGET_DIR}/etc/fstab"
ENTRY="LABEL=data  /usr/local  ext4  defaults  0  2"

touch "${FSTAB}"
if ! grep -qE '^[^#]*[[:space:]]/usr/local[[:space:]]' "${FSTAB}"; then
	echo "${ENTRY}" >> "${FSTAB}"
fi
