# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def cc65_repos():
    compiler_repository(
        name = "cc65_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.1/cc65-binaries.tar.xz",
        sha256 = "fcbfc70fa5d542ad4a6200680d25e6b3ceebb57765cd0bd69d354e3d5487b86e",
        strip_prefix = "cc65",
    )
