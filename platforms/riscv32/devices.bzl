# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("//config:device.bzl", "device_config")

DEVICES = [
    device_config(
        name = "opentitan",
        architecture = "rv32imc",
        feature_set = "//platforms/riscv32/features:rv32imc-hardened",
        constraints = [
            "@platforms//cpu:riscv32",
            "@platforms//os:none",
        ],
        substitutions = {
            "ARCHITECTURE": "rv32imc",
            "ABI": "ilp32",
            "CMODEL": "medany",
            "ENDIAN": "little",
            "[STACK_PROTECTOR]": "",
        },
    ),
]
