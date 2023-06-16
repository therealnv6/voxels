cmake_minimum_required(VERSION 3.13)
project(voxels)

set(CMAKE_CXX_STANDARD 20)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

# Add the meowfu library
add_subdirectory(thirdparty/ogl)

# Your project's source files
file(GLOB_RECURSE SOURCES 
    ${PROJECT_SOURCE_DIR}/src/*.cpp
    ${PROJECT_SOURCE_DIR}/src/*.h
    ${PROJECT_SOURCE_DIR}/include/*.h
    ${PROJECT_SOURCE_DIR}/include/*.hpp
)

# Create the executable for your project
add_executable(${PROJECT_NAME} ${SOURCES})

target_include_directories(${PROJECT_NAME} PRIVATE 
    ${CMAKE_CURRENT_SOURCE_DIR}/src 
    ${CMAKE_CURRENT_SOURCE_DIR}/include 
)

# Link the meowfu library
target_link_libraries(${PROJECT_NAME} PRIVATE meowfu)

# Link the EnTT library
target_link_libraries(${PROJECT_NAME} PRIVATE EnTT::EnTT)
