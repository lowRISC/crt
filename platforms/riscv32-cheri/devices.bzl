load("//config:device.bzl", "device_config")

DEVICES = [
    device_config(
        name = "riscv32-cheri",
        architecture = "rv32imcxcheri",
        feature_set = "//platforms/riscv32-cheri/features:rv32imcxcheri",
        constraints = [
            "@platforms//cpu:riscv32",
            "//platforms/riscv32-cheri/extension:cheri",
        ],
        substitutions = {
            "ARCHITECTURE": "rv32imcxcheri",
            "ABI": "il32pc64",
            "CMODEL": "medany",
            "ENDIAN": "little",
            "[STACK_PROTECTOR]": "",
        },
    ),
]
