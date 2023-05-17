# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//rules:repo.bzl", "http_archive_or_local")

def cc65_repos(local = None):
    http_archive_or_local(
        name = "cc65_files",
        local = local,
        url = "https://github.com/lowRISC/crt/releases/download/v0.4.2/cc65-binaries.tar.xz",
        sha256 = "e842a14f1adbc32b47e884b197ce1780c4c8d39d6309e6c922f1c80a85db5d50",
        strip_prefix = "cc65",
        build_file = Label("//toolchains:BUILD.export_all.bazel"),
    )
