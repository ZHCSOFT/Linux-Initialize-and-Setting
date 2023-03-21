## What is bazel
Bazel is a free and open-source software tool developed by Google used for the automation of building and testing software. Many google related packages building from source require it.

## Build bazel(aarch64)
Since executable installer is not provided for aarch64 linux, we have to build bazel from source.

### Preparing basic packages and source code
```
sudo apt update
sudo apt install 

wget https://github.com/bazelbuild/bazel/archive/master.zip
mkdir bazel
unzip master.zip -d ./bazel/
```
