## Install DaVinci Resolve

### Download zip archive containing .run installation runtime on official website
https://www.blackmagicdesign.com/products/davinciresolve

### Unzip package and install software
```
unzip DaVinci_Resolve_FILE.zip
sudo ./DaVinci_Resolve_RUNTIME.run
```
Click `Execute` and `run once` on pop up window

### Run the software on terminal and determine possible errors
```
/opt/resolve/bin/resolve
```

for `libcrypto.so` related error, do
```
sudo cp /usr/lib/libcrypto.so.1.0.0 /opt/resolve/libs/
```
for `libaprutil-1.so` related error such as glibc missing, do
```
sudo cp /usr/lib/libaprutil-1.so /opt/resovle/libs/
```
for segmentation fault, do
```
yay -S gdb
gdb /opt/resolve/bin/resolve
r
```
if it shows `/opt/intel/opencl-runtime` related exception, just remove `intel-opencl-runtime` for my case
```
yay -R intel-opencl-runtime
```
