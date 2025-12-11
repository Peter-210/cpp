# C++ Template

## (For Developement Only) Project Setup
- Run `script/container-name.sh` and provide a unique docker container name
    - `container-name.sh` will self delete after use

## Setup
- Make sure to have `Docker` installed
    - If on Windows, use `WSL` with `Docker Desktop` (Make sure to use `Linux Containers`)
- Give permission to execute helper script files: `chmod u+x script/*`

## Usage
- This project contains scripts that can run in different modes: 
    - p (prod) - Minimal installed tools on docker and optimized code from the compiler
    - d (dev/debug) - All tools installed for debugging the project (eg. GDB)
    - t (test) - Used for unit testing with GTest

- To learn more about these modes, use the `-h` or `--help` flag for the following scripts:
```
scripts/docker.sh -h
```
```
scripts/make.sh -h
```

## Build and Run
- Refer to the [Usage](#usage) section of this guide for details on `modes`
- All modes follow a similar step with slight differences. The general order is as follows:
    - Variations are marked with `( )`

1. Run the Docker Container
```
./script/docker.sh -(flag)
```

2. Run the cmake workflow to build
```
./script/make.sh -(flag)
```

3. Run the executable
```
./build/(src or test)/main.exe
```

### Build and Run (Prod Mode)
```
./script/docker.sh -p
./script/make.sh -p
./build/src/main.exe
```

### Build and Run (Dev/Debug Mode)
```
./script/docker.sh -d
./script/make.sh -d
gdb ./build/src/main.exe
```

### Build and Run (Test Mode)
```
./script/docker.sh -d
./script/make.sh -t
./build/test/main-test.exe
```

## TODO
- Delete only the appropriate docker container
    - Clean containers separately (isolate clean between prod and debug)
- Create a setup script for stuff like container naming and README project name
    - Automate filling in project name and details for README

## Ignored TODO
- Use the container name change to create a prod and debug seperate containers
- Create an auto build for prod docker
