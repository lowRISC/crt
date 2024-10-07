# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//rules:repo.bzl", "http_archive_or_local")

def lowrisc_rv32imcb_repos(local = None):
    http_archive_or_local(
        name = "lowrisc_rv32imcb_files",
        local = local,
        url = "https://github.com/lowRISC/lowrisc-toolchains/releases/download/20240923-1/lowrisc-toolchain-rv32imcb-20240923-1.tar.xz",
        sha256 = "aeea1983553f4c81c6409abcf0d6ca33b5ed4716b2b694e7ff030523cf13486a",
        strip_prefix = "lowrisc-toolchain-rv32imcb-20240923-1",
        build_file = Label("//toolchains:BUILD.export_all.bazel"),
    )
