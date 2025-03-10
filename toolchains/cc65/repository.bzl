# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//rules:repo.bzl", "http_archive_or_local")

def cc65_repos(local = None):
    http_archive_or_local(
        name = "cc65_files",
        local = local,
        url = "https://github.com/lowRISC/crt/releases/download/v0.4.18/cc65-binaries.tar.xz",
        sha256 = "2213d021095499afcccaa6d8f74459081c833a6a2859403a85fcc601c26d719c",
        strip_prefix = "cc65",
        build_file = Label("//toolchains:BUILD.export_all.bazel"),
    )
