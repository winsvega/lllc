

date -u +"release.%Y.%-m.%-d"
export CMAKE_BUILD_TYPE=Release
export MAKEFLAGS=-j10
echo -n > prerelease.txt


echo "SDKROOT=$(xcrun -sdk macosx11.1 --show-sdk-path)" >> $GITHUB_ENV
echo "MACOSX_DEPLOYMENT_TARGET=$(xcrun -sdk macosx11.1 --show-sdk-platform-version)" >> $GITHUB_ENV
echo -n "$GITHUB_COMMIT" > commit_hash.txt
TZ=UTC git show --quiet --date="format-local:%Y.%-m.%-d" --format="llc.%cd"

mkdir -p build
cd build
echo "Starting source build...."

# -DCMAKE_BUILD_TYPE="${CMAKE_BUILD_TYPE:-Release}"

cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE="$OSXCROSS_TARGET_DIR"/toolchain.cmake 
