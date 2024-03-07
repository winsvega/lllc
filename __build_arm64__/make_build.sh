#!/usr/bin/env bash


echo "WARNING: acOS requirements assumed to be available and installed already..."

sleep 1

# CMakeLists.txt:~L12-L13
# set(PROJECT_VERSION 0.0.0)

echo "PROJECT_VERSION: 0.5.14"
# -DLLLC_LINK_STATIC=ON

export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
mkdir -p build/ && cd build/ || exit 127

(cmake .. -DCMAKE_BUILD_TYPE=Release -DLLL=1 -DUSE_Z3=OFF -DCMAKE_OSX_ARCHITECTURES='arm64' --fresh && make lllc) || exit 127
