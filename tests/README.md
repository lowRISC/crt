# Tests for CRT

This is subdirectory is a bazel workspace for testing CRT.  It contains
some very simple tests to make sure the compiler configuration can build
binaries for `arm`, `riscv32`, `win32` and `win64`.

The binaries for `arm` and `riscv32` are tested by executing them under
the `qemu` emulator.

TODO:
- The binaries for `win32` and `win64` are currently not tested.
- There are no tests for the `m6502` compiler configuration.
