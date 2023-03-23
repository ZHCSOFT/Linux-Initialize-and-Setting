## What is bazel
Bazel is a free and open-source software tool developed by Google used for the automation of building and testing software. Many google related packages building from source require it.

## Build bazel(aarch64)
Since executable installer is not provided for aarch64 linux, we have to build bazel from source.

### Preparing basic packages and source code
```
sudo apt update
sudo apt install openjdk-11-jdk protobuf-compiler build-essential autoconf libtool pkg-config zip zlib1g-dev 

wget https://github.com/bazelbuild/bazel/archive/master.zip
mkdir bazel
unzip master.zip -d ./bazel/

```

### Setting environment variable
```
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-arm64/
```

### Compile and install
```
cd bazel
./compile.sh
sudo cp -r output/bazel /usr/bin/
```

### Verify installation
```
bazel --version
```
