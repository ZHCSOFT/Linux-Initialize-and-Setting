### PyCUDA
```
pip3 install platformdirs==2.4.0
pip3 install -U pip setuptools wheel
cd ~/Downloads
wget https://files.pythonhosted.org/packages/78/09/9df5358ffb74d225243b56a65ffe196de481fcd8f731f55e41f2d5d36015/pycuda-2022.2.2.tar.gz
tar -xvf pycuda-2022.2.2.tar.gz
cd pycuda-2022.2.2/
python3 configure.py
python3 setup.py install
```

### Mediapipe
```
cd ~/Downloads
wget https://github.com/ZHCSOFT/Linux-Preparing-and-Setting/releases/download/v0.0/mediapipe-0.8.5_cuda102-cp36-cp36m-linux_aarch64.whl
pip3 install --no-deps mediapipe-0.8.5_cuda102-cp36-cp36m-linux_aarch64.whl
pip3 install dataclasses attrs protobuf==3.19.6
```

### TensorRT
TensorRT package has been installed in system python3.6 dist-packages. If you wanna install tensorrt to your virtual environment, run commands below.<br>
Mambaforge, named Torch, located on `~/mambaforge/envs/Torch`
```
cp -r /usr/lib/python3.6/dist-packages/tensorrt ~/mambaforge/envs/Torch/lib/python3.6/site-packages/
```
venv, named Torch, located on `~/venvs/Torch`
```
cp -r /usr/lib/python3.6/dist-packages/tensorrt ~/venvs/Torch/lib/python3.6/site-packages/
```

### Bluetooth develop packages
Dependency packages installation
```
sudo apt install bluetooth libbluetooth-dev libboost-python-dev libboost-thread-dev libcap2-bin bluez-hcidump
```
Set root-free privilege for BLE scanning
```
sudo setcap 'cap_net_raw,cap_net_admin+eip' `which hcitool`
sudo setcap 'cap_net_raw,cap_net_admin+eip' "$(readlink -f "$(which python3)")"
```
bluepy provides bluetooth BLE support for python interpreter
```
pip3 install bluepy dbus-python pexpect
pip3 install git+https://github.com/peplin/pygatt
```
pybluez also available
```
cd ~/Downloads
git clone https://github.com/pybluez/pybluez.git
cd pybluez
```
Edit `LINE 98` of `setup.py`: `python_requires=">=3.6"`
```
python3 setup.py install
pip3 install -e .[ble]
```

### GObject
```
sudo apt install libgirepository1.0-dev libcairo2-dev
pip3 install pygobject
```

### dbus
```
sudo apt install libdbus-glib-1-dev
pip3 install setuptools
pip3 install dbus-python
```

### jtop
```
sudo apt install python-pip
sudo pip install jetson-stats
sudo reboot now

systemctl status jtop
jtop

```
