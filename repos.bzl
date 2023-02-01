# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("//third_party/bazel:repos.bzl", "bazel_repos")
load("//third_party/qemu:repos.bzl", "qemu_binary_repos")

def crt_repos(qemu_binaries = None):
    bazel_repos()
    qemu_binary_repos(local = qemu_binaries)
