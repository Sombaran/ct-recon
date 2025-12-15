cmake_minimum_required(VERSION 3.10...3.26.3)

project(Reconstruction CXX)

# Include Conan toolchain for dependency management
#include(${CMAKE_BINARY_DIR}/conan_toolchain.cmake)

# Find required packages
find_package(gRPC REQUIRED)
find_package(GTest REQUIRED)
find_package(CURL REQUIRED)
find_package(jsoncpp REQUIRED)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Shared library target
add_library(ctReconServiceTool SHARED
    source/main.cpp
    source/testSrc.cpp
)

target_link_libraries(ctReconServiceTool
    grpc::grpc
    CURL::libcurl
    JsonCpp::JsonCpp
    GTest::gtest GTest::gtest_main
)

target_include_directories(ctReconServiceTool PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)


# Executable target
add_executable(ctReconServiceToolBin
    source/main.cpp
    source/testSrc.cpp
)

# Link executable with shared library and dependencies (optional)
target_link_libraries(ctReconServiceToolBin
    ctReconServiceTool
)

# Include directories (optional if linked with library)
target_include_directories(ctReconServiceToolBin PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
