# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def cc65_repos():
    compiler_repository(
        name = "cc65_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.7-pre2/cc65-binaries.tar.xz",
        sha256 = "dfeb3eb458c1712cb6896d1484156778681d412df806fdd9a6b762f6772f989c",
        strip_prefix = "cc65",
    )
