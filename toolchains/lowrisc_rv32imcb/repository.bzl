# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//rules:repo.bzl", "http_archive_or_local")

def lowrisc_rv32imcb_repos(local = None):
    http_archive_or_local(
        name = "lowrisc_rv32imcb_files",
        local = local,
        url = "https://github.com/lowRISC/lowrisc-toolchains/releases/download/20221129-1/lowrisc-toolchain-rv32imcb-20221129-1.tar.xz",
        sha256 = "1258433069e65da8e12fd2d697fc8d1b9d68bfc2dc20f269e58fabb2e30509f0",
        strip_prefix = "lowrisc-toolchain-rv32imcb-20221129-1",
        build_file = Label("//toolchains:BUILD.export_all.bazel"),
    )
