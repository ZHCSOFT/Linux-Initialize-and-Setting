## NVIDIA driver installation

### Install essential packages
```
sudo pacman -S base-devel
sudo pacman -S linux-headers
```
### Quit x-server and reboot
```
sudo systemctl set-default multi-user.target
sudo reboot now
```
### Install NVIDIA .run driver
```
sudo bash ./NVIDIA-VERSION.run
```
### Resume x-server after installation
```
sudo systemctl set-default graphical.target
sudo reboot now
```
### Check graphic card information
```
nvidia-smi
```
