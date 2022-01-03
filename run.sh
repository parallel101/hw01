#!/bin/bash
mkdir -p build
# configure
cmake . -Bbuild
# make
cmake --build build
# run
cd build && ./main
