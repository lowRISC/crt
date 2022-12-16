# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def gcc_mxe_mingw64_repos():
    compiler_repository(
        name = "gcc_mxe_mingw64_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.8-pre1/mxe-binaries-win64.tar.xz",
        sha256 = "71b3a3f04d9b7a84578ce818bd8fe2483c4e25de99f06ce221ede086c5e87ae5",
        strip_prefix = "mxe",
    )
