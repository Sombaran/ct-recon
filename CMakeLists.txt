# cmake version needed
cmake_minimum_required(VERSION 3.10...3.26.3)

# project name
project(recom CXX)

# set the C++11 standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
#set (CPP_CMAKE)

add_executable(my_code
    source/main.cpp
    source/testSrc.cpp
)

# testing
# enable_testing()
#find_package(GTest REQUIRED)
#add_subdirectory(test)
#target_link_libraries(my_tests PRIVATE GTest::gtest_main)

target_include_directories(my_code PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)

#add_subdirectory(include)
#add_subdirectory(library)