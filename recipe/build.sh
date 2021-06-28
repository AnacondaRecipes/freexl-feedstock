#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .

export CFLAGS="$CFLAGS -I$PREFIX/include -L$PREFIX/lib"
export LDFLAGS="$LDFLAGS -L$PREFIX/lib -Wl,-rpath,${PREFIX}/lib"

if [[ $(uname -m) = "aarch64" ]]; then
  ./configure --prefix=$PREFIX --host=aarch64-linux-gnu --build=aarch64-linux-gnu
else
  ./configure --prefix=$PREFIX --host=$HOST --build=$BUILD
fi

make
make install
make check
