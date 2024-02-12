# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//rules:repo.bzl", "http_archive_or_local")

def cc65_repos(local = None):
    http_archive_or_local(
        name = "cc65_files",
        local = local,
        url = "https://github.com/lowRISC/crt/releases/download/v0.4.10/cc65-binaries.tar.xz",
        sha256 = "5dfc3dc8a34aff82db081831fd4939215ba698fd2e6186e869b19a2158236029",
        strip_prefix = "cc65",
        build_file = Label("//toolchains:BUILD.export_all.bazel"),
    )
