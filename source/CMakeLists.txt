#[[set(BINARY ${CMAKE_PROJECT_NAME})

file(GLOB_RECURSE SOURCES LIST_DIRECTORIES true *.h *.cpp)

set(SOURCES ${SOURCES})

add_executable(${BINARY}_run ${SOURCES})

add_library(${BINARY}_lib STATIC ${SOURCES})
]]

file(GLOB_RECURSE SOURCES LIST_DIRECTORIES true *.h *.cpp)

# Create a library from the source files
add_library(my_code testSrc.cpp)

# Create an executable from the main file
add_executable(my_app main.cpp)

# Link the library to the executable
target_link_libraries(my_app PRIVATE my_code)

# Link the include folder  
target_include_directories(my_code PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/../include)