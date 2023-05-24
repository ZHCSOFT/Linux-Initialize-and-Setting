## Check memory infomation

### via `dmidecode`
```
sudo dmidecode -t memory
```

It shows
```
# dmidecode 3.2
Getting SMBIOS data from sysfs.
SMBIOS 3.2.0 present.

Handle 0x0022, DMI type 16, 23 bytes
Physical Memory Array
        Location: System Board Or Motherboard
        Use: System Memory
        Error Correction Type: Single-bit ECC
        Maximum Capacity: 3 TB
        Error Information Handle: Not Provided
        Number Of Devices: 8

Handle 0x0023, DMI type 17, 40 bytes
Memory Device
        Array Handle: 0x0022
        Error Information Handle: Not Provided
        Total Width: 72 bits
        Data Width: 64 bits
        Size: 16 GB
        Form Factor: DIMM
        Set: None
        Locator: DIMMA1
        Bank Locator: P0_Node0_Channel0_Dimm0
        Type: DDR4
        Type Detail: Synchronous
        Speed: 2666 MT/s
        Manufacturer: Samsung
        Serial Number: 037056CF
        Asset Tag: DIMMA1_AssetTag (date:18/30)
        Part Number: M393A2K40CB2-CTD
        Rank: 1
        Configured Memory Speed: 2666 MT/s
        Minimum Voltage: 1.2 V
        Maximum Voltage: 1.2 V
        Configured Voltage: 1.2 V
        
```

### via `i2c-tools`
```
sudo dnf install i2c-tools-perl
decode-dimms
```
if `No EEPROM found, try loading the eeprom or at24 module` exists, try use
```
sudo modprobe eeprom
decode-dimms
```

## SSD Vendor

```
lsblk -o NAME,FSTYPE,LABEL,MOUNTPOINT,SIZE,MODEL
```
It shows
```
NAME        FSTYPE LABEL                 MOUNTPOINT   SIZE MODEL
zram0                                    [SWAP]         8G
nvme0n1                                             931.5G ADATA SX6000LNP
├─nvme0n1p1 vfat                         /boot/efi    600M
├─nvme0n1p2 ext4                         /boot          1G
└─nvme0n1p3 btrfs  fedora_localhost-live /home      929.9G
```
Check information of `nvme0n1`
```
sudo dnf install smartmontools
sudo smartctl -a /dev/nvme0n1
```
It shows
```
smartctl 7.3 2022-02-28 r5338 [x86_64-linux-6.2.15-300.fc38.x86_64] (local build)
Copyright (C) 2002-22, Bruce Allen, Christian Franke, www.smartmontools.org

=== START OF INFORMATION SECTION ===
Model Number:                       ADATA SX6000LNP
Serial Number:                      MCJ022R000187P1101
Firmware Version:                   6917
PCI Vendor/Subsystem ID:            0x1e4b
IEEE OUI Identifier:                0x3a5a27
Total NVM Capacity:                 1,000,204,886,016 [1.00 TB]
Unallocated NVM Capacity:           0
Controller ID:                      0
NVMe Version:                       1.4
Number of Namespaces:               1
Namespace 1 Size/Capacity:          1,000,204,886,016 [1.00 TB]
Namespace 1 Formatted LBA Size:     512
Namespace 1 IEEE EUI-64:            3a5a27 03000000c4
Local Time is:                      Wed May 24 10:52:16 2023 CST
Firmware Updates (0x14):            2 Slots, no Reset required
Optional Admin Commands (0x0007):   Security Format Frmw_DL
Optional NVM Commands (0x001f):     Comp Wr_Unc DS_Mngmt Wr_Zero Sav/Sel_Feat
Log Page Attributes (0x03):         S/H_per_NS Cmd_Eff_Lg
Maximum Data Transfer Size:         512 Pages
Warning  Comp. Temp. Threshold:     90 Celsius
Critical Comp. Temp. Threshold:     95 Celsius

Supported Power States
St Op     Max   Active     Idle   RL RT WL WT  Ent_Lat  Ex_Lat
 0 +     6.50W       -        -    0  0  0  0        0       0
 1 +     5.80W       -        -    1  1  1  1        0       0
 2 +     3.60W       -        -    2  2  2  2        0       0
 3 -   0.7460W       -        -    3  3  3  3     5000   10000
 4 -   0.7260W       -        -    4  4  4  4     8000   45000

Supported LBA Sizes (NSID 0x1)
Id Fmt  Data  Metadt  Rel_Perf
 0 +     512       0         0

=== START OF SMART DATA SECTION ===
SMART overall-health self-assessment test result: PASSED

SMART/Health Information (NVMe Log 0x02)
Critical Warning:                   0x00
Temperature:                        37 Celsius
Available Spare:                    95%
Available Spare Threshold:          10%
Percentage Used:                    2%
Data Units Read:                    2,280,536 [1.16 TB]
Data Units Written:                 41,274,459 [21.1 TB]
Host Read Commands:                 18,549,435
Host Write Commands:                145,497,512
Controller Busy Time:               811
Power Cycles:                       61
Power On Hours:                     5,653
Unsafe Shutdowns:                   29
Media and Data Integrity Errors:    0
Error Information Log Entries:      141
Warning  Comp. Temperature Time:    0
Critical Comp. Temperature Time:    0
Temperature Sensor 1:               59 Celsius
Temperature Sensor 2:               59 Celsius
Temperature Sensor 3:               59 Celsius
Temperature Sensor 4:               59 Celsius
Temperature Sensor 5:               59 Celsius
Temperature Sensor 6:               59 Celsius
Temperature Sensor 7:               59 Celsius
Temperature Sensor 8:               59 Celsius

Error Information (NVMe Log 0x01, 16 of 64 entries)
Num   ErrCount  SQId   CmdId  Status  PELoc          LBA  NSID    VS
  0        141     0  0x6008  0x2002  0x000            0     0     -
```
