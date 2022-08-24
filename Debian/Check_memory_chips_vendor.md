## Check memory infomation

```
sudo apt install i2c-tools
decode-dimms
```
if `No EEPROM found, try loading the eeprom or at24 module` exists, try use
```
sudo modprobe eeprom
decode-dimms
```

## Sample Output

It prints
```
# decode-dimms version 4.2

Memory Serial Presence Detect Decoder
By Philip Edelbrock, Christian Zuckschwerdt, Burkart Lingner,
Jean Delvare, Trent Piepho and others
WARNING: /sys/bus/i2c/drivers/eeprom/0-0052/eeprom is smaller than expected
WARNING: Fewer data bytes available (256) than needed (384)
HINT: You should be using the ee1004 driver instead of the eeprom driver
WARNING: /sys/bus/i2c/drivers/eeprom/0-0053/eeprom is smaller than expected
WARNING: Fewer data bytes available (256) than needed (384)
HINT: You should be using the ee1004 driver instead of the eeprom driver


Decoding EEPROM: /sys/bus/i2c/drivers/eeprom/0-0052
Guessing DIMM is in                              bank 3
Kernel driver used                               eeprom

---=== SPD EEPROM Information ===---
EEPROM CRC of bytes 0-125                        OK (0xBED6)
# of bytes written to SDRAM EEPROM               384
Total number of bytes in EEPROM                  512
Fundamental Memory type                          DDR4 SDRAM
SPD Revision                                     1.1
Module Type                                      UDIMM
EEPROM CRC of bytes 128-253                      OK (0x53D8)

---=== Memory Characteristics ===---
Maximum module speed                             3200 MT/s (PC4-25600)
Size                                             16384 MB
Banks x Rows x Columns x Bits                    16 x 17 x 10 x 64
SDRAM Device Width                               8 bits
Ranks                                            1
Primary Bus Width                                64 bits
AA-RCD-RP-RAS (cycles)                           22-22-22-52
Supported CAS Latencies                          24T, 22T, 20T, 19T, 18T, 17T, 16T, 15T, 14T, 13T, 12T, 11T, 10T

---=== Timings at Standard Speeds ===---
AA-RCD-RP-RAS (cycles) as DDR4-3200              22-22-22-52
AA-RCD-RP-RAS (cycles) as DDR4-2933              22-21-21-47
AA-RCD-RP-RAS (cycles) as DDR4-2666              19-19-19-43
AA-RCD-RP-RAS (cycles) as DDR4-2400              17-17-17-39
AA-RCD-RP-RAS (cycles) as DDR4-2133              15-15-15-35
AA-RCD-RP-RAS (cycles) as DDR4-1866              13-13-13-30
AA-RCD-RP-RAS (cycles) as DDR4-1600              11-11-11-26

---=== Timing Parameters ===---
Minimum Cycle Time (tCKmin)                      0.625 ns
Maximum Cycle Time (tCKmax)                      1.600 ns
Minimum CAS Latency Time (tAA)                   13.750 ns
Minimum RAS to CAS Delay (tRCD)                  13.750 ns
Minimum Row Precharge Delay (tRP)                13.750 ns
Minimum Active to Precharge Delay (tRAS)         32.000 ns
Minimum Active to Auto-Refresh Delay (tRC)       45.750 ns
Minimum Recovery Delay (tRFC1)                   350.000 ns
Minimum Recovery Delay (tRFC2)                   260.000 ns
Minimum Recovery Delay (tRFC4)                   160.000 ns
Minimum Four Activate Window Delay (tFAW)        21.000 ns
Minimum Row Active to Row Active Delay (tRRD_S)  2.500 ns
Minimum Row Active to Row Active Delay (tRRD_L)  4.900 ns
Minimum CAS to CAS Delay (tCCD_L)                5.000 ns
Minimum Write Recovery Time (tWR)                15.000 ns
Minimum Write to Read Time (tWTR_S)              2.500 ns
Minimum Write to Read Time (tWTR_L)              7.500 ns

---=== Other Information ===---
Package Type                                     Monolithic
Maximum Activate Count (MAC)                     Unlimited
Post Package Repair                              One row per bank group
Soft PPR                                         Supported
Module Nominal Voltage                           1.2 V
Thermal Sensor                                   No

---=== Physical Characteristics ===---
Module Height                                    32 mm
Module Thickness                                 2 mm front, 1 mm back
Module Reference Card                            A revision 2


Decoding EEPROM: /sys/bus/i2c/drivers/eeprom/0-0053
Guessing DIMM is in                              bank 4
Kernel driver used                               eeprom

---=== SPD EEPROM Information ===---
EEPROM CRC of bytes 0-125                        OK (0xBED6)
# of bytes written to SDRAM EEPROM               384
Total number of bytes in EEPROM                  512
Fundamental Memory type                          DDR4 SDRAM
SPD Revision                                     1.1
Module Type                                      UDIMM
EEPROM CRC of bytes 128-253                      OK (0x53D8)

---=== Memory Characteristics ===---
Maximum module speed                             3200 MT/s (PC4-25600)
Size                                             16384 MB
Banks x Rows x Columns x Bits                    16 x 17 x 10 x 64
SDRAM Device Width                               8 bits
Ranks                                            1
Primary Bus Width                                64 bits
AA-RCD-RP-RAS (cycles)                           22-22-22-52
Supported CAS Latencies                          24T, 22T, 20T, 19T, 18T, 17T, 16T, 15T, 14T, 13T, 12T, 11T, 10T

---=== Timings at Standard Speeds ===---
AA-RCD-RP-RAS (cycles) as DDR4-3200              22-22-22-52
AA-RCD-RP-RAS (cycles) as DDR4-2933              22-21-21-47
AA-RCD-RP-RAS (cycles) as DDR4-2666              19-19-19-43
AA-RCD-RP-RAS (cycles) as DDR4-2400              17-17-17-39
AA-RCD-RP-RAS (cycles) as DDR4-2133              15-15-15-35
AA-RCD-RP-RAS (cycles) as DDR4-1866              13-13-13-30
AA-RCD-RP-RAS (cycles) as DDR4-1600              11-11-11-26

---=== Timing Parameters ===---
Minimum Cycle Time (tCKmin)                      0.625 ns
Maximum Cycle Time (tCKmax)                      1.600 ns
Minimum CAS Latency Time (tAA)                   13.750 ns
Minimum RAS to CAS Delay (tRCD)                  13.750 ns
Minimum Row Precharge Delay (tRP)                13.750 ns
Minimum Active to Precharge Delay (tRAS)         32.000 ns
Minimum Active to Auto-Refresh Delay (tRC)       45.750 ns
Minimum Recovery Delay (tRFC1)                   350.000 ns
Minimum Recovery Delay (tRFC2)                   260.000 ns
Minimum Recovery Delay (tRFC4)                   160.000 ns
Minimum Four Activate Window Delay (tFAW)        21.000 ns
Minimum Row Active to Row Active Delay (tRRD_S)  2.500 ns
Minimum Row Active to Row Active Delay (tRRD_L)  4.900 ns
Minimum CAS to CAS Delay (tCCD_L)                5.000 ns
Minimum Write Recovery Time (tWR)                15.000 ns
Minimum Write to Read Time (tWTR_S)              2.500 ns
Minimum Write to Read Time (tWTR_L)              7.500 ns

---=== Other Information ===---
Package Type                                     Monolithic
Maximum Activate Count (MAC)                     Unlimited
Post Package Repair                              One row per bank group
Soft PPR                                         Supported
Module Nominal Voltage                           1.2 V
Thermal Sensor                                   No

---=== Physical Characteristics ===---
Module Height                                    32 mm
Module Thickness                                 2 mm front, 1 mm back
Module Reference Card                            A revision 2


Number of SDRAM DIMMs detected and decoded: 2
dolphin@debian:~$ sudo dmidecode -t memory
# dmidecode 3.3
Getting SMBIOS data from sysfs.
SMBIOS 3.1.1 present.

Handle 0x0027, DMI type 16, 23 bytes
Physical Memory Array
        Location: System Board Or Motherboard
        Use: System Memory
        Error Correction Type: None
        Maximum Capacity: 256 GB
        Error Information Handle: 0x0026
        Number Of Devices: 4

Handle 0x002E, DMI type 17, 40 bytes
Memory Device
        Array Handle: 0x0027
        Error Information Handle: 0x002D
        Total Width: Unknown
        Data Width: Unknown
        Size: No Module Installed
        Form Factor: Unknown
        Set: None
        Locator: DIMM 0
        Bank Locator: P0 CHANNEL A
        Type: Unknown
        Type Detail: Unknown
        Speed: Unknown
        Manufacturer: Unknown
        Serial Number: Unknown
        Asset Tag: Not Specified
        Part Number: Unknown
        Rank: Unknown
        Configured Memory Speed: Unknown
        Minimum Voltage: Unknown
        Maximum Voltage: Unknown
        Configured Voltage: Unknown

Handle 0x0030, DMI type 17, 40 bytes
Memory Device
        Array Handle: 0x0027
        Error Information Handle: 0x002F
        Total Width: 64 bits
        Data Width: 64 bits
        Size: 16 GB
        Form Factor: DIMM
        Set: None
        Locator: DIMM 1
        Bank Locator: P0 CHANNEL A
        Type: DDR4
        Type Detail: Synchronous Unbuffered (Unregistered)
        Speed: 2933 MT/s
        Manufacturer: Unknown
        Serial Number: 0718075A
        Asset Tag: Not Specified
        Part Number: APS-M4AGU0N32J-4MB
        Rank: 1
        Configured Memory Speed: 2933 MT/s
        Minimum Voltage: 1.2 V
        Maximum Voltage: 1.2 V
        Configured Voltage: 1.2 V

Handle 0x0033, DMI type 17, 40 bytes
Memory Device
        Array Handle: 0x0027
        Error Information Handle: 0x0032
        Total Width: Unknown
        Data Width: Unknown
        Size: No Module Installed
        Form Factor: Unknown
        Set: None
        Locator: DIMM 0
        Bank Locator: P0 CHANNEL B
        Type: Unknown
        Type Detail: Unknown
        Speed: Unknown
        Manufacturer: Unknown
        Serial Number: Unknown
        Asset Tag: Not Specified
        Part Number: Unknown
        Rank: Unknown
        Configured Memory Speed: Unknown
        Minimum Voltage: Unknown
        Maximum Voltage: Unknown
        Configured Voltage: Unknown

Handle 0x0035, DMI type 17, 40 bytes
Memory Device
        Array Handle: 0x0027
        Error Information Handle: 0x0034
        Total Width: 64 bits
        Data Width: 64 bits
        Size: 16 GB
        Form Factor: DIMM
        Set: None
        Locator: DIMM 1
        Bank Locator: P0 CHANNEL B
        Type: DDR4
        Type Detail: Synchronous Unbuffered (Unregistered)
        Speed: 2933 MT/s
        Manufacturer: Unknown
        Serial Number: 07180882
        Asset Tag: Not Specified
        Part Number: APS-M4AGU0N32J-4MB
        Rank: 1
        Configured Memory Speed: 2933 MT/s
        Minimum Voltage: 1.2 V
        Maximum Voltage: 1.2 V
        Configured Voltage: 1.2 V

```
