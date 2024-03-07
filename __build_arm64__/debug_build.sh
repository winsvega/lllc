#!/usr/bin/env bash

echo "LLVM Debug Build starting...."

rm -rf build
mkdir -p build && cd build/

cmake .. -DCMAKE_BUILD_TYPE=Release -DLLL=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1
make lllc
