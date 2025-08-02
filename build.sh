#!/usr/bin/env bash

set -uexo pipefail

wget https://ftp.gnu.org/gnu/parted/parted-3.6.tar.xz
tar xf parted-3.6.tar.xz
cd parted-3.6
./configure --disable-device-mapper --disable-nls --without-readline --disable-shared --enable-static
export CFLAGS='-O2 -pipe -static -fno-pie'
export LDFLAGS='-static -no-pie'
make clean
make V=1 LDFLAGS="-all-static $LDFLAGS"
strip -s parted/parted
