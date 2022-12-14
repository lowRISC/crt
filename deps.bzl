# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("//third_party/bazel:deps.bzl", "bazel_deps")

def crt_deps(windows_disk_image = None):
    bazel_deps()
    if windows_disk_image:
        native.bind(
            name = "windows_disk_image",
            actual = windows_disk_image,
        )
