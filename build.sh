#!/bin/bash

set -e

CUR_DIR="$(readlink -f $(dirname "$0"))"

cd $CUR_DIR/src
./bootstrap
./configure
make -j`nproc`
cp ./src/libsclog.a ../