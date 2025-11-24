# C++ Template

## Build and Run
1. Run the Docker Container
- Make sure to launch `Docker Desktop` on Windows beforehand

```
./script/docker.sh
```

2. Run the cmake workflow to build

```
./script/make.sh
```

3. Run the executable

```
./build/src/main.exe
```

## Build and Run with GTest
1. Enable GTest within `CMakeLists.txt`

```
// Replace the following line:
option(ENABLE_TESTS "Enable GoogleTest For Testing" OFF)

// With the provided line below:
option(ENABLE_TESTS "Enable GoogleTest For Testing" ON)
```

2. Follow the `Build and Run` steps 1 and 2
    - Run Docker Container
    - Run CMake Workflow

3. Run the test executable

```
./build/test/main-test.exe
```

## make.sh Help Command
- Use the following command to see all build related commands

```
./script/make.bat -h
```
