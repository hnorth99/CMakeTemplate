#!/usr/bin/env bash

echo "Executing the C-Make Builder"
pwd
rm -rf build/release
cmake -B build/release -S . -DCMAKE_BUILD_TYPE=Release
cd build/release || exit
make all
