# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def lowrisc_repos():
    maybe(
        http_archive,
        name = "lowrisc_bazel_release",
        sha256 = "b4a6518347f4c95b218c4358e2ce946be0100ff731ccc4922cb1f8e1acc9e09d",
        strip_prefix = "bazel-release-0.0.1",
        url = "https://github.com/lowRISC/bazel-release/archive/refs/tags/v0.0.1.tar.gz",
    )
