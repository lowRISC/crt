# Compiler Repository Toolkit

The Compiler Repository Toolkit is a set of bazel rules meant to make building
a C/C++ toolchain easier.

This was inspired by [bazel-embedded](https://github.com/bazelembedded/bazel-embedded);
I hope I've managed to improve things.

## Features

- Simplified toolchain setup.
- A bazel-ish approach to compiler features and flags.
- More concise target device configuration.
- Emulator configuration for executing target code

### Simplified toolchain setup

Each of the toolchains is configured in `//toolchains/...` by two files.
- `repository.bzl` describes the path or URL to the compiler archive.
- `BUILD.bzl` initializes the toolchains for each target device.  Most of the
  configuration comes from the individual device configurations (more on that
  later).  The other elemets of the `BUILD.bazel` file describe the files
  which make up the compiler and the various include paths needed by the
  compiler.

### A bazel-ish approach to compiler features and flags

Compiler featurs and flags are defined by a `feature_set` which aggregates
compiler flags for activating different features, such as optimization modes
or warning levels.  The `feature_set` aggregates a collection of `feature`
rules together and provides a facility for supplying substitutions to those
flags so that minor variations in configuration don't require an entire new
configuration.  Feature sets may be chained together; features supplied later
in the chain override features earlier in the chain.  Substitutions may be
supplied at any point in the `feature_set` chain _or_ by the device
configuration.

### More concise target device configuration

Target devices are defined in `//platforms/<arch>/devices.bzl`.  Each
device configuration creates a device struct containing the architecture,
constraints, feature set and substitutions to supply to the feature set.

Each target device should correspond to a bazel `platform` definition.
Bazel will use the platform constraints to select the toolchain for the
device with the same constraints.

### Emulator configuration for target code

In addition to defining the toolchains, `crt` also defines an `exec_config`
that can be used to execute target code under a system emulator.  Sample
configurtions using `qemu` are supplied.

## How to use

In your `WORKSPACE` file, add:

```
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
http_archive(
    name = "crt",
    url = "https://github.com/cfrantz/crt/archive/refs/tags/v0.3.0.tar.gz",
    sha256 = "...",
    strip_prefix = "crt-0.3.0",
)

load("@crt//:repos.bzl", "crt_repos")
crt_repos()
load("@crt//:deps.bzl", "crt_deps")
crt_deps()

load("@crt//config:registration.bzl", "crt_register_toolchains")
crt_register_toolchains(
    arm = True,     # Pick the toolchains you want.
    m6502 = True,
    riscv32 = True,
    win64 = True,
)
```

## Releasing CRT

To perform a release of CRT, run the [Create Release](https://github.com/lowRISC/crt/actions/workflows/create_release.yml) workflow.
For the `release_tag` parameter, supply the tag name for the new release, e.g. "v0.4.2".
