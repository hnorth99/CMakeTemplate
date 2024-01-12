# Clang tidy is slow, so only run it during release builds
if(CMAKE_BUILD_TYPE STREQUAL Release)
  set(CMAKE_CXX_CLANG_TIDY
    clang-tidy;
    -header-filter=.;
    -checks=bugprone-*,performance-*,readability-*,google-*,performance-*;)
endif()