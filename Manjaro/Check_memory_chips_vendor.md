## Check memory infomation

```
sudo pacman -S i2c-tools
decode-dimms
```

It prints
```
# decode-dimms version 4.3

Memory Serial Presence Detect Decoder
By Philip Edelbrock, Christian Zuckschwerdt, Burkart Lingner,
Jean Delvare, Trent Piepho and others


Decoding EEPROM: /sys/bus/i2c/drivers/ee1004/12-0050
Guessing DIMM is in                              bank 1
Kernel driver used                               ee1004

---=== SPD EEPROM Information ===---
EEPROM CRC of bytes 0-125                        OK (0x65CE)
# of bytes written to SDRAM EEPROM               384
Total number of bytes in EEPROM                  512
Fundamental Memory type                          DDR4 SDRAM
SPD Revision                                     1.1
Module Type                                      UDIMM
EEPROM CRC of bytes 128-253                      OK (0x58B6)

---=== Memory Characteristics ===---
Maximum module speed                             2400 MT/s (PC4-19200)
Size                                             8192 MB
Banks x Rows x Columns x Bits                    16 x 16 x 10 x 64
SDRAM Device Width                               8 bits
Ranks                                            1
Primary Bus Width                                64 bits
AA-RCD-RP-RAS (cycles)                           17-17-17-39
Supported CAS Latencies                          18T, 17T, 16T, 15T, 14T, 13T, 12T, 11T, 10T

---=== Timings at Standard Speeds ===---
AA-RCD-RP-RAS (cycles) as DDR4-2400              17-17-17-39
AA-RCD-RP-RAS (cycles) as DDR4-2133              15-15-15-35
AA-RCD-RP-RAS (cycles) as DDR4-1866              13-13-13-30
AA-RCD-RP-RAS (cycles) as DDR4-1600              11-11-11-26

---=== Timing Parameters ===---
Minimum Cycle Time (tCKmin)                      0.833 ns
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
Minimum Row Active to Row Active Delay (tRRD_S)  3.300 ns
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
Module Thickness                                 2 mm front, 2 mm back
Module Reference Card                            A revision 0

---=== Manufacturer Data ===---
Module Manufacturer                              Gloway International Co. Ltd
DRAM Manufacturer                                Micron Technology
Manufacturing Date                               2021-W50
Assembly Serial Number                           0x316B4A66
Part Number                                      TAC4U3200E16081C


Decoding EEPROM: /sys/bus/i2c/drivers/ee1004/12-0051
Guessing DIMM is in                              bank 2
Kernel driver used                               ee1004

---=== SPD EEPROM Information ===---
EEPROM CRC of bytes 0-125                        OK (0x65CE)
# of bytes written to SDRAM EEPROM               384
Total number of bytes in EEPROM                  512
Fundamental Memory type                          DDR4 SDRAM
SPD Revision                                     1.1
Module Type                                      UDIMM
EEPROM CRC of bytes 128-253                      OK (0x58B6)

---=== Memory Characteristics ===---
Maximum module speed                             2400 MT/s (PC4-19200)
Size                                             8192 MB
Banks x Rows x Columns x Bits                    16 x 16 x 10 x 64
SDRAM Device Width                               8 bits
Ranks                                            1
Primary Bus Width                                64 bits
AA-RCD-RP-RAS (cycles)                           17-17-17-39
Supported CAS Latencies                          18T, 17T, 16T, 15T, 14T, 13T, 12T, 11T, 10T

---=== Timings at Standard Speeds ===---
AA-RCD-RP-RAS (cycles) as DDR4-2400              17-17-17-39
AA-RCD-RP-RAS (cycles) as DDR4-2133              15-15-15-35
AA-RCD-RP-RAS (cycles) as DDR4-1866              13-13-13-30
AA-RCD-RP-RAS (cycles) as DDR4-1600              11-11-11-26

---=== Timing Parameters ===---
Minimum Cycle Time (tCKmin)                      0.833 ns
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
Minimum Row Active to Row Active Delay (tRRD_S)  3.300 ns
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
Module Thickness                                 2 mm front, 2 mm back
Module Reference Card                            A revision 0

---=== Manufacturer Data ===---
Module Manufacturer                              Gloway International Co. Ltd
DRAM Manufacturer                                Micron Technology
Manufacturing Date                               2021-W50
Assembly Serial Number                           0x316B4A46
Part Number                                      TAC4U3200E16081C


Decoding EEPROM: /sys/bus/i2c/drivers/ee1004/12-0052
Guessing DIMM is in                              bank 3
Kernel driver used                               ee1004

---=== SPD EEPROM Information ===---
EEPROM CRC of bytes 0-125                        OK (0x65CE)
# of bytes written to SDRAM EEPROM               384
Total number of bytes in EEPROM                  512
Fundamental Memory type                          DDR4 SDRAM
SPD Revision                                     1.1
Module Type                                      UDIMM
EEPROM CRC of bytes 128-253                      OK (0x58B6)

---=== Memory Characteristics ===---
Maximum module speed                             2400 MT/s (PC4-19200)
Size                                             8192 MB
Banks x Rows x Columns x Bits                    16 x 16 x 10 x 64
SDRAM Device Width                               8 bits
Ranks                                            1
Primary Bus Width                                64 bits
AA-RCD-RP-RAS (cycles)                           17-17-17-39
Supported CAS Latencies                          18T, 17T, 16T, 15T, 14T, 13T, 12T, 11T, 10T

---=== Timings at Standard Speeds ===---
AA-RCD-RP-RAS (cycles) as DDR4-2400              17-17-17-39
AA-RCD-RP-RAS (cycles) as DDR4-2133              15-15-15-35
AA-RCD-RP-RAS (cycles) as DDR4-1866              13-13-13-30
AA-RCD-RP-RAS (cycles) as DDR4-1600              11-11-11-26

---=== Timing Parameters ===---
Minimum Cycle Time (tCKmin)                      0.833 ns
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
Minimum Row Active to Row Active Delay (tRRD_S)  3.300 ns
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
Module Thickness                                 2 mm front, 2 mm back
Module Reference Card                            A revision 0

---=== Manufacturer Data ===---
Module Manufacturer                              Gloway International Co. Ltd
DRAM Manufacturer                                Micron Technology
Manufacturing Date                               2021-W50
Assembly Serial Number                           0x316B4A39
Part Number                                      TAC4U3200E16081C


Decoding EEPROM: /sys/bus/i2c/drivers/ee1004/12-0053
Guessing DIMM is in                              bank 4
Kernel driver used                               ee1004

---=== SPD EEPROM Information ===---
EEPROM CRC of bytes 0-125                        OK (0x65CE)
# of bytes written to SDRAM EEPROM               384
Total number of bytes in EEPROM                  512
Fundamental Memory type                          DDR4 SDRAM
SPD Revision                                     1.1
Module Type                                      UDIMM
EEPROM CRC of bytes 128-253                      OK (0x58B6)

---=== Memory Characteristics ===---
Maximum module speed                             2400 MT/s (PC4-19200)
Size                                             8192 MB
Banks x Rows x Columns x Bits                    16 x 16 x 10 x 64
SDRAM Device Width                               8 bits
Ranks                                            1
Primary Bus Width                                64 bits
AA-RCD-RP-RAS (cycles)                           17-17-17-39
Supported CAS Latencies                          18T, 17T, 16T, 15T, 14T, 13T, 12T, 11T, 10T

---=== Timings at Standard Speeds ===---
AA-RCD-RP-RAS (cycles) as DDR4-2400              17-17-17-39
AA-RCD-RP-RAS (cycles) as DDR4-2133              15-15-15-35
AA-RCD-RP-RAS (cycles) as DDR4-1866              13-13-13-30
AA-RCD-RP-RAS (cycles) as DDR4-1600              11-11-11-26

---=== Timing Parameters ===---
Minimum Cycle Time (tCKmin)                      0.833 ns
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
Minimum Row Active to Row Active Delay (tRRD_S)  3.300 ns
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
Module Thickness                                 2 mm front, 2 mm back
Module Reference Card                            A revision 0

---=== Manufacturer Data ===---
Module Manufacturer                              Gloway International Co. Ltd
DRAM Manufacturer                                Micron Technology
Manufacturing Date                               2021-W50
Assembly Serial Number                           0x316B4A5E
Part Number                                      TAC4U3200E16081C


Number of SDRAM DIMMs detected and decoded: 4
```
