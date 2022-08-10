# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def cc65_repos():
    compiler_repository(
        name = "cc65_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.2/cc65-binaries.tar.xz",
        sha256 = "bf746d14f12f9626560eb5333fe93ca2ead4546ca09d8d045f073a50e0073e2a",
        strip_prefix = "cc65",
    )
