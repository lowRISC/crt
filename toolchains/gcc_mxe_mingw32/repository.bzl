# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def gcc_mxe_mingw32_repos():
    compiler_repository(
        name = "gcc_mxe_mingw32_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.7-pre3/mxe-binaries-win32.tar.xz",
        sha256 = "66ffd6eab925557b9a0aa0d7e06350755744819e5a2f81d28a834414c68fff70",
        strip_prefix = "mxe",
    )
