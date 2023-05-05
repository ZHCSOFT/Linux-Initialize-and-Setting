### PyCUDA
```
pip3 install platformdirs==2.4.0

cd ~/Downloads
wget https://files.pythonhosted.org/packages/78/09/9df5358ffb74d225243b56a65ffe196de481fcd8f731f55e41f2d5d36015/pycuda-2022.2.2.tar.gz
tar -xvf pycuda-2022.2.2.tar.gz
cd pycuda-2022.2.2/
python3 configure.py
python3 setup.py install
```
### TensorRT
TensorRT package has been installed in system python3.6 dist-packages. If you wanna install tensorrt to your virtual environment, run commands below.
```
cp -r /usr/lib/python3.6/dist-packages/tensorrt ~/mambaforge/envs/YOUR_ENV_NAME/lib/python3.6/site-packages/
```

### BluePy
Dependency packages installation
```
sudo apt install bluetooth libbluetooth-dev libboost-python-dev libboost-thread-dev libcap2-bin bluez-hcidump
```
Set root-free privilege for BLE scanning
```
sudo setcap 'cap_net_raw,cap_net_admin+eip' `which hcitool`
sudo setcap 'cap_net_raw,cap_net_admin+eip' "$(readlink -f "$(which python3)")"
```
BluePy provides bluetooth BLE support for python interpreter
```
pip3 install bluepy
```
