## Enable system auto reboot when encountered kernel panic

### Create sysctl.conf and paste text below to edit kernel setting
`/etc/sysctl.conf`
```
kernel.panic = 30
kernel.sysrq = 1
```
### Create rc.local service description file and paste text below 
`/etc/rc.local`
```
#!/bin/bash
sysctl -p
exit 0
```

### Create rc-local service and paste service configure settings
`/usr/lib/systemd/system/rc-local.service`
```
[Unit]
Description=/etc/rc.local Compatibility
ConditionPathExists=/etc/rc.local
After=NetworkManager.service

[Service]
Type=forking
ExecStart=/etc/rc.local &
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=no
SysVStartPriority=99

[Install]
WantedBy=multi-user.target
```

### Grant permission for execute service
```
sudo chmod +x /etc/rc.local
```

### Register service on every system boot
```
sudo systemctl enable rc-local.service
```
