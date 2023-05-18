# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//rules:repo.bzl", "http_archive_or_local")

def cc65_repos(local = None):
    http_archive_or_local(
        name = "cc65_files",
        local = local,
        url = "https://github.com/lowRISC/crt/releases/download/v0.4.3/cc65-binaries.tar.xz",
        sha256 = "b180c5fd3132e1fe406c330be2754534e65d5ca2103b151865f6bd6aade81fb9",
        strip_prefix = "cc65",
        build_file = Label("//toolchains:BUILD.export_all.bazel"),
    )
