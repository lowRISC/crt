# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//rules:repo.bzl", "http_archive_or_local")

def gcc_mxe_mingw32_repos(local = None):
    http_archive_or_local(
        name = "gcc_mxe_mingw32_files",
        local = local,
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.10/mxe-binaries-win32.tar.xz",
        sha256 = "1a96910191a5130b9e6fcb45b4ad2d1cfdb0e165502b00bcb6be76a116cf67d3",
        strip_prefix = "mxe",
        build_file = Label("//toolchains:BUILD.export_all.bazel"),
    )
