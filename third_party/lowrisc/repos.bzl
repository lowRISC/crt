# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def lowrisc_repos():
    maybe(
        http_archive,
        name = "lowrisc_bazel_release",
        sha256 = "1af1e4a3ab9246b4925adbfc3f00c0eba78a68c331a5c16d1a6602374a18fb59",
        strip_prefix = "bazel-release-0.0.2",
        url = "https://github.com/lowRISC/bazel-release/archive/refs/tags/v0.0.2.tar.gz",
    )
