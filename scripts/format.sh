#!/usr/bin/env bash

# Clang format on cpp/h files
find . -regex '.*\.\(cpp\|h\)' -exec clang-format -style=file -i {} \;
