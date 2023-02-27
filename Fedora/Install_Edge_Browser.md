### Import GPG key
```
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
```
### Add Microsoft RPM repository
```
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
```
### Install via dnf command
```
sudo dnf install microsoft-edge-stable
```
