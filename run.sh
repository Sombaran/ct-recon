#! /bin/bash

set -e

echo "Please choose a build option:"
echo "1) Development Build"
echo "2) Production Build"
echo "3) Test Build"
echo "Enter your choice (1, 2, or 3):"

read choice

case $choice in
    1)
        echo "Building Release version CMakeList"
        rm -rf build
        # Add commands for building development version here
        conan install . --output-folder=build --build=missing
        #conan build . --build-folder=build
        mkdir -p build
        cd build
        #source conanbuild.sh
        cmake .. -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release
        cmake --build .
        echo "RUNNING EXECUTABLE"
        echo
        echo
        #clear
        #./build/my_code
        echo
        echo
        #rm -rf build
        ;;
    2)
        echo "Building Production version..."
        # Add commands for building production version here
        ;;
    3)
        echo "Building Test version..."
        # Add commands for building test version here
        ;;
    *)
        echo "Invalid choice. Please enter 1, 2, or 3."
        ;;
esac

