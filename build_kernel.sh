#!/bin/bash

set -x

export ARCH=arm64
export PLATFORM_VERSION=12
export ANDROID_MAJOR_VERSION=s

export PATH="$PWD/toolchain/clang/host/linux-x86/clang-4639204/bin:$PWD/toolchain/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin:$PATH"

make ARCH=arm64 O=out CONFIG_SECTION_MISMATCH_WARN_ONLY=y exynos9610-m31nsxx_defconfig
make ARCH=arm64 O=out CONFIG_SECTION_MISMATCH_WARN_ONLY=y custom.config
make ARCH=arm64 O=out CONFIG_SECTION_MISMATCH_WARN_ONLY=y -j $(nproc)
