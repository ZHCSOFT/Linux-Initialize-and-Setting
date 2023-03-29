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

## Configure installation without models
```
mkdir build && cd build
cmake ..
```
### When you failed to configure, shows message such as `Python 3.7 not found`, try to redo repository download action.
```
cd ~/Downloads
rm -rf jetson-inference
git submodule update --remote --recursive
git clone https://github.com/dusty-nv/jetson-inference.git
cd jetson-inference/
git submodule update --init
```

## Make and install
```
make -j4
sudo make install
```

## Download models and install
Since URL [https://nvidia.box.com/] was blocked by GFW, for Chinese user, you should manually download models via VPN or other service.<br>
Download such large quantity of files results to termination, too. So download and install models independently is recommand.<br>
Assume we can access [https://nvidia.box.com/]
```
cd ~/Downloads/jetson-inference/tools/
sh ./download-models.sh
```
Select models you need, download them.<br>
Remove soft link and move folders to `/usr/local/bin/`
```
sudo rm -rf /usr/bin/images
sudo rm -rf /usr/bin/networks

sudo mv ../data/images /usr/local/bin/
sudo mv ../data/networks /usr/local/bin/
```

## Install to system-provided python and virtual-enviroments
Assume we have conda env named `Torch` located in `~/mambaforge/envs/Torch/` with `Python=3.6`
```
cp /usr/lib/python3.6/dist-packages/jetson_utils_python.so ~/mambaforge/envs/Torch/lib/pythonX.X/site-packages/
cp /usr/lib/python3.6/dist-packages/jetson_inference_python.so ~/mambaforge/envs/Torch/lib/pythonX.X/site-packages/
cp -r /usr/lib/python3.6/dist-packages/jetson ~/mambaforge/envs/Torch/lib/pythonX.X/site-packages/
cp -r /usr/lib/python3.6/dist-packages/Jetson ~/mambaforge/envs/Torch/lib/pythonX.X/site-packages/
```
