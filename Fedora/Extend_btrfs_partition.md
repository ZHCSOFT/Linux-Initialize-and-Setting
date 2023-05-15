```
sudo fdisk -l
```
### Resize partition
We have partition `/dev/nvme0n1p3` while it was mounted on `/` and the partition is ending on 253G when the disk spaced 1000G
```
sudo parted /dev/nvme0n1p3
```
```
df -h
```
### Resize filesystem
Before we resize filesystem, it shows
```
Filesystem      Size  Used Avail Use% Mounted on
devtmpfs        4.0M     0  4.0M   0% /dev
tmpfs            16G     0   16G   0% /dev/shm
tmpfs           6.1G  1.6M  6.1G   1% /run
/dev/nvme0n1p3  237G  194G   39G  84% /
/dev/nvme0n1p3  237G  194G   39G  84% /home
tmpfs            16G   40K   16G   1% /tmp
/dev/nvme0n1p2  974M  292M  615M  33% /boot
/dev/nvme0n1p1  599M   42M  558M   7% /boot/efi
tmpfs           3.1G   40K  3.1G   1% /run/user/1000
```
So we should operate filesystem or we can not use these space
```
sudo btrfs filesystem resize max /
```
Result
```
Filesystem      Size  Used Avail Use% Mounted on
devtmpfs        4.0M     0  4.0M   0% /dev
tmpfs            16G     0   16G   0% /dev/shm
tmpfs           6.1G  1.6M  6.1G   1% /run
/dev/nvme0n1p3  930G  194G  732G  21% /
/dev/nvme0n1p3  930G  194G  732G  21% /home
tmpfs            16G   40K   16G   1% /tmp
/dev/nvme0n1p2  974M  292M  615M  33% /boot
/dev/nvme0n1p1  599M   42M  558M   7% /boot/efi
tmpfs           3.1G   40K  3.1G   1% /run/user/1000
```
