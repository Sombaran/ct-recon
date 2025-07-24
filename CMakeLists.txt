# cmake version needed
cmake_minimum_required(VERSION 3.13...3.26.3)

# project name
project(ct-recon)

# set the C++11 standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
#set (CPP_CMAKE)

# subdirectories
add_subdirectory(source)
# testing
enable_testing()
find_package(GTest REQUIRED)
#add_subdirectory(test)
#target_link_libraries(my_tests PRIVATE GTest::gtest_main)


#add_subdirectory(include)
#add_subdirectory(library)

