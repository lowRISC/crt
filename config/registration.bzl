# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//toolchains/gcc_arm_none_eabi:repository.bzl", "gcc_arm_none_eabi_repos")
load("@crt//toolchains/lowrisc_rv32imcb:repository.bzl", "lowrisc_rv32imcb_repos")
load("@crt//toolchains/gcc_mxe_mingw32:repository.bzl", "gcc_mxe_mingw32_repos")
load("@crt//toolchains/gcc_mxe_mingw64:repository.bzl", "gcc_mxe_mingw64_repos")
load("@crt//toolchains/cc65:repository.bzl", "cc65_repos")

def _maybe_archive(value):
    if type(value) == "string":
        return value
    return None

# Note: for each of the booleans in the argument list, we normally expect
# a True or False value to determine whether to register the corresponding
# toolchain.  You may, however, also pass a string which is the label or
# local path of a subdir or archive of the toolchain binaries.
# This is normally used during release testing to inject the just-built
# compilers into the configuration and check that they're functional.
def crt_register_toolchains(
        arm = False,
        m6502 = False,
        riscv32 = False,
        win32 = False,
        win64 = False):
    native.register_execution_platforms("@local_config_platform//:host")
    if arm:
        gcc_arm_none_eabi_repos(local = _maybe_archive(arm))
        native.register_execution_platforms("@crt//platforms/arm:all")
        native.register_toolchains("@crt//toolchains/gcc_arm_none_eabi:all")

    if m6502:
        cc65_repos(local = _maybe_archive(m6502))
        native.register_execution_platforms("@crt//platforms/m6502:all")
        native.register_toolchains("@crt//toolchains/cc65:all")

    if riscv32:
        lowrisc_rv32imcb_repos(local = _maybe_archive(riscv32))
        native.register_execution_platforms("@crt//platforms/riscv32:all")
        native.register_toolchains("@crt//toolchains/lowrisc_rv32imcb:all")

    if win32:
        gcc_mxe_mingw32_repos(local = _maybe_archive(win32))
        native.register_execution_platforms("@crt//platforms/x86_32:all")
        native.register_toolchains("@crt//toolchains/gcc_mxe_mingw32:all")

    if win64:
        gcc_mxe_mingw64_repos(local = _maybe_archive(win64))
        native.register_execution_platforms("@crt//platforms/x86_64:all")
        native.register_toolchains("@crt//toolchains/gcc_mxe_mingw64:all")
