cmake_minimum_required(VERSION 3.27.0)
project(
  CMakeTemplate
  VERSION 1.0.0
  LANGUAGES CXX)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

# Block building within the source directory
include(NoInSourceBuilds)

# Useful utility for printing variables
#  cmake_print_variables(var)
include(CMakePrintHelpers)

# Add clang tidy linter when building in release mode
include(ClangTidy)

# Name the src directory as bin in the build tree
add_subdirectory(src bin)
add_subdirectory(tst)
