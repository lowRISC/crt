# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//rules:repo.bzl", "http_archive_or_local")

def lowrisc_rv32imcb_repos(local = None):
    http_archive_or_local(
        name = "lowrisc_rv32imcb_files",
        local = local,
        url = "https://github.com/lowRISC/lowrisc-toolchains/releases/download/20230427-1/lowrisc-toolchain-rv32imcb-20230427-1.tar.xz",
        sha256 = "ac9d986d1d7a8edf920d3d6b14629517752b6818b8401fb3dfee78d05bf79f2f",
        strip_prefix = "lowrisc-toolchain-rv32imcb-20230427-1",
        build_file = Label("//toolchains:BUILD.export_all.bazel"),
    )
