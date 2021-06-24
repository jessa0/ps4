VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_7
        SIGNAL MASTER
        SIGNAL XLXN_3
        SIGNAL XLXN_12
        SIGNAL DISPLAY
        SIGNAL XLXN_68
        SIGNAL HZ2
        SIGNAL HZ1
        SIGNAL XLXN_75
        SIGNAL XLXN_79
        SIGNAL XLXN_80
        SIGNAL XLXN_81
        SIGNAL XLXN_82
        SIGNAL XLXN_86
        SIGNAL XLXN_87
        SIGNAL XLXN_88
        SIGNAL XLXN_89
        SIGNAL XLXN_90
        SIGNAL XLXN_91
        SIGNAL XLXN_92
        SIGNAL XLXN_93
        SIGNAL XLXN_94
        SIGNAL XLXN_95
        SIGNAL XLXN_96
        SIGNAL XLXN_97
        SIGNAL XLXN_98
        SIGNAL XLXN_99
        SIGNAL XLXN_100
        SIGNAL XLXN_101
        SIGNAL XLXN_102
        SIGNAL XLXN_103
        SIGNAL XLXN_104
        SIGNAL XLXN_105
        SIGNAL XLXN_106
        SIGNAL XLXN_107
        SIGNAL XLXN_108
        SIGNAL XLXN_109
        SIGNAL XLXN_110
        SIGNAL XLXN_111
        SIGNAL XLXN_112
        SIGNAL XLXN_113
        SIGNAL XLXN_114
        SIGNAL XLXN_137
        SIGNAL XLXN_138
        SIGNAL XLXN_139
        SIGNAL XLXN_140
        SIGNAL XLXN_141
        SIGNAL XLXN_145
        SIGNAL XLXN_146
        SIGNAL XLXN_147
        SIGNAL XLXN_148
        SIGNAL XLXN_149
        SIGNAL XLXN_150
        SIGNAL XLXN_151
        SIGNAL XLXN_152
        SIGNAL XLXN_153
        SIGNAL DEBOUNCE
        PORT Input MASTER
        PORT Output DISPLAY
        PORT Output HZ2
        PORT Output HZ1
        PORT Output DEBOUNCE
        BEGIN BLOCKDEF COUNT2500
            TIMESTAMP 2011 5 2 21 11 20
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            LINE N 320 -96 384 -96 
            LINE N 64 -32 0 -32 
            LINE N 64 -40 72 -32 
            LINE N 72 -32 64 -24 
        END BLOCKDEF
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -32 64 -64 
            LINE N 64 0 64 -32 
            LINE N 96 -64 32 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF ftc
            TIMESTAMP 2000 1 1 10 10 10
            RECTANGLE N 64 -320 320 -64 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            LINE N 384 -256 320 -256 
            LINE N 0 -256 64 -256 
            LINE N 0 -32 64 -32 
            LINE N 0 -128 64 -128 
        END BLOCKDEF
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -64 64 -96 
            LINE N 76 -48 52 -48 
            LINE N 68 -32 60 -32 
            LINE N 88 -64 40 -64 
            LINE N 64 -64 64 -80 
            LINE N 64 -128 64 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF cb4cle
            TIMESTAMP 2000 1 1 10 10 10
            RECTANGLE N 64 -640 320 -64 
            LINE N 0 -256 64 -256 
            LINE N 0 -192 64 -192 
            LINE N 0 -576 64 -576 
            LINE N 0 -512 64 -512 
            LINE N 0 -448 64 -448 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            LINE N 0 -128 64 -128 
            LINE N 0 -32 64 -32 
            LINE N 0 -384 64 -384 
            LINE N 384 -576 320 -576 
            LINE N 384 -512 320 -512 
            LINE N 384 -448 320 -448 
            LINE N 384 -384 320 -384 
            LINE N 384 -192 320 -192 
            LINE N 384 -128 320 -128 
        END BLOCKDEF
        BEGIN BLOCKDEF and9
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 256 -320 192 -320 
            ARC N 96 -368 192 -272 144 -272 144 -368 
            LINE N 144 -272 64 -272 
            LINE N 64 -368 144 -368 
            LINE N 0 -64 64 -64 
            LINE N 0 -512 64 -512 
            LINE N 0 -448 64 -448 
            LINE N 0 -128 64 -128 
            LINE N 0 -256 64 -256 
            LINE N 0 -192 64 -192 
            LINE N 0 -320 64 -320 
            LINE N 0 -384 64 -384 
            LINE N 0 -576 64 -576 
            LINE N 64 -576 64 -64 
        END BLOCKDEF
        BEGIN BLOCK XLXI_3 COUNT2500
            PIN CE XLXN_75
            PIN CEO XLXN_7
            PIN CLK MASTER
        END BLOCK
        BEGIN BLOCK XLXI_2 COUNT2500
            PIN CE XLXN_3
            PIN CEO XLXN_75
            PIN CLK MASTER
        END BLOCK
        BEGIN BLOCK XLXI_4 vcc
            PIN P XLXN_3
        END BLOCK
        BEGIN BLOCK XLXI_8 ftc
            PIN C MASTER
            PIN CLR XLXN_81
            PIN T XLXN_7
            PIN Q XLXN_68
        END BLOCK
        BEGIN BLOCK XLXI_13 gnd
            PIN G XLXN_81
        END BLOCK
        BEGIN BLOCK XLXI_11 ftc
            PIN C XLXN_68
            PIN CLR XLXN_81
            PIN T XLXN_12
            PIN Q HZ2
        END BLOCK
        BEGIN BLOCK XLXI_12 vcc
            PIN P XLXN_12
        END BLOCK
        BEGIN BLOCK XLXI_40 ftc
            PIN C HZ2
            PIN CLR XLXN_81
            PIN T XLXN_12
            PIN Q HZ1
        END BLOCK
        BEGIN BLOCK XLXI_41 cb4cle
            PIN C MASTER
            PIN CE XLXN_75
            PIN CLR XLXN_81
            PIN D0 XLXN_81
            PIN D1 XLXN_81
            PIN D2 XLXN_81
            PIN D3 XLXN_81
            PIN L XLXN_81
            PIN CEO
            PIN Q0
            PIN Q1
            PIN Q2
            PIN Q3 XLXN_79
            PIN TC
        END BLOCK
        BEGIN BLOCK XLXI_42 ftc
            PIN C XLXN_79
            PIN CLR XLXN_81
            PIN T XLXN_80
            PIN Q DISPLAY
        END BLOCK
        BEGIN BLOCK XLXI_43 vcc
            PIN P XLXN_80
        END BLOCK
        BEGIN BLOCK XLXI_49 gnd
            PIN G XLXN_92
        END BLOCK
        BEGIN BLOCK XLXI_57 cb4cle
            PIN C MASTER
            PIN CE XLXN_141
            PIN CLR XLXN_140
            PIN D0 XLXN_92
            PIN D1 XLXN_92
            PIN D2 XLXN_92
            PIN D3 XLXN_92
            PIN L XLXN_92
            PIN CEO XLXN_89
            PIN Q0 XLXN_150
            PIN Q1 XLXN_151
            PIN Q2 XLXN_152
            PIN Q3 XLXN_153
            PIN TC
        END BLOCK
        BEGIN BLOCK XLXI_58 cb4cle
            PIN C MASTER
            PIN CE XLXN_89
            PIN CLR XLXN_140
            PIN D0 XLXN_92
            PIN D1 XLXN_92
            PIN D2 XLXN_92
            PIN D3 XLXN_92
            PIN L XLXN_92
            PIN CEO XLXN_90
            PIN Q0
            PIN Q1
            PIN Q2 XLXN_149
            PIN Q3
            PIN TC
        END BLOCK
        BEGIN BLOCK XLXI_59 cb4cle
            PIN C MASTER
            PIN CE XLXN_90
            PIN CLR XLXN_140
            PIN D0 XLXN_92
            PIN D1 XLXN_92
            PIN D2 XLXN_92
            PIN D3 XLXN_92
            PIN L XLXN_92
            PIN CEO XLXN_91
            PIN Q0 XLXN_147
            PIN Q1 XLXN_148
            PIN Q2
            PIN Q3
            PIN TC
        END BLOCK
        BEGIN BLOCK XLXI_60 cb4cle
            PIN C MASTER
            PIN CE XLXN_91
            PIN CLR XLXN_140
            PIN D0 XLXN_92
            PIN D1 XLXN_92
            PIN D2 XLXN_92
            PIN D3 XLXN_92
            PIN L XLXN_92
            PIN CEO
            PIN Q0
            PIN Q1
            PIN Q2 XLXN_146
            PIN Q3 XLXN_145
            PIN TC
        END BLOCK
        BEGIN BLOCK XLXI_61 and9
            PIN I0 XLXN_153
            PIN I1 XLXN_152
            PIN I2 XLXN_151
            PIN I3 XLXN_150
            PIN I4 XLXN_149
            PIN I5 XLXN_148
            PIN I6 XLXN_147
            PIN I7 XLXN_145
            PIN I8 XLXN_146
            PIN O XLXN_140
        END BLOCK
        BEGIN BLOCK XLXI_63 ftc
            PIN C XLXN_140
            PIN CLR XLXN_139
            PIN T XLXN_138
            PIN Q DEBOUNCE
        END BLOCK
        BEGIN BLOCK XLXI_65 vcc
            PIN P XLXN_138
        END BLOCK
        BEGIN BLOCK XLXI_66 gnd
            PIN G XLXN_139
        END BLOCK
        BEGIN BLOCK XLXI_67 vcc
            PIN P XLXN_141
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 7609 5382
        ATTR LengthUnitName "CM"
        ATTR GridsPerUnit "4"
        IOMARKER 160 640 MASTER R180 28
        BEGIN BRANCH XLXN_7
            WIRE 1344 768 1360 768
        END BRANCH
        BEGIN BRANCH XLXN_3
            WIRE 464 768 480 768
        END BRANCH
        BEGIN INSTANCE XLXI_2 480 864 R0
        END INSTANCE
        INSTANCE XLXI_4 464 832 R270
        BEGIN INSTANCE XLXI_3 960 864 R0
        END INSTANCE
        INSTANCE XLXI_8 1360 1024 R0
        INSTANCE XLXI_13 1136 1056 R90
        INSTANCE XLXI_11 1936 1024 R0
        INSTANCE XLXI_12 1792 608 R270
        BEGIN BRANCH DISPLAY
            WIRE 2352 1376 3120 1376
        END BRANCH
        BEGIN BRANCH XLXN_12
            WIRE 1792 544 1872 544
            WIRE 1872 544 1872 768
            WIRE 1872 768 1936 768
            WIRE 1872 544 2496 544
            WIRE 2496 544 2496 768
            WIRE 2496 768 2528 768
        END BRANCH
        BEGIN BRANCH XLXN_68
            WIRE 1744 768 1840 768
            WIRE 1840 768 1840 896
            WIRE 1840 896 1936 896
        END BRANCH
        IOMARKER 2576 496 HZ2 R0 28
        BEGIN BRANCH HZ2
            WIRE 2320 768 2416 768
            WIRE 2416 768 2416 896
            WIRE 2416 896 2528 896
            WIRE 2416 496 2576 496
            WIRE 2416 496 2416 768
        END BRANCH
        INSTANCE XLXI_40 2528 1024 R0
        BEGIN BRANCH HZ1
            WIRE 2912 768 3136 768
        END BRANCH
        IOMARKER 3136 768 HZ1 R0 28
        INSTANCE XLXI_41 1408 1888 R0
        BEGIN BRANCH XLXN_75
            WIRE 864 768 928 768
            WIRE 928 768 960 768
            WIRE 928 768 928 1696
            WIRE 928 1696 1408 1696
        END BRANCH
        INSTANCE XLXI_42 1968 1632 R0
        BEGIN BRANCH XLXN_79
            WIRE 1792 1504 1968 1504
        END BRANCH
        INSTANCE XLXI_43 1840 1280 R0
        BEGIN BRANCH XLXN_80
            WIRE 1904 1280 1904 1376
            WIRE 1904 1376 1968 1376
        END BRANCH
        BEGIN BRANCH XLXN_81
            WIRE 1264 1120 1360 1120
            WIRE 1360 1120 1360 1312
            WIRE 1360 1312 1360 1376
            WIRE 1360 1376 1360 1440
            WIRE 1360 1440 1360 1504
            WIRE 1360 1504 1360 1632
            WIRE 1360 1632 1408 1632
            WIRE 1360 1632 1360 1856
            WIRE 1360 1856 1408 1856
            WIRE 1360 1504 1408 1504
            WIRE 1360 1440 1408 1440
            WIRE 1360 1376 1408 1376
            WIRE 1360 1312 1408 1312
            WIRE 1360 1120 1856 1120
            WIRE 1856 1120 1936 1120
            WIRE 1936 1120 2528 1120
            WIRE 1856 1120 1856 1600
            WIRE 1856 1600 1968 1600
            WIRE 1360 992 1360 1120
            WIRE 1936 992 1936 1120
            WIRE 2528 992 2528 1120
        END BRANCH
        IOMARKER 3120 1376 DISPLAY R0 28
        BEGIN BRANCH MASTER
            WIRE 160 640 320 640
            WIRE 320 640 320 832
            WIRE 320 832 480 832
            WIRE 320 832 320 896
            WIRE 320 896 896 896
            WIRE 896 896 1360 896
            WIRE 896 896 896 1760
            WIRE 896 1760 1408 1760
            WIRE 320 896 320 2112
            WIRE 320 2112 752 2112
            WIRE 752 2112 752 2928
            WIRE 752 2928 2000 2928
            WIRE 2000 2928 2000 3344
            WIRE 2000 2928 3136 2928
            WIRE 3136 2928 3136 3328
            WIRE 3136 2928 4240 2928
            WIRE 4240 2928 4240 3312
            WIRE 752 2928 752 3328
            WIRE 896 832 960 832
            WIRE 896 832 896 896
        END BRANCH
        BEGIN BRANCH XLXN_89
            WIRE 816 3712 816 3776
            WIRE 816 3776 1344 3776
            WIRE 1344 3248 1344 3776
            WIRE 1344 3248 2064 3248
            WIRE 2064 3248 2064 3344
        END BRANCH
        BEGIN BRANCH XLXN_90
            WIRE 2064 3728 2064 3792
            WIRE 2064 3792 2592 3792
            WIRE 2592 3264 2592 3792
            WIRE 2592 3264 3200 3264
            WIRE 3200 3264 3200 3328
        END BRANCH
        BEGIN BRANCH XLXN_91
            WIRE 3200 3712 3200 3792
            WIRE 3200 3792 3712 3792
            WIRE 3712 3248 3712 3792
            WIRE 3712 3248 4304 3248
            WIRE 4304 3248 4304 3312
        END BRANCH
        INSTANCE XLXI_49 320 3120 R90
        INSTANCE XLXI_57 624 3328 R90
        INSTANCE XLXI_58 1872 3344 R90
        INSTANCE XLXI_59 3008 3328 R90
        INSTANCE XLXI_60 4112 3312 R90
        INSTANCE XLXI_61 4832 4560 R0
        INSTANCE XLXI_63 5280 4368 R0
        INSTANCE XLXI_65 5264 4176 R270
        BEGIN BRANCH XLXN_138
            WIRE 5264 4112 5280 4112
        END BRANCH
        BEGIN BRANCH XLXN_139
            WIRE 5248 4336 5280 4336
        END BRANCH
        INSTANCE XLXI_66 5120 4272 R90
        BEGIN BRANCH XLXN_92
            WIRE 448 3184 880 3184
            WIRE 880 3184 880 3328
            WIRE 880 3184 1008 3184
            WIRE 1008 3184 1008 3328
            WIRE 1008 3184 1072 3184
            WIRE 1072 3184 1072 3328
            WIRE 1072 3184 1136 3184
            WIRE 1136 3184 1136 3328
            WIRE 1136 3184 1200 3184
            WIRE 1200 3184 1200 3328
            WIRE 1200 3184 2128 3184
            WIRE 2128 3184 2128 3344
            WIRE 2128 3184 2256 3184
            WIRE 2256 3184 2256 3344
            WIRE 2256 3184 2320 3184
            WIRE 2320 3184 2320 3344
            WIRE 2320 3184 2384 3184
            WIRE 2384 3184 2384 3344
            WIRE 2384 3184 2448 3184
            WIRE 2448 3184 2448 3344
            WIRE 2448 3184 3264 3184
            WIRE 3264 3184 3264 3328
            WIRE 3264 3184 3392 3184
            WIRE 3392 3184 3392 3328
            WIRE 3392 3184 3456 3184
            WIRE 3456 3184 3456 3328
            WIRE 3456 3184 3520 3184
            WIRE 3520 3184 3520 3328
            WIRE 3520 3184 3584 3184
            WIRE 3584 3184 3584 3328
            WIRE 3584 3184 4368 3184
            WIRE 4368 3184 4368 3312
            WIRE 4368 3184 4496 3184
            WIRE 4496 3184 4496 3312
            WIRE 4496 3184 4560 3184
            WIRE 4560 3184 4560 3312
            WIRE 4560 3184 4624 3184
            WIRE 4624 3184 4624 3312
            WIRE 4624 3184 4688 3184
            WIRE 4688 3184 4688 3312
        END BRANCH
        BEGIN BRANCH XLXN_140
            WIRE 656 3056 1904 3056
            WIRE 1904 3056 3040 3056
            WIRE 3040 3056 4144 3056
            WIRE 4144 3056 5120 3056
            WIRE 5120 3056 5120 4240
            WIRE 5120 4240 5280 4240
            WIRE 4144 3056 4144 3312
            WIRE 3040 3056 3040 3328
            WIRE 1904 3056 1904 3344
            WIRE 656 3056 656 3328
            WIRE 5088 4240 5120 4240
        END BRANCH
        BEGIN BRANCH XLXN_141
            WIRE 816 3296 816 3328
        END BRANCH
        INSTANCE XLXI_67 752 3296 R0
        BEGIN BRANCH XLXN_145
            WIRE 4496 3696 4496 4048
            WIRE 4496 4048 4832 4048
        END BRANCH
        BEGIN BRANCH XLXN_146
            WIRE 4560 3696 4560 3984
            WIRE 4560 3984 4832 3984
        END BRANCH
        BEGIN BRANCH XLXN_147
            WIRE 3584 3712 3584 4112
            WIRE 3584 4112 4832 4112
        END BRANCH
        BEGIN BRANCH XLXN_148
            WIRE 3520 3712 3520 4176
            WIRE 3520 4176 4832 4176
        END BRANCH
        BEGIN BRANCH XLXN_149
            WIRE 2320 3728 2320 4240
            WIRE 2320 4240 4832 4240
        END BRANCH
        BEGIN BRANCH XLXN_150
            WIRE 1200 3712 1200 4304
            WIRE 1200 4304 4832 4304
        END BRANCH
        BEGIN BRANCH XLXN_151
            WIRE 1136 3712 1136 4368
            WIRE 1136 4368 4832 4368
        END BRANCH
        BEGIN BRANCH XLXN_152
            WIRE 1072 3712 1072 4432
            WIRE 1072 4432 4832 4432
        END BRANCH
        BEGIN BRANCH XLXN_153
            WIRE 1008 3712 1008 4496
            WIRE 1008 4496 4832 4496
        END BRANCH
        BEGIN BRANCH DEBOUNCE
            WIRE 5664 4112 5824 4112
        END BRANCH
        IOMARKER 5824 4112 DEBOUNCE R0 28
    END SHEET
END SCHEMATIC
