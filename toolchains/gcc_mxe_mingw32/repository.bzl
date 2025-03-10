# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//rules:repo.bzl", "http_archive_or_local")

def gcc_mxe_mingw32_repos(local = None):
    http_archive_or_local(
        name = "gcc_mxe_mingw32_files",
        local = local,
        url = "https://github.com/lowRISC/crt/releases/download/v0.4.18/mxe-binaries-win32.tar.xz",
        sha256 = "22f4ac93dbda696879da7918da319ba877ee9d25daf05964c76af5181d4a5ed4",
        strip_prefix = "mxe",
        build_file = Label("//toolchains:BUILD.export_all.bazel"),
    )
