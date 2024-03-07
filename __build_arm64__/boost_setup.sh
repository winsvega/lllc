wget -q 'https://dl.bintray.com/boostorg/release/1.73.0/source/boost_1_73_0.tar.bz2' -O boost.tar.bz2; \
    test "$(sha256sum boost.tar.bz2)" = "4eb3b8d442b426dc35346235c8733b5ae35ba431690e38c6a8263dce9fcbb402  boost.tar.bz2"; \
    tar -xf boost.tar.bz2; \
    rm boost.tar.bz2; \
    cd boost_1_73_0; \
    CXXFLAGS="-stdlib=libc++ -pthread" LDFLAGS="-stdlib=libc++" ./bootstrap.sh --with-toolset=clang --prefix=/usr; \
    ./b2 toolset=clang cxxflags="-stdlib=libc++ -pthread" linkflags="-stdlib=libc++ -pthread" headers; \
    ./b2 toolset=clang cxxflags="-stdlib=libc++ -pthread" linkflags="-stdlib=libc++ -pthread" \
        link=static variant=release runtime-link=static \
        system filesystem unit_test_framework program_options \
        install -j $(($(nproc)/2)); 
