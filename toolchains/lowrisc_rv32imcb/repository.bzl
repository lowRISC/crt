# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//rules:repo.bzl", "http_archive_or_local")

def lowrisc_rv32imcb_repos(local = None, host_arch = "x86_64"):
    sha256_by_arch = {
        "x86_64": "980e603d3bc642f9858a0e161162767f2f16170ddaa1cbae5232b9ff2f2d5088",
        "aarch64": "f041bf743f5fc41e2698649c8205745f8bd8dada05c7927804505d83bbb3c455",
    }
    http_archive_or_local(
        name = "lowrisc_rv32imcb_{}_files".format(host_arch),
        local = local,
        url = "https://github.com/lowrisc/lowrisc-toolchains/releases/download/20250303-1/lowrisc-toolchain-rv32imcb-{}-20250303-1.tar.xz".format(host_arch),
        sha256 = sha256_by_arch[host_arch],
        strip_prefix = "lowrisc-toolchain-rv32imcb-{}-20250303-1".format(host_arch),
        build_file = Label("//toolchains:BUILD.export_all.bazel"),
    )
