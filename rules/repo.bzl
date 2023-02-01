# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//rules:local_archive.bzl", "local_archive")

def _is_archive(filename):
    return (
        filename.endswith(".tar")
        or filename.endswith(".tar.gz")
        or filename.endswith(".tar.bz")
        or filename.endswith(".tar.bz2")
        or filename.endswith(".tar.xz")
        or filename.endswith(".zip")
    )


# A local repository rule which selects either local_repository or
# new_local_repository depending on the supplied arguments.
def local_repository(
        name,
        path,
        build_file=None,
        build_file_content=None,
        workspace_file=None,
        workspace_file_content=None):
    if build_file or build_file_content or workspace_file or workspace_file_content:
        native.new_local_repository(
            name = name,
            path = path,
            build_file = build_file,
            build_file_content = build_file_content,
        )
    else:
        native.local_repository(
            name = name,
            path = path,
        )


def http_archive_or_local(local = None, **kwargs):
    if local:
        build_file = kwargs.get("build_file")
        build_file_content = kwargs.get("build_file_content")
        if _is_archive(local):
            local_archive(
                name = kwargs.get("name"),
                path = local,
                strip_prefix = kwargs.get("strip_prefix"),
                build_file = build_file,
                build_file_content = build_file_content,
            )
        else:
            local_repository(
                name = kwargs.get("name"),
                path = local,
                build_file = build_file,
                build_file_content = build_file_content,
            )
    else:
        http_archive(**kwargs)
