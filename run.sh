rm -rf build 
cmake -B build
cmake --build build --target main
./build/main