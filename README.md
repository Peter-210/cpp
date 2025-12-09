# C++ Template

## TODO
- Create an optimized prod method for docker and make scripts (eg O2 optimizations)
    - prod optimizations should be default and changed via option varaible or presets
- Better error checking compiler with g++ flags
    - Errors: `-Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion`
    - Debug Build: `-ggdb`
    - Prod Build: `-O2 -DNDEBUG`
    - Compiler Extensions: `-pedantic-errors`
    - Compiler Versions: `-std=c++23`

## Initial Steps
- Give permission to execute helper script files: `chmod u+x script/*`
- Run `script/container-name.sh` and provide a unique docker container name
    - `container-name.sh` will self delete after use

## Help Commands
- The `-h` or `--help` flag can be used on bash files within `scripts` directory

```
./script/docker.bat -h
```
```
./script/make.bat -h
```

## Build and Run in Prod Mode
- Note: Clean the docker container if you want to use any other modes (Debug or Test)
    - Use flag `--help` for more info in `scripts/docker.sh`

1. Run the Docker Container
- If on Windows, make sure to launch `Docker Desktop` first and use `WSL`

```
./script/docker.sh -p
```

2. Run the cmake workflow in prod mode to build

```
./script/make.sh -p
```

3. Run the executable

```
./build/src/main.exe
```

## Running with GDB (Debug Mode)
- Docker will load the following tools:
    - gdb
    - clang-tidy
    - valgrind
    - perf

1. Run the Docker Container

```
./script/docker.sh -d
```

2. Run the cmake workflow in debug mode

```
./script/make.sh -d
```

3. Run executable in GDB

```
gdb ./build/src/main.exe
```

## Running with GTest (Test Mode)
- Note: This method also runs with debug tools

1. Run the Docker Container

```
./script/docker.sh -d
```

2. Run the cmake workflow in test mode

```
./script/make.sh -t
```

3. Run test executable

```
./build/test/main-test.exe
```
