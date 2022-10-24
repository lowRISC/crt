#!/bin/bash --norc

PROG=${0##*/}
TOOLCHAIN="cheri_llvm_files"
VERSION="13.0.0"

ARGS=()
POSTARGS=()

exec "external/${TOOLCHAIN}/sdk/bin/${PROG}" \
    "${ARGS[@]}" \
    "$@"\
    "${POSTARGS[@]}"
