OS: Fedora 34

Intel OpenVINO provides official installation support on Ubuntu LTS version, CentOS 7, CentOS 8 and Red Hat Enterprise Linux, thus the runtime installation package can NOT be normally used on Fedora. We can only build OpenVINO and install from source.

## Download, build and install

### Download Source Code
```
git clone https://github.com/openvinotoolkit/openvino.git
git submodule update --init --recursive
```

### Install OpenCV
```
sudo dnf install opencv opencv-devel
```

### Install libusb for Intel Movidius packages

```
sudo dnf install libusbx-devel
```

### Do build configuration, specify OpenCV libraries directory
```
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DENABLE_INTEL_MYRAID_COMMON=OFF -DOpenCV_DIR=/usr/local/include/opencv4/opencv2 -DTREAT_WARNING_AS_ERROR=OFF ..
make --jobs=$(nproc --all)
sudo make install
```

Default installation `/usr/local`, these files and folders will be generated 
```
./docs/
./install_dependencies/
./runtime/
./samples/
./setupvars.sh
./tools/
```

### Set environment variables
Add the path below on `~/.bashrc`
```
export PATH=$PATH:/usr/local/runtime/cmake
```

## Verify installation
run offical sample demonstration
```
cd /usr/local/samples/cpp
./build_samples.sh
```
It will install runtime on user's home directory and create `inference_engine_cpp_samples_build` folder. Run and it will show supported device infomation
```
cd ~/inference_engine_cpp_samples_build/intel64/Release
./hello_query_device
```

# (Chinese Simplified Version)

## Linux 部署

### 安装 (Fedora 34)

Intel Open VINO 提供官方的 Ubuntu LTS version, CentOS 7, CentOS 8, Red Hat Enterprise Linux 安装支持与验证，因此其软件包和附带安装脚本无法在 Fedora 系统上部署，需要使用源码安装

使用以下指令从 GitHub 下载源码

```
git clone https://github.com/openvinotoolkit/openvino.git
git submodule update --init --recursive
```

安装 OpenCV
```
sudo dnf install opencv opencv-devel
```

安装所需 libusb 套件以支持 Intel Movidius 神经计算棒硬件

```
sudo dnf install libusbx-devel
```

建立 build 文件夹，关闭 threat waring as error 以免编译器因警告报错（适用于高版本 GCC e.g. GCC 10.2)。因该组件不提供 Fedora 系统保证，需指定 OpenCV 的安装路径（以 /usr/local/include/opencv4/opencv2 为例）。因暂时不需使用神经计算棒，在配置中关闭 ENABLE_INTEL_MYRAID_COMMON 选项
```
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DENABLE_INTEL_MYRAID_COMMON=OFF -DOpenCV_DIR=/usr/local/include/opencv4/opencv2 -DTREAT_WARNING_AS_ERROR=OFF ..
make --jobs=$(nproc --all)
sudo make install
```

默认安装路径为 `/usr/local` ，安装后会在其中生成如下文件和目录
```
./docs/
./install_dependencies/
./runtime/
./samples/
./setupvars.sh
./tools/
```

### 配置环境变量
为编译范例文件，在个人用户的 `~/.bashrc` 下添加以下记录
```
export PATH=$PATH:/usr/local/runtime/cmake
```
### 测试
运行 Intel OpenVINO 自带的 sample demonstration
```
cd /usr/local/samples/cpp
./build_samples.sh
```
系统会在用户目录中生成内含执行文件的文件夹 `inference_engine_cpp_samples_build`。 进入并运行测试，程序将显示设备信息
```
cd ~/inference_engine_cpp_samples_build/intel64/Release
./hello_query_device
```
