# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@rules_cc//cc:find_cc_toolchain.bzl", "find_cc_toolchain")
load("//config:execution.bzl", "ExecConfigInfo")
load("//rules:transition.bzl", "platform_rule")

BATCH_TEMPLATE = """
{windows_binary} >COM1 2>COM2
echo %ERRORLEVEL% >COM3
{shutdown}
"""

# FIXME: deal with ctx.attr.binary and exec_config.program better.
# Make sure throw errors if they're multiple files.
def _platform_runner_impl(ctx):
    cc_toolchain = find_cc_toolchain(ctx)
    exec_config = ctx.attr.exec_config[ExecConfigInfo]
    program = exec_config.program[DefaultInfo].files.to_list()[0]
    binary = ctx.attr.binary[DefaultInfo].files.to_list()[0]

    subst = dict(exec_config.substitutions)
    subst.update(ctx.attr.substitutions)
    subst["binary"] = binary.short_path
    subst["windows_binary"] = binary.short_path.replace("/", "\\")

    runfiles = [program, binary]
    if exec_config.preparation == "windows":
        subst["disk_image_snapshot"] = "/tmp/qemu.{}.img.$$".format(ctx.attr.name)
        batch = ctx.actions.declare_file("__test__.bat")
        ctx.actions.write(batch, BATCH_TEMPLATE.format(**subst))
        runfiles.append(batch)

    params = []
    exclude_external = "false"
    for p in exec_config.params:
        if "exclude_external" in p:
            exclude_external = "true"
        params.append(p.format(**subst))

    out_file = ctx.actions.declare_file(ctx.label.name + ".bash")
    ctx.actions.expand_template(
        template = ctx.file._runner,
        output = out_file,
        substitutions = {
            "@ARGS@": " ".join(params),
            "@EMULATOR@": program.short_path,
            "@EXCLUDE_EXTERNAL@": exclude_external,
            "@DISK_IMAGE@": subst.get("disk_image", ""),
            "@DISK_IMAGE_SNAPSHOT@": subst.get("disk_image_snapshot", ""),
            "@QUICK_KILL@": subst.get("quick_kill", "false"),
            "@STDOUT@": subst.get("stdout", ""),
            "@STDERR@": subst.get("stderr", ""),
            "@EXITCODE@": subst.get("exitcode", ""),
        },
        is_executable = True,
    )

    runfiles = ctx.runfiles(files = runfiles + exec_config.data, transitive_files = cc_toolchain.all_files)
    runfiles = runfiles.merge(exec_config.program[DefaultInfo].data_runfiles)
    runfiles = runfiles.merge(ctx.attr.binary[DefaultInfo].data_runfiles)
    return DefaultInfo(
        files = depset([out_file]),
        runfiles = runfiles,
        executable = out_file,
    )

platform_runner = platform_rule(
    implementation = _platform_runner_impl,
    attrs = {
        "binary": attr.label(doc = "Program to execute"),
        "exec_config": attr.label(mandatory = True, providers = [ExecConfigInfo], doc = "Execution configuration"),
        "substitutions": attr.string_dict(doc = "Substitutions to apply to the exec_config"),
        "_runner": attr.label(
            default = "//rules/scripts:platform_runner.template.bash",
            allow_single_file = True,
        ),
        "_cc_toolchain": attr.label(default = Label("@bazel_tools//tools/cpp:current_cc_toolchain")),
    },
    toolchains = ["@rules_cc//cc:toolchain_type"],
    executable = True,
)

platform_test = platform_rule(
    implementation = _platform_runner_impl,
    attrs = {
        "binary": attr.label(doc = "Program to execute"),
        "exec_config": attr.label(mandatory = True, providers = [ExecConfigInfo], doc = "Execution configuration"),
        "substitutions": attr.string_dict(doc = "Substitutions to apply to the exec_config"),
        "_runner": attr.label(
            default = "//rules/scripts:platform_runner.template.bash",
            allow_single_file = True,
        ),
        "_cc_toolchain": attr.label(default = Label("@bazel_tools//tools/cpp:current_cc_toolchain")),
    },
    toolchains = ["@rules_cc//cc:toolchain_type"],
    test = True,
)
