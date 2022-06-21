cmake_minimum_required(VERSION 3.18)

project(jsonmerge CXX)

set(CMAKE_CXX_STANDARD 17)

add_library(jsonmerge)
find_package(Boost 1.79 COMPONENTS json REQUIRED)

target_include_directories(
  jsonmerge
  PUBLIC 
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
    $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}>/include
)
target_sources(
  jsonmerge
  PRIVATE 
    "src/jsonmerge.cpp"
)
target_link_libraries(
  jsonmerge
  PUBLIC 
    Boost::json
)

# Enable unit tests under tests directory
enable_testing()
add_subdirectory(tests)