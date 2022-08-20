# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def lowrisc_rv32imcb_repos():
    compiler_repository(
        name = "lowrisc_rv32imcb_files",
        url = "https://github.com/lowRISC/lowrisc-toolchains/releases/download/20220524-1/lowrisc-toolchain-rv32imcb-20220524-1.tar.xz",
        sha256 = "a4579324083577a0f20cf4b03d11c6a7563265ced0ed2f7b51c3722d80fd24c4",
        strip_prefix = "lowrisc-toolchain-rv32imcb-20220524-1",
    )
