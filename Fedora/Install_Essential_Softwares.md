
[TOC]

## MS-Edge

### Import GPG key
```
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
```
### Add Edge RPM repository
```
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
```
### Install via dnf command
```
sudo dnf install microsoft-edge-stable
```

## MS-VSCode

### Import GPG key
```
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
```
### Add VSCode RPM repository
```
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/vscode
```
### Install via dnf command
```
sudo dnf install code
```
