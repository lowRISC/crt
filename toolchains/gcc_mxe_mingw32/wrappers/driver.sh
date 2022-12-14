#!/bin/bash --norc
# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

PROG=${0##*/}
DRIVER_DIR=${0%/*}
MXE="gcc_mxe_mingw32_files"
VERSION="11.3.0"
PREFIX="i686-w64-mingw32.shared"
export COMPILER_PATH="external/${MXE}/libexec/gcc/${PREFIX}/${VERSION}:external/${MXE}/bin:${DRIVER_DIR}"
export LIBRARY_PATH="external/${MXE}/${PREFIX}/lib:external/${MXE}/lib/gcc/${PREFIX}/${VERSION}"

ARGS=()
POSTARGS=()
case "${PROG}" in
    gcc)
        ARGS+=("-B" "external/${MXE}/bin/${PREFIX}-")
        ;;
esac

exec "external/${MXE}/bin/${PREFIX}-${PROG}" \
    "${ARGS[@]}" \
    "$@"\
    "${POSTARGS[@]}"
