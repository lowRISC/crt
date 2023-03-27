# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//rules:repo.bzl", "http_archive_or_local")

def cc65_repos(local = None):
    http_archive_or_local(
        name = "cc65_files",
        local = local,
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.10/cc65-binaries.tar.xz",
        sha256 = "82241ccf53a593cca26abf2093077a1e27da21312c013b902cc2aa524950a8ae",
        strip_prefix = "cc65",
        build_file = Label("//toolchains:BUILD.export_all.bazel"),
    )
