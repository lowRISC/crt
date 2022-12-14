# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def cc65_repos():
    compiler_repository(
        name = "cc65_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.7-pre3/cc65-binaries.tar.xz",
        sha256 = "3e9d26b473f5452a9746189a5b970ffbcd7da36e5d6e5917c035cd2149f64946",
        strip_prefix = "cc65",
    )
