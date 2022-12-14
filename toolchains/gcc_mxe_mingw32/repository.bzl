# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def gcc_mxe_mingw32_repos():
    compiler_repository(
        name = "gcc_mxe_mingw32_files",
        archive = Label("//prebuilt:mxe-binaries-win32.tar.xz"),
        #url = "https://github.com/lowRISC/crt/releases/download/v0.3.6/mxe-binaries-win32.tar.xz",
        #sha256 = "98a352e7909a154af54f2581fc117e5fe3f4837c6ab20d18fe697bc007dc6017",
        strip_prefix = "mxe",
    )
