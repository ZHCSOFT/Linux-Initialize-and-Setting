# Microsoft Apps

### Import GPG key
```
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
```

## MS-Edge

### Add Edge RPM repository
```
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
```
### Install via dnf command
```
sudo dnf install microsoft-edge-stable
```

## MS-VSCode

### Add VSCode RPM repository
```
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/vscode
```
### Install via dnf command
```
sudo dnf install code
```

# Other vendors

## VLC

### Import RPM Fusion repositories
```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```
### Install via dnf command
```
sudo dnf install vlc python-vlc
```

## Virtualbox

### Import repositories
```
sudo wget -P /etc/yum.repos.d/ https://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
```
### Install via dnf command
```
sudo dnf install VirtualBox.x86_64
```
