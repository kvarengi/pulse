bash
#!/bin/bash
./autogen.sh
./configure \
    --disable-wallet \
    --disable-tests \
    --disable-bench \
    --disable-gui-tests \
    --without-gui \
    --without-miniupnpc \
    --without-natpmp \
    --enable-reduce-exports \
    --disable-shared \
    --with-utils \
    --with-daemon \
    CXXFLAGS="-O2 -march=native -pipe" \
    LDFLAGS="-static-libstdc++"
