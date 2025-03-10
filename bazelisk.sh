#!/bin/bash
# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

# This is a wrapper script for `bazelisk` that downloads and executes bazelisk.
# Bazelisk is a wrapper for `bazel` that can download and execute the project's
# required bazel version.
#
# CI jobs should use ci/bazelisk.sh instead, which performs CI-friendly additional
# setup.

set -euo pipefail

# Change to this script's directory, as it is the location of the bazel workspace.
cd "$(dirname "$0")"

: "${CURL_FLAGS:=--silent}"
: "${REPO_TOP:=$(git rev-parse --show-toplevel)}"
: "${BINDIR:=.bin}"

readonly release="v1.11.0"
declare -A hashes=(
    # sha256sums for v1.11.0.  Update this if you update the release.
    [linux-amd64]="231ec5ca8115e94c75a1f4fbada1a062b48822ca04f21f26e4cb1cd8973cd458"
    [linux-arm64]="f9119deb1eeb6d730ee8b2e1a14d09cb45638f0447df23144229c5b3b3bc2408"
)

declare -A architectures=(
    # Map `uname -m -o` to bazelisk's precompiled binary target names.
    [x86_64 GNU/Linux]="linux-amd64"
    [aarch64 GNU/Linux]="linux-arm64"
)

function os_arch() {
    local arch="$(uname -m -o)"
    echo "${architectures[$arch]:-${arch}}"
}

function check_hash() {
    local file="$1"
    local target="$(os_arch)"
    local value="$(sha256sum "${file}" | cut -f1 -d' ')"
    local expect="${hashes[$target]}"
    return $(test "$value" == "$expect")
}

function prepare() {
    local target="$(os_arch)"
    local bindir="${REPO_TOP}/${BINDIR}"
    local file="${bindir}/bazelisk"
    local url="https://github.com/bazelbuild/bazelisk/releases/download/${release}/bazelisk-${target}"

    mkdir -p "$bindir"
    echo "Downloading bazelisk ${release} (${url})." >> $bindir/bazelisk.log
    curl ${CURL_FLAGS} --location "$url" --output "$file"
    chmod +x "$file"
}

function up_to_date() {
    local file="$1"
    # We need an update if the file doesn't exist or it has the wrong hash
    test -f "$file" || return 1
    check_hash "$file" || return 1
    return 0
}

function main() {
    local bindir="${REPO_TOP}/${BINDIR}"
    local file="${bindir}/bazelisk"
    local lockfile="${bindir}/bazelisk.lock"

    if ! up_to_date "$file"; then
        # Grab the lock, blocking until success. Upon success, check again
        # whether we're up to date (because some other process might have
        # downloaded bazelisk in the meantime). If not, download it ourselves.
        mkdir -p "$bindir"
        (flock -x 9; up_to_date "$file" || prepare) 9>>"$lockfile"
    fi
    if ! check_hash "$file"; then
        echo "sha256sum doesn't match expected value"
        exit 1
    fi
    exec "$file" "$@"
}

main "$@"
