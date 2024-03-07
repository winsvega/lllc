#!/usr/bin/env bash

# Clone and Build from retesteth upstream

git clone --depth 1 -b master https://github.com/winsvega/solidity.git lllc/
cd lllc || exit 127
(mkdir /build && cd /build || exit 127)
sleep 1
(cmake .. -DCMAKE_BUILD_TYPE=Release -DLLL=1 && make lllc) || exit 127
