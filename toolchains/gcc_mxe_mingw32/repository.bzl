# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def gcc_mxe_mingw32_repos():
    compiler_repository(
        name = "gcc_mxe_mingw32_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.8-pre1/mxe-binaries-win32.tar.xz",
        sha256 = "ead37daf8483161f767f1068f8c6d68ca03e944486f5952134a243283a84a116",
        strip_prefix = "mxe",
    )
