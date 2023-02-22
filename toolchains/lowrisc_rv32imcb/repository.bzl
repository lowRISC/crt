# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//rules:repo.bzl", "http_archive_or_local")

def lowrisc_rv32imcb_repos(local = None):
    http_archive_or_local(
        name = "lowrisc_rv32imcb_files",
        local = local,
        url = "https://github.com/lowRISC/lowrisc-toolchains/releases/download/20230228-1/lowrisc-toolchain-rv32imcb-20230228-1.tar.xz",
        sha256 = "c28ad597d0a26f03513c4d9feaa6c8c536548112142b355987b6c465d072cc35",
        strip_prefix = "lowrisc-toolchain-rv32imcb-20230228-1",
        build_file = Label("//toolchains:BUILD.export_all.bazel"),
    )
