```
sudo su
```

```
(rpm -q --qf="%{VERSION}-%{RELEASE}.%{ARCH}\n" --whatprovides kernel ; uname -r) | \
sort | uniq | while read KERNEL ; do 
  dracut -f "/boot/initramfs-${KERNEL}.img" "${KERNEL}" || exit 1
done
```

```
sudo reboot now
```
