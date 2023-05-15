# cmake version needed
cmake_minimum_required(VERSION 3.13...3.26.3)

# project name
project(ct-recon-cmake)

# set the C++11 standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENCIONS OFF)
#set (CPP_CMAKE)

# testing
enable_testing()
find_package(GTest REQUIRED)

# subdirectories
add_subdirectory(src-ct-recon)
#add_subdirectory(test-ct-recon)
#add_subdirectory(include-ct-recon)
add_subdirectory(lib-ct-recon/googletest)

