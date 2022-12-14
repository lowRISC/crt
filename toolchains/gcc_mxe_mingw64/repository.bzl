# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def gcc_mxe_mingw64_repos():
    compiler_repository(
        name = "gcc_mxe_mingw64_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.7-pre3/mxe-binaries-win64.tar.xz",
        sha256 = "97ab7f717b8d6617b31714bbc96629b2035068428ca3520ca9413215b442f9ca",
        strip_prefix = "mxe",
    )
