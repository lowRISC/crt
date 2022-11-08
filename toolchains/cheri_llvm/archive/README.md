### Instructions for building the CHERI-LLVM toolchain archive for purecap riscv32

This will use [cheribuild](https://github.com/CTSRD-CHERI/cheribuild) to build
the CHERI-LLVM RISC-V 32bit "purecap" toolchain for embedded development.
By default, the sources and toolchain will be fetched and built in `~/cheri/`.
This can be changed using the `--source-root`, `--output-root`, `--build-root`,
and `--tools-root` arguments. `-d` ensures required steps are executed (i.e.
builds LLVM & Clang before compiling the libraries). `-j` controls the number
of threads to be used for compilation.

Clone the cheribuild repository anywhere (its directory will not be used for building), then:

`./cheribuild.py newlib-baremetal-riscv32-purecap -d` (for libc, libm, libg)  
`./cheribuild.py compiler-rt-builtins-baremetal-riscv32-purecap -d` (for builtins)

Then `cd` to wherever the sdk folder is (`~/cheri/output/` by default,
or within either of the directories pointed to when passing
`--tool-root` or `--output-root`) and tar the `sdk` folder:  
`tar -cvzf cheri_llvm_sdk.tar.gz sdk/`

Lastly, copy `cheri_llvm_sdk.tar.gz` to this folder. The name must match the
filename in the `archive` field in `../repository.bzl`

