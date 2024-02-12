# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//rules:repo.bzl", "http_archive_or_local")

def lowrisc_rv32imcb_repos(local = None):
    http_archive_or_local(
        name = "lowrisc_rv32imcb_files",
        local = local,
        url = "https://github.com/lowRISC/lowrisc-toolchains/releases/download/20240206-1/lowrisc-toolchain-rv32imcb-20240206-1.tar.xz",
        sha256 = "7bd480f95c9e2b1161136b2e28b45ac1eb151444b3c0ec4b6db149533da82ba2",
        strip_prefix = "lowrisc-toolchain-rv32imcb-20240206-1",
        build_file = Label("//toolchains:BUILD.export_all.bazel"),
    )
