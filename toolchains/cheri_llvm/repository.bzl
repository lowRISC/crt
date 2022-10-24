load("@crt//config:repo.bzl", "compiler_repository")

def cheri_llvm_repos():
    compiler_repository(
        name = "cheri_llvm_files",
        archive = "@crt//toolchains/cheri_llvm/archive:cheri_llvm_sdk.tar.gz",
        exports = ["sdk/bin/**"],
    )
