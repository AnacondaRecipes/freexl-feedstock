#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .

export CFLAGS="$CFLAGS -I$PREFIX/include -L$PREFIX/lib"
export LDFLAGS="$LDFLAGS -L$PREFIX/lib -Wl,-rpath,${PREFIX}/lib"

./configure --prefix=$PREFIX --host=$HOST --build=$BUILD

make
make install
make check
