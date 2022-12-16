# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@lowrisc_bazel_release//:repos.bzl", "lowrisc_bazel_release_repos")
load("@lowrisc_bazel_release//:deps.bzl", "lowrisc_bazel_release_deps")

def lowrisc_deps():
    lowrisc_bazel_release_repos()
    lowrisc_bazel_release_deps()
