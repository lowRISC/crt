# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//rules:repo.bzl", "http_archive_or_local")

def lowrisc_rv32imcb_repos(local = None):
    http_archive_or_local(
        name = "lowrisc_rv32imcb_files",
        local = local,
        url = "https://github.com/lowRISC/lowrisc-toolchains/releases/download/20230519-1/lowrisc-toolchain-rv32imcb-20230519-1.tar.xz",
        sha256 = "08b1ba2089aa4206efdca93b7ab70152c3fe16ef4c6ee112a4f35ee3dc65aa8c",
        strip_prefix = "lowrisc-toolchain-rv32imcb-20230519-1",
        build_file = Label("//toolchains:BUILD.export_all.bazel"),
    )
