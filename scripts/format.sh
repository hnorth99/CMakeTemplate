#!/usr/bin/env bash

# Clang format on cpp/h files
find . \( -name "*.cpp" -o -name "*.c" -o -name "*.h" \) -print0 | xargs -I {} clang-format -i {}
# Cmake format on list files
find . \( -name "*.cmake" -o -name "CMakeLists.txt" \) -print0 | xargs -I {} cmake-format -i {}
