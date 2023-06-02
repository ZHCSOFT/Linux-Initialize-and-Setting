## Environment
Hardware: NVIDIA Jetson Nano<br>
OS: Ubuntu 18.04(aarch64)<br>
GCC version: GCC-7<br>
Python version: Python 3.6<br>

## Preparing basic packages and source code
```
sudo apt update
sudo apt install gcc g++ dialog
cd ~/Downloads
git clone https://github.com/dusty-nv/jetson-inference.git
cd jetson-inference/
git submodule update --init
```

## Configure installation without models and PyTorch whl(Do not enter `SPACE` key when it shows PyTorch installation)
```
mkdir build && cd build
cmake ..
```
If you failed to configure(shows message such as `Python 3.7 not found`), try to redo submodule update.
```
cd ~/Downloads/jetson-inference/
git submodule update --init --recursive
cd build
```

## Make and install
```
make -j4
sudo make install
```

## Download remaining modules
Install pip3 and pip3
```
sudo apt install python3-pip python-pip
```
Since URL [https://nvidia.box.com/] was blocked by GFW, for Chinese user, you should manually download models via VPN or other service.<br>
Assume we can access [https://nvidia.box.com/]

### Download models and config
Download such large quantity of files results to termination, too. So download and install models independently is recommand.
```
cd ~/Downloads/jetson-inference/tools/
sh ./download-models.sh
```
Select models you need, download them.<br>
Remove soft link and move folders to `/usr/local/bin/`
```
sudo rm -rf /usr/local/bin/images
sudo rm -rf /usr/local/bin/networks

sudo mv ~/Downloads/jetson-inference/data/images /usr/local/bin/
sudo mv ~/Downloads/jetson-inference/data/networks /usr/local/bin/
```

### Download PyTorch whl packages and install
#### For Python 2.7
```
wget https://nvidia.box.com/shared/static/o8teczquxgul2vjukwd4p77c6869xmri.whl -O torch-1.1.0-cp27-cp27mu-linux_aarch64.whl
pip2 install torch-1.1.0-cp27-cp27mu-linux_aarch64.whl
```

#### For Python 3.6
For Jetson Nano
```
wget https://nvidia.box.com/shared/static/fjtbno0vpo676a25cgvuqc1wty0fkkg6.whl -O torch-1.10.0-cp36-cp36m-linux_aarch64.whl
pip3 install torch-1.10.0-cp36-cp36m-linux_aarch64.whl
```

#### For Python 3.8
Only for Jetson Orin Family
```
wget https://developer.download.nvidia.com/compute/redist/jp/v50/pytorch/torch-1.12.0a0+2c916ef.nv22.3-cp38-cp38-linux_aarch64.whl -O torch-1.12.0a0+2c916ef.nv22.3-cp38-cp38-linux_aarch64.whl
pip3 install torch-1.12.0a0+2c916ef.nv22.3-cp38-cp38-linux_aarch64.whl
```

### Download mediapipe and install
Install opencv-python and opencv-contrib-python from pip whl is not recommand for NVIDIA Jetson Nano.
```
wget https://github.com/PINTO0309/mediapipe-bin/releases/download/v0.8.5/v0.8.5.zip -O mediapipe_cu102
_python3.6_aarch64.zip
unzip mediapipe_cu102_python3.6_aarch64.zip && rm mediapipe_cu102_python3.6_aarch64.zip
mv v0.8.5/numpy119x/py36/*.whl . && rm -r v0.8.5
pip3 install --no-deps mediapipe-0.8.5_cuda102-cp36-cp36m-linux_aarch64.whl protobuf==3.19.6 six attrs absl-py wheel dataclasses
```

## Other components
### Install to system-provided python and virtual-enviroments
Assume we have conda env named `Torch` located on `~/mambaforge/envs/Torch/` with `Python=3.6`
```
cp /usr/lib/python3.6/dist-packages/jetson_utils_python.so ~/mambaforge/envs/Torch/lib/python3.6/site-packages/
cp /usr/lib/python3.6/dist-packages/jetson_inference_python.so ~/mambaforge/envs/Torch/lib/python3.6/site-packages/
cp -r /usr/lib/python3.6/dist-packages/jetson ~/mambaforge/envs/Torch/lib/python3.6/site-packages/
cp -r /usr/lib/python3.6/dist-packages/Jetson ~/mambaforge/envs/Torch/lib/python3.6/site-packages/
cp -r /usr/lib/python3.6/dist-packages/jetson_utils ~/mambaforge/envs/Torch/lib/python3.6/site-packages/
cp -r /usr/lib/python3.6/dist-packages/jetson_inference ~/mambaforge/envs/Torch/lib/python3.6/site-packages/
```
For venv, assume it is located on `~/venvs/Torch`
```
cp /usr/lib/python3.6/dist-packages/jetson_utils_python.so ~/venvs/Torch/lib/python3.6/site-packages/
cp /usr/lib/python3.6/dist-packages/jetson_inference_python.so ~/venvs/Torch/lib/python3.6/site-packages/
cp -r /usr/lib/python3.6/dist-packages/jetson ~/venvs/Torch/lib/python3.6/site-packages/
cp -r /usr/lib/python3.6/dist-packages/Jetson ~/venvs/Torch/lib/python3.6/site-packages/
cp -r /usr/lib/python3.6/dist-packages/jetson_utils ~/venvs/Torch/lib/python3.6/site-packages/
cp -r /usr/lib/python3.6/dist-packages/jetson_inference ~/venvs/Torch/lib/python3.6/site-packages/
```
### Copy libraries to other device
```
sudo scp USERNAME@YOURIP:/usr/local/lib/libjetson* /usr/local/lib/
sudo scp -r USERNAME@YOURIP:/usr/lib/python3.6/dist-packages/jetson_* /usr/lib/python3.6/dist-packages/
sudo scp -r USERNAME@YOURIP:/usr/lib/python3.6/dist-packages/Jetson /usr/lib/python3.6/dist-packages/
sudo scp -r USERNAME@YOURIP:/usr/lib/python3.6/dist-packages/jetson /usr/lib/python3.6/dist-packages/
sudo scp -r USERNAME@YOURIP:/usr/local/bin/images /usr/local/bin/
sudo scp -r USERNAME@YOURIP:/usr/local/bin/networks /usr/local/bin/

sudo /sbin/ldconfig
```

### Install torchvision
Add environment variable
```
echo "export CUDA_HOME=/usr/local/cuda" >> ~/.bashrc
source ~/.bashrc
```
After this step, re-switch to your virtual environment may required

#### For Python 2.7
```
cd ~/Downloads/jetson-inference/build
rm -rf torchvision-27
git clone -bv0.3.0 https://github.com/dusty-nv/vision torchvision-27
cd torchvision-27
echo "$LOG building torchvision for Python 2.7..."
sudo python setup.py install
```

#### For Python 3.6
```
cd ~/Downloads/jetson-inference/build
sudo rm -rf torchvision-36
git clone -bv0.11.1 https://github.com/pytorch/vision torchvision-36
cd torchvision-36
echo "$LOG building torchvision for Python 3.6..."
sudo python3 setup.py install
```

#### For Python 3.8
```
cd ~/Downloads/jetson-inference/build
rm -rf torchvision-38
git clone -bv0.12.0 https://github.com/pytorch/vision torchvision-38
cd torchvision-38
sudo python3 setup.py install
```
