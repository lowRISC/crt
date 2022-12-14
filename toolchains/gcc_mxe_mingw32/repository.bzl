# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def gcc_mxe_mingw32_repos():
    compiler_repository(
        name = "gcc_mxe_mingw32_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.7-pre2/mxe-binaries-win32.tar.xz",
        sha256 = "597e9b082b2fc1f4b34a5f0bd1f0422951b774d727e614b92c636d465d247aa5",
        strip_prefix = "mxe",
    )
