# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def gcc_mxe_mingw64_repos():
    compiler_repository(
        name = "gcc_mxe_mingw64_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.7-pre2/mxe-binaries-win64.tar.xz",
        sha256 = "9e5a3e7e315845b0c2a28439420c7e8a236389df0bee9d1a6c8a727096441336",
        strip_prefix = "mxe",
    )
