Installing opencv and opencv-contrib via apt, dnf or pacman is convenient. But if you wanna make some customization, such as link with CUDA, build from source is required.<br><br>
This article takes opencv-4.7.0 installation on NVIDIA Jetson Nano as example, including Python 3.6 and Python 2.7 packages.

### Install essential packages
APT Packages
```
sudo apt install gtk+-3.0 qt5-default libvtk6-dev zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libopenexr-dev libgdal-dev libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev libtbb-dev libeigen3-dev
```
Python Packages
```
pip3 install wheel cython numpy
```

Link .so (Only for x86_64)
```
sudo ln -s /usr/lib/python2.7/dist-packages/vtk/libvtkRenderingPythonTkWidgets.x86_64-linux-gnu.so /usr/lib/x86_64-linux-gnu/libvtkRenderingPythonTkWidgets.so
sudo ln -s /usr/bin/vtk6 /usr/bin/vtk 
```

### Download source code
```
cd ~/Downloads
wget https://github.com/opencv/opencv/archive/refs/tags/4.7.0.zip
unzip 4.7.0.zip && rm 4.7.0.zip
wget https://github.com/opencv/opencv_contrib/archive/refs/tags/4.7.0.zip
unzip 4.7.0.zip && rm 4.7.0.zip
```

### Configure for build
Exit your conda environment
```
conda deactivate && conda deactivate
```

Create build path and enter to the path
```
cd ~/Downloads/opencv-4.7.0
mkdir build && cd build
```

Configuration for AARCH64(NVIDIA Jetson Nano)
```
cmake \
-D WITH_QT=ON \
-D WITH_CUDA=ON \
-D WITH_CUDNN=ON \
-D WITH_LIBV4L=ON \
-D WITH_GSTREAMER=ON \
-D WITH_PROTOBUF=ON \
-D WITH_OPENNI=ON \
-D WITH_OPENNI2=ON \
-D WITH_MFX=ON \
-D WITH_TBB=ON \
-D WITH_OPENVINO=OFF \
-D HIGHGUI_ENABLE_PLUGINS=ON \
-D CUDNN_VERSION="8.0" \
-D CUDNN_INCLUDE_DIR=/usr/include \
-D CUDA_ARCH_BIN="5.3" \
-D CUDA_ARCH_PTX="" \
-D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.7.0/modules \
-D OPENCV_ENABLE_NONFREE=ON \
-D OPENCV_GENERATE_PKGCONFIG=ON \
-D OPENCV_SKIP_PYTHON_LOADER=ON \
-D OPENCV_DNN_CUDA=ON \
-D BUILD_opencv_python2=ON \
-D BUILD_opencv_python3=ON \
-D BUILD_TESTS=OFF \
-D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr/local/opencv-4.7.0 \
-D PYTHON_DEFAULT_EXECUTABLE=$(python -c "import sys; print(sys.executable)") \
-D PYTHON2_EXECUTABLE=/usr/bin/python2.7 \
-D PYTHON2_INCLUDE_DIR=/usr/include/python2.7 \
-D PYTHON2_LIBRARY=/usr/lib/aarch64-linux-gnu/libpython2.7.so \
-D PYTHON2_NUMPY_INCLUDE_DIRS=/usr/lib/python2.7/dist-packages/numpy/core/include \
-D PYTHON2_PACKAGES_PATH=/usr/lib/python2.7/dist-packages \
-D PYTHON3_EXECUTABLE=$(dirname $(which python3))/python3 \
-D PYTHON3_INCLUDE_DIR=$(echo $(dirname $(dirname $(which python3)))/include/python3.*m) \
-D PYTHON3_LIBRARY=$(dirname $(dirname $(which python3)))/lib/libpython3.so \
-D PYTHON3_NUMPY_INCLUDE_DIRS=$(python3 -c "import numpy; print(numpy.get_include())") \
-D PYTHON3_PACKAGES_PATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
..

```

#### Excepted configuration output

```
--   Python 2:
--     Interpreter:                 /usr/bin/python2.7 (ver 2.7.17)
--     Libraries:                   /usr/lib/aarch64-linux-gnu/libpython2.7.so (ver 2.7.17)
--     numpy:                       /usr/lib/python2.7/dist-packages/numpy/core/include (ver 1.13.3)
--     install path:                /usr/lib/python2.7/dist-packages
```
```
--   Python 3:
--     Interpreter:                 /usr/bin/python3 (ver 3.6.9)
--     Libraries:                   /usr/lib/libpython3.so (ver 3.6.9)
--     numpy:                       /usr/lib/python3/dist-packages/numpy/core/include (ver 1.13.3)
--     install path:                /usr/lib/python3/dist-packages
```

#### Some tricks

##### Memory insufficient related issue
Build opencv from source requires memory approximately 8GB.<br>
For users of NVIDIA Jetson nano or other development board, temporary swap size extension maybe appiled.
```
cd ~/Downloads/opencv-4.7.0/build
sudo dd if=/dev/zero of=swapfile bs=1M count=4096
sudo mkswap swapfile
sudo swapon swapfile
```
After build opencv packages, turn off and delete swap file
```
sudo swapoff ~/Downloads/opencv-4.7.0/build/swapfile
sudo rm -f ~/Downloads/opencv-4.7.0/build/swapfile
```

##### Network issue(For Chinese user)
Due to the restriction of GFW, if you are facing .dat download related issue, accerate mirror is required.
```
cd ~/Downloads/opencv-4.7.0
wget https://raw.gitmirror.com/opencv/opencv_3rdparty/8afa57abc8229d611c4937165d20e2a2d9fc5a12/face_landmark_model.dat
mkdir .cache && mkdir .cache/data
mv face_landmark_model.dat .cache/data/7505c44ca4eb54b4ab1e4777cb96ac05-face_landmark_model.dat
```

### Install

Make and install
```
cd ~/Downloads/opencv-4.7.0/build
make -j4
sudo make install
```
Copy opencv directory to other Python3 environment (Optional)

(For venv, assume it is located on ~/venvs/Torch)
```
source ~/venvs/Torch/bin/activate
pip3 install wheel cython numpy
cp /usr/lib/python3/dist-packages/cv2.cpython-36m-aarch64-linux-gnu.so ~/venvs/Torch/lib/python3.6/site-packages/
```
(For Python 3.6, Mambaforge, assume your env name is Torch)
```
conda deactivate && conda deactivate
pip3 install wheel cython numpy
cp /usr/lib/python3/dist-packages/cv2.cpython-36m-aarch64-linux-gnu.so ~/mambaforge/envs/Torch/lib/python3.6/site-packages/
```
Check your installation
```
echo $(python3 -c "import cv2; print(cv2.__version__)")
```
