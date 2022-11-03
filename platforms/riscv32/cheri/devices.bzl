load("//config:device.bzl", "device_config")
load("//config:compiler.bzl", "listify_flags")

DEVICES = [
    device_config(
        name = "riscv32-cheri",
        architecture = "rv32imcxcheri",
        feature_set = "//platforms/riscv32/cheri/features:rv32imcxcheri",
        constraints = [
            "@platforms//cpu:riscv32",
            "//constraints/extension:cheri",
        ],
        substitutions = {
            "ARCHITECTURE": "rv32imcxcheri",
            "ABI": "il32pc64",
            "CMODEL": "medany",
            "ENDIAN": "little",
            "TARGET": "riscv32-unknown-elf",
            "[STACK_PROTECTOR]": "",
            "[SYSTEM_LIBRARY_PATHS]": listify_flags(
                "-L{}",
                [
                    "external/cheri_llvm_files/sdk/baremetal/baremetal-riscv32-purecap/riscv32-unknown-elf/lib/",
                ],
            ),
        },
    ),
]
