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
decode-dimms
```
