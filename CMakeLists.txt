cmake_minimum_required(VERSION 3.10...3.26.3)

project(recom CXX)

# Find required packages
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
    CURL::libcurl
    JsonCpp::JsonCpp
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
