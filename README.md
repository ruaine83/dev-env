# dev-env
Generic Development Environment OCI Image/Container

IMPORTANT: You will likely need to create a file called `./Docker/devenv.env` to hold your environment variables, such as Docker Hub login info.

## Overview
This is a simple repo that contains the files necessary to build a generic development container.

## Details

### Base
Based on the **latest** tagged image of Ubuntu

### Tools
Installed tools include (but are not limited to):

- Languages
    1. gcc/g++
    2. Rust
    3. Python

- Tools
    1. Docker
    2. Make
    3. CMake
    4. gdb
    5. ssh