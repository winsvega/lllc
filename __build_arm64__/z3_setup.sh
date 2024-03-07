git clone --depth 1 -b z3-4.8.10 https://github.com/Z3Prover/z3.git \
    /usr/src/z3; \
    cd /usr/src/z3; \
    mkdir build; \
    cd build; \
    LDFLAGS=$CXXFLAGS cmake -DZ3_BUILD_LIBZ3_SHARED=OFF -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release ..; \
    make libz3 -j; \
    make install;
