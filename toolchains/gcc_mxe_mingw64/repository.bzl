# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def gcc_mxe_mingw64_repos():
    compiler_repository(
        name = "gcc_mxe_mingw64_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.1/mxe-binaries.tar.xz",
        sha256 = "4140f25c8f010ad6cbad63147cc41aa6a0517fd686266ea1c8f0468896f305b6",
        strip_prefix = "mxe",
    )
