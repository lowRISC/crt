# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

def _local_archive_impl(rctx):
    if rctx.attr.build_file and rctx.attr.build_file_content:
        fail("Use only one of build_file and build_file_content.")

    rctx.extract(
        archive = rctx.attr.path,
        stripPrefix = rctx.attr.strip_prefix,
    )
    if rctx.attr.build_file:
        rctx.symlink(rctx.attr.build_file, "BUILD.bazel")
    elif rctx.attr.build_file_content:
        rctx.file("BUILD.bazel", rctx.attr.build_file_content)

local_archive = repository_rule(
    implementation = _local_archive_impl,
    attrs = {
        "path": attr.label(doc = "Local path to the archive", allow_single_file = True, mandatory = True),
        "strip_prefix": attr.string(doc = "Strip path prefixes when unarchiving"),
        "build_file": attr.label(doc = "A file to use as a BUILD file for this repository", allow_single_file = True),
        "build_file_content": attr.string(doc = "The content for the BUILD file for this repository"),
    },
)
