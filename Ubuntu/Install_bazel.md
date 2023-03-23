## What is bazel
Bazel is a free and open-source software tool developed by Google used for the automation of building and testing software. Many google related packages building from source require it.

## Environment
Hardware: NVIDIA Jetson Nano<br>
OS: Ubuntu 18.04(aarch64)

## Build bazel(aarch64)
Since executable installer is not provided for aarch64 linux, we have to build bazel from source.

### Preparing basic packages and source code
Install GCC-11 and switch to newer version by article [GCC installation Guide for Ubuntu](https://github.com/ZHCSOFT/Linux-Preparing-and-Setting/blob/main/Ubuntu/install_GCC.md)<br>

```
sudo apt update
sudo apt install openjdk-11-jdk protobuf-compiler build-essential autoconf libtool pkg-config zip zlib1g-dev 

wget https://github.com/bazelbuild/bazel/archive/master.zip
mkdir bazel
unzip master.zip -d ./bazel/
```

### Setting environment variable for JAVA
```
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-arm64/
```

### Compile and install
```
cd bazel
./compile.sh
sudo cp ./output/bazel /usr/bin/
```

### Verify installation
```
bazel --version
```
