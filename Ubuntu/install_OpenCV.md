```
sudo apt install gtk+-3.0
sudo ln -s /usr/lib/python2.7/dist-packages/vtk/libvtkRenderingPythonTkWidgets.x86_64-linux-gnu.so /usr/lib/aarch64-linux-gnu/libvtkRenderingPythonTkWidgets.so
sudo ln -s /usr/bin/vtk6 /usr/bin/vtk 


```

```
mkdir build && cd build
```
```
cmake \
-D WITH_CUDA=ON \
-D CUDA_ARCH_BIN="5.3" \
-D CUDA_ARCH_PTX="" \
-D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.7.0/modules \
-D WITH_GSTREAMER=ON \
-D WITH_LIBV4L=ON \
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
-D PYTHON3_EXECUTABLE=$(python3 -c "import sys; print(sys.executable)") \
-D PYTHON3_INCLUDE_DIR=$(dirname $(dirname $(which python3)))/include \
-D PYTHON3_LIBRARY=$(dirname $(dirname $(which python3)))/lib \
-D PYTHON3_NUMPY_INCLUDE_DIRS=$(python -c "import numpy; print(numpy.get_include())") \
-D PYTHON3_PACKAGES_PATH=$(python -c "from disutils.sysconfig import get_python_lib; print(get_python_lib())") \
..
```
