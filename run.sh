#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")"

echo "Please choose a build option:"
echo "1) Development Build"
echo "2) Production Build"
echo "3) Test Build"
echo "Enter your choice (1, 2, or 3):"

read -r choice

resolve_bazel_command() {
    if [[ -n "${BAZEL:-}" ]]; then
        printf '%s\n' "$BAZEL"
        return
    fi

    if command -v bazelisk >/dev/null 2>&1; then
        command -v bazelisk
        return
    fi

    if command -v bazel >/dev/null 2>&1; then
        command -v bazel
        return
    fi

    local cache_dir="${BAZELISK_CACHE_DIR:-$PWD/.cache/bazelisk}"
    local bazelisk_path="$cache_dir/bazelisk"
    local bazelisk_version="${BAZELISK_VERSION:-v1.27.0}"
    local bazelisk_asset

    case "$(uname -s):$(uname -m)" in
        Linux:x86_64) bazelisk_asset="bazelisk-linux-amd64" ;;
        Linux:aarch64|Linux:arm64) bazelisk_asset="bazelisk-linux-arm64" ;;
        *)
            echo "Error: install Bazel/Bazelisk or set BAZEL to its executable path." >&2
            return 1
            ;;
    esac

    if [[ ! -x "$bazelisk_path" ]]; then
        if ! command -v curl >/dev/null 2>&1; then
            echo "Error: curl is required to download Bazelisk." >&2
            return 1
        fi
        mkdir -p "$cache_dir"
        echo "Bazel/Bazelisk not found; downloading Bazelisk $bazelisk_version..." >&2
        curl --fail --location --silent --show-error \
            "https://github.com/bazelbuild/bazelisk/releases/download/${bazelisk_version}/${bazelisk_asset}" \
            --output "$bazelisk_path"
        chmod +x "$bazelisk_path"
    fi

    printf '%s\n' "$bazelisk_path"
}

case $choice in
    1)
        echo "Building Release version CMakeList"
        # rm -rf build
        # Add commands for building development version here
        conan install . --output-folder=build --build=missing
        # conan build . --build-folder=build
        conan build .
        # mkdir -p build
        # cd build
        #source conanbuild.sh
        # cmake .. -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release
        # cmake --build .
        echo "RUNNING EXECUTABLE"
        echo
        echo
        #clear
        # ./build/my_code
        echo
        echo
        #rm -rf build
        ;;
    2)
        echo "Building Release version with Bazel"
        if ! command -v conan >/dev/null 2>&1; then
            echo "Error: Conan is required for the Bazel build." >&2
            exit 1
        fi
        bazel_command="$(resolve_bazel_command)"

        conan install . --output-folder=build/bazel/conan --build=missing
        "$bazel_command" build //:ctReconServiceToolBin
        echo "Bazel executable: bazel-bin/ctReconServiceToolBin"
        ;;
    3)
        echo "Building Test version..."
        # Add commands for building test version here
        ;;
    *)
        echo "Invalid choice. Please enter 1, 2, or 3."
        ;;
esac

