# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//rules:repo.bzl", "http_archive_or_local")

def qemu_src_repos(local = None):
    http_archive_or_local(
        name = "qemu_src",
        local = local,
        urls = [
            "https://download.qemu.org/qemu-7.0.0.tar.xz",
        ],
        sha256 = "f6b375c7951f728402798b0baabb2d86478ca53d44cedbefabbe1c46bf46f839",
        build_file = Label("//third_party/qemu:BUILD.qemu_src.bazel"),
        strip_prefix = "qemu-7.0.0",
    )

def qemu_binary_repos(local = None):
    http_archive_or_local(
        name = "qemu",
        local = local,
        url = "https://github.com/lowRISC/crt/releases/download/v0.4.9/qemu-binaries.tar.xz",
        sha256 = "97d9ed96c65a23c020822b6ba66191601e58c68633c9f1cfe2cd5285c722698b",
        build_file = Label("//third_party/qemu:BUILD.qemu.bazel"),
        strip_prefix = "qemu",
    )
