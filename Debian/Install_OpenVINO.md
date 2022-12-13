## Linux 部署

Intel Open VINO 提供官方的 Ubuntu LTS version, CentOS 7, CentOS 8, Red Hat Enterprise Linux 安装支持与验证，因此其软件包和附带安装脚本无法在 Fedora 或 Debian 系统上部署，需要使用源码安装

### 源码准备

使用以下指令从 GitHub 下载源码

```
cd ~/Downloads
git clone https://github.com/openvinotoolkit/openvino.git
cd openvino
git submodule update --init --recursive
```

### 环境准备 (Debian 11)

#### 安装 OpenCV
```
sudo apt install libopencv-dev
```

#### 安装所需 libusb 套件以支持 Intel Movidius 神经计算棒硬件（可选）

```
sudo apt install libusb-1.0-0-dev
```

#### 安装 oneTBB
和 Fedora 不同，Dedian系统未预装 Intel oneTBB，需手动安装，并在利用 OpenVINO 的组件之 `CMakeLists.txt` 内指定 oneTBB 的路径
```
cd ~/Downloads
git clone https://github.com/oneapi-src/oneTBB.git
cd oneTBB/
git checkout v2021.5.0
mkdir build
cd build
cmake ..
make --jobs=$(nproc --all)
sudo make install
```
库文件默认安装在如下位置
```
/usr/local/lib/libtbb*
/usr/local/pkgconfig/tbb.pc

/usr/local/include/oneapi/tbb/*
/usr/local/include/tbb/*
/usr/local/lib/cmake/TBB/*
```
在用到 OpenVINO 模块的 `CMakeLists.txt` 内添加以下内容以让 OpenVINO 使用 `find_package(TBB REQUIRED)` 命令
```
set(TBB_DIR "/usr/local/lib/cmake/TBB")
```

### 安装

建立 build 文件夹，关闭 threat waring as error 以免编译器因警告报错（适用于高版本 GCC e.g. GCC 10.2)。因该组件不提供 Fedora 系统保证，需指定 OpenCV 的安装路径（以 /usr/local/include/opencv4/opencv2 为例）。因暂时不需使用神经计算棒，在配置中关闭 ENABLE_INTEL_MYRAID 选项
```
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local/openvino -DENABLE_INTEL_MYRAID=OFF -DENABLE_INTEL_MYRAID_COMMON=OFF -DOpenCV_DIR=/usr/local/include/opencv4/opencv2 -DTREAT_WARNING_AS_ERROR=OFF ..
make --jobs=$(nproc --all)
sudo make install
```

设定的安装路径为 `/usr/local/openvino` ，安装后会在其中生成如下文件和目录
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
export PATH=/usr/local/openvino/runtime/cmake:$PATH
```
### 测试
运行 Intel OpenVINO 自带的 sample demonstration
```
cd /usr/local/openvino/samples/cpp
./build_samples.sh
```
系统会在用户目录中生成内含执行文件的文件夹 `inference_engine_cpp_samples_build`。 进入并运行测试，程序将显示设备信息
```
cd ~/inference_engine_cpp_samples_build/intel64/Release
./hello_query_device
```
