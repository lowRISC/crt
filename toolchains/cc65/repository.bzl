# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def cc65_repos():
    compiler_repository(
        name = "cc65_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.8-pre1/cc65-binaries.tar.xz",
        sha256 = "2bcd6e16dcdfe8c1acbb6fc2373be8463a9480b34d4806357e04bb9f0d5566fc",
        strip_prefix = "cc65",
    )
