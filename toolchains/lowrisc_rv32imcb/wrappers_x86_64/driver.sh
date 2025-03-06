#!/bin/bash --norc
# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

PROG=${0##*/}
TOOLCHAIN="lowrisc_rv32imcb_x86_64_files"
PREFIX="riscv32-unknown-elf"

ARGS=()
POSTARGS=()

exec "external/${TOOLCHAIN}/bin/${PREFIX}-${PROG}" \
    "${ARGS[@]}" \
    "$@"\
    "${POSTARGS[@]}"
