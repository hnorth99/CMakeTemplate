# This module configures GoogleTest and GoogleMock and then configure testing
# within the project
include(CTest)
enable_testing()

# Default to use local version of gtest but if not found, fetch and build from
# github source
find_package(GTest REQUIRED)

# Export a macro that can be applied to each target to generate test results and
# coverage data
macro(AddTests target)
  # Add coverage to the target
  addcoverage(${target})
  # Link googletest and google mock
  target_link_libraries(${target} PRIVATE GTest::gtest_main GTest::gmock_main)
  gtest_discover_tests(${target})
endmacro()
