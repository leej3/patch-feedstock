#!/bin/bash

if [[ ! $BOOTSTRAPPING == yes ]]; then
    # Get an updated config.sub and config.guess
    cp $BUILD_PREFIX/share/libtool/build-aux/config.* ./build-aux
fi

./configure --prefix="${PREFIX}" --host=${HOST}
make -j${CPU_COUNT} ${VERBOSE_AT}
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
    make check
fi
make install
