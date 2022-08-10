# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def gcc_mxe_mingw64_repos():
    compiler_repository(
        name = "gcc_mxe_mingw64_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.2/mxe-binaries.tar.xz",
        sha256 = "f435b12326ee7e65fe01113f16a95312a24ab67fbe46ed4efafce1eb1fac326a",
        strip_prefix = "mxe",
    )
