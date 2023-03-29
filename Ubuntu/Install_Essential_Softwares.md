## Usergroup Configuration
Serial Port, Microphone, Camera
```
sudo usermod -aG dialout $(whoami)
sudo usermod -aG audio $(whoami)
sudo usermod -aG video $(whoami)
```

## Remote Desktop Client: Remmina
```
sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret freerdp2-x11
```
