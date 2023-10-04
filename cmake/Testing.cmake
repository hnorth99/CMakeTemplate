# This module configures GoogleTest and GoogleMock and then configure testing
# within the project
include(CTest)
enable_testing()

# Default to use local version of gtest but if not found, fetch and build from
# github source
find_package(GTest)
set(USE_GTEST_NAMESPACE GTest_FOUND)
if(NOT GTest_FOUND)
  message("GTest not found, fetching from github")
  include(FetchContent)
  FetchContent_Declare(
    googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG v1.14.0)

  # For Windows: Prevent overriding the parent project's compiler/linker
  # settings
  set(gtest_force_sharerd_crt
      ON
      CACHE BOOL "" FORCE)

  # Prevent installation of gmock and gtest when exporting this project
  option(INSTALL_GMOCK "Install GMock" OFF)
  option(INSTALL_GTEST "Install GTest" OFF)
  FetchContent_MakeAvailable(googletest)
  include(GoogleTest)
endif()

# Export a macro that can be applied to each target to generate test results and
# coverage data
macro(AddTests target)
  # Add coverage to the target
  addcoverage(${target})

  # Link googletest and google mock
  if(USE_GTEST_NAMESPACE)
    target_link_libraries(${target} PRIVATE GTest::gtest_main GTest::gmock)
  else()
    target_link_libraries(${target} PRIVATE gtest_main gmock)
  endif()
  gtest_discover_tests(${target})
endmacro()
