#!/usr/bin/env bash
# Dependency Installer (di)
# This script will clone a git repository at a specific tag
# and then use the gcc compiler to make and install the 
# package
set -e -u -o pipefail
PACKAGE_NAME=$1
PACKAGE_TAG=$2
PACKAGE_URL=$3

# Navigate to the package builder directory
cd "$SOURCE_BUILD_DIR" || exit

# Fetch and install the package 
git clone -b "$PACKAGE_TAG" "$PACKAGE_URL"
mkdir "$PACKAGE_NAME/build"
cd "$PACKAGE_NAME/build" || exit
cmake -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ ..
make
sudo make install
