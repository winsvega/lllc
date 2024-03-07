#!/usr/bin/env bash
gtar --sort=name \
      --owner=0 --group=0 --numeric-owner \
      --pax-option=exthdr.name=%d/PaxHeaders/%f,delete=atime,delete=ctime \
      -cf lllc-arm64.tar.gz build/lllc
