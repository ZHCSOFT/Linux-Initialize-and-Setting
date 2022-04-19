## Background
Assume we have a computer with `Disk_0` storage and a linux is running on `LVMs` named `root` for main storage and `swap_1` for memory swap built on `Volume Groups` named `vgubuntu`, while the `Volume Group` `vgubuntu` is working on `Disk_0`

Now we have bought new storage device named `Disk_1` to extend `root` and `swap_1`'s available space.

## Basic fdisk info

### Check general storage info
`sudo fdisk -l`
We can see current `Disk_0` as `/dev/sda` mounted by OS, assigned with 2 partitation `/dev/sda1` for EFI booting and `/dev/sda2` for LVM storage. The new device `Disk_1` was assigned to `/dev/sdb` without any existing partition
```

Disk /dev/loop0: 55.48 MiB, 58159104 bytes, 113592 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop1: 218.102 MiB, 229629952 bytes, 448496 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop2: 64.79 MiB, 67915776 bytes, 132648 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop3: 51.4 MiB, 53522432 bytes, 104536 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/loop4: 31.9 MiB, 32595968 bytes, 63664 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes




Disk /dev/sda: 500 GiB, 536870912000 bytes, 1048576000 sectors
Disk model: Virtual disk    
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 0103CF8D-43C8-48CF-BDA9-9A859B72E2D1

Device       Start        End    Sectors   Size Type
/dev/sda1     2048    1050623    1048576   512M EFI System
/dev/sda2  1050624 1048573951 1047523328 499.5G Linux LVM


Disk /dev/sdb: 1 TiB, 1099511627776 bytes, 2147483648 sectors
Disk model: Virtual disk    
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/mapper/vgubuntu-root: 498.52 GiB, 535272882176 bytes, 1045454848 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/mapper/vgubuntu-swap_1: 976 MiB, 1023410176 bytes, 1998848 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
```
### Check `Volume Group` info
`sudo vgdisplay`
We have `Volume Group` named `vgubuntu` working on `Disk_0`

```
  VG Name               vgubuntu
  System ID             
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  4
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               2
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               <1.49 TiB
  PE Size               4.00 MiB
  Total PE              390014
  Alloc PE / Size       127863 / 499.46 GiB
  Free  PE / Size       8 / 32.00 MiB
  VG UUID               YfrWI1-oVc3-KVwA-52fS-amw6-HVJh-OYPyAK
```
### Check `LVM` info
`sudo lvdisplay`
We have two `LVM` named `root` for main storage and `swap_1` for memory swap built on `Volume Groups` named `vgubuntu`
```
  --- Logical volume ---
  LV Path                /dev/vgubuntu/root
  LV Name                root
  VG Name                vgubuntu
  LV UUID                DDQ21Q-FEZ9-Xe17-0hQr-ZOC8-cfOd-EFZxsI
  LV Write Access        read/write
  LV Creation host, time ubuntu, 2022-02-23 14:37:37 +0800
  LV Status              available
  # open                 1
  LV Size                498.51 GiB
  Current LE             127619
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:0
   
  --- Logical volume ---
  LV Path                /dev/vgubuntu/swap_1
  LV Name                swap_1
  VG Name                vgubuntu
  LV UUID                SqucME-7m8y-6IAS-cRvl-nUVD-BEtP-URKnhV
  LV Write Access        read/write
  LV Creation host, time ubuntu, 2022-02-23 14:37:37 +0800
  LV Status              available
  # open                 2
  LV Size                976.00 MiB
  Current LE             244
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:1
```

## Make partition and format
Since we are planning assign half space of `Disk_1` recognized `/dev/sdb` to `LVM` while remaining space would be used for other purposes, we should create two partitions then keep the first partition and format the second partition to Ext4

### Create partition
```
sudo fdisk /dev/sdb
n
p
ENTER #(ENTER to default, whole: 2048-2147483647)
1073742848 #(secter end of first partition)
n
p
ENTER #(ENTER to default, 1073742849-2147483647)
ENTER #(secter end of second partition)
w
```
### (Optional) format
We have created partitions `/dev/sdb1` and `/dev/sdb2` for `Disk_1`, then we need to format the second partition for further use
```
sudo mkfs.ext4 /dev/sdb2
```

## Assign disk or partition to Volume Group

### Assign partition `/dev/sdb1`
```
sudo vgextend vgubuntu /dev/sdb1
```
### (Optional) Assign whole disk `/dev/sdb`
```
sudo vgextend vgubuntu /dev/sdb
```
### (Optional)  Remove partition from `Volume Group`
```
sudo vgreduce vgubuntu /dev/sdb1
```
