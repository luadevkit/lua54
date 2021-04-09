cmake -E remove_directory build
cmake -E remove_directory dist
cmake --verbose -H. -Bbuild -DCMAKE_INSTALL_PREFIX=dist
cmake --build build --target install --config release
cmake --build build --target package --config release
