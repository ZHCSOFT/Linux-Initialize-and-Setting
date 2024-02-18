```
sudo su
```

## For RPM (like Fedora)
```
(rpm -q --qf="%{VERSION}-%{RELEASE}.%{ARCH}\n" --whatprovides kernel ; uname -r) | \
sort | uniq | while read KERNEL ; do 
  dracut -f "/boot/initramfs-${KERNEL}.img" "${KERNEL}" || exit 1
done
```
## For Debian based distros
```
for kernel in /boot/config-*; do 
  [ -f "$kernel" ] || continue
  KERNEL=${kernel#*-}
  mkinitramfs -o "/boot/initrd.img-${KERNEL}.img" "${KERNEL}" || exit 1
done
```
## Reboot
```
sudo reboot now
```
