# 简介
TensorRT 是 NVIDIA 推出的基于 CUDA 的类神经网络 **Inference** 部署工具，支持 Windows, Linux 等操作系统。该平台由私有模块（包括核心组件、模型转换、优化器等）与开源模块（包含ONNX Parser等）组成，具有很高的运行效率。

TensorRT版本分为 EA (Early Access) 和 GA (General Availability)，分别代表预发行版和稳定版。

## 资源链接
开源组件： https://github.com/NVIDIA/TensorRT
私有模块： https://developer.nvidia.com/nvidia-tensorrt-download （需登入NVIDIA帐号并填写表单）

# Linux部署

## 下载、编译、安装
本文以 `TensorRT-8.4` 配合 `cuda-11.6` 辅以 `cudnn-8.3.2.44` 在使用 `GCC-11.3.1` 作为编译器且使用 `linux 5.17` 内核的 `Fedora 34` 上完成测试

执行以下命令取得开源模块并更新其子模块
```
cd ~
git clone https://github.com/NVIDIA/TensorRT
cd TensorRT
git submodule update --init --recursive
```

下载私有模块的 `.tar.gz` 压缩包到用户目录的 `Downloads` 内，解压，复制其中的文件到含有开源模块的 `TensorRT` 文件夹内
```
cd ~/Downloads
tar -xvf TensorRT-8.4.0.6.Linux.x86_64-gnu.cuda-11.6.cudnn8.3.tar.gz
cp -r ~/Downloads/TensorRT-8.4.0.6/* ~/TensorRT/
```

利用 `export` 指令添加临时环境变量供编译时使用
```
export TRT_RELEASE=/home/USERNAME/TensorRT
export LD_LIBRARY_PATH=$TRT_RELEASE/lib:$LD_LIBRARY_PATH
```

建立 `build` 文件夹并生成编译用文件，指定 CUDA 版本为 11.6，手动设定 CUDA 架构为 75，将编译完成的结果保存在 `build/out` 目录内
```
cd ~/TensorRT
mkdir build
cd build
cmake .. -DTRT_LIB_DIR=$TRT_RELEASE/lib -DTRT_OUT_DIR=`pwd`/out -DCUDA_VERSION=11.6 -DCMAKE_CUDA_ARCHITECTURES=75
```

生成配置文件后，仍需对编译用配置文件进行进一步配置。

从 Github 取得 protobuf-cpp-3.7.1，复制并重命名成 版本3.0.0 以供编译时使用
```
cd ~/Downloads
wget https://github.com/protocolbuffers/protobuf/releases/download/v3.7.1/protobuf-cpp-3.7.1.tar.gz
cp protobuf-cpp-3.7.1.tar.gz ~/TensorRT/build/third_party.protobuf/src/protobuf-cpp-3.0.0.tar.gz
```

修改 `download-third_party.protobuf.cmake` 文件，在 `Line 80` 后另起一行，添加 `return()` 以跳过之后的命令。该文件位置如下
```
~/TensorRT/build/third_party.protobuf/src/third_party.protobuf-stamp/download-third_party.protobuf.cmake
```

使用以下命令为 `Protobuf` 添加静态库所需的软链接
```
cd ~/TensorRT/build/third_party.protobuf/
mkdir lib
cd lib
ln -s ../lib64/libprotobuf.a  libprotobuf.a
```
回到 `build` 文件夹，编译 TensorRT
```
cd ~/TensorRT/build/
make -j8
```

## 运行测试范例

进入 `build/out` 目录，运行测试范例

```
cd ~/TensorRT/build/out
./sample_onnx_mnist
```

范例程序将输出运行结果
