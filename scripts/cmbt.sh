#!/usr/bin/env bash

echo "Executing the C-Make Builder in test mode"
pwd
rm -rf build/dev
cmake -B build/dev -S . -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_COMPILER=g++
cd build/dev || exit
make all
make coverage_car_test
