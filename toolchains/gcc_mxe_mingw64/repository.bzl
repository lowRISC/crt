# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//rules:repo.bzl", "http_archive_or_local")

def gcc_mxe_mingw64_repos(local = None):
    http_archive_or_local(
        name = "gcc_mxe_mingw64_files",
        local = local,
        url = "https://github.com/lowRISC/crt/releases/download/v0.4.3/mxe-binaries-win64.tar.xz",
        sha256 = "c79023836666657be587ca159620c6731c51bbbde575c5608e947d7562f002fa",
        strip_prefix = "mxe",
        build_file = Label("//toolchains:BUILD.export_all.bazel"),
    )
