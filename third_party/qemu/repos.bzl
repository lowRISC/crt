# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def qemu_src_repos():
    http_archive(
        name = "qemu_src",
        urls = [
            "https://download.qemu.org/qemu-7.0.0.tar.xz",
        ],
        sha256 = "f6b375c7951f728402798b0baabb2d86478ca53d44cedbefabbe1c46bf46f839",
        build_file = Label("//third_party/qemu:BUILD.qemu_src.bazel"),
        strip_prefix = "qemu-7.0.0",
    )

def qemu_binary_repos():
    http_archive(
        name = "qemu",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.7-pre2/qemu-binaries.tar.xz",
        sha256 = "f80d708c3d34f2a9133b9ada6ac04437af06cf539f3d5ed249a367865dcbab58",
        build_file = Label("//third_party/qemu:BUILD.qemu.bazel"),
        strip_prefix = "qemu",
    )
