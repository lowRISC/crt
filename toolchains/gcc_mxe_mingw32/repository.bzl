# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//rules:repo.bzl", "http_archive_or_local")

def gcc_mxe_mingw32_repos(local = None):
    http_archive_or_local(
        name = "gcc_mxe_mingw32_files",
        local = local,
        url = "https://github.com/lowRISC/crt/releases/download/v0.4.10/mxe-binaries-win32.tar.xz",
        sha256 = "4d72cb9f72567340bf663bc8b7030b847fd5544d77ebff8b5acb5f7df7b23c00",
        strip_prefix = "mxe",
        build_file = Label("//toolchains:BUILD.export_all.bazel"),
    )
