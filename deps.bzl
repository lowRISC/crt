# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("//third_party/bazel:deps.bzl", "bazel_deps")

def crt_deps(
        win64_disk_image = None,
        win32_disk_image = None):
    bazel_deps()
    if win64_disk_image:
        native.bind(
            name = "win64_disk_image",
            actual = win64_disk_image,
        )
    if win32_disk_image:
        native.bind(
            name = "win32_disk_image",
            actual = win32_disk_image,
        )
