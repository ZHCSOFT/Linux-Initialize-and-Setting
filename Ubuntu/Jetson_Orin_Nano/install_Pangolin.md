
```
git clone --recursive https://github.com/stevenlovegrove/Pangolin.git
cd Pangolin
./scripts/install_prerequisites.sh recommended
mkdir build && cd build
cmake .. -DPython_EXECUTABLE=`which python3`
```

For Jetson Orin Nano 4GB Module, using swap to extend memory(Optional)
```
sudo dd if=/dev/zero of=swapfile bs=1M count=4096
sudo mkswap swapfile
sudo swapon swapfile
```
Switch off and delete swap file after installation
```
sudo swapoff swapfile
sudo rm -f swapfile
```

Make and build program
```
make -j6
```

