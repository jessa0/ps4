VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL CLK
        SIGNAL CEO
        SIGNAL XLXN_14
        SIGNAL XLXN_16
        SIGNAL XLXN_17
        SIGNAL CE
        SIGNAL XLXN_20
        SIGNAL XLXN_21
        SIGNAL XLXN_23
        SIGNAL XLXN_24
        SIGNAL XLXN_25
        SIGNAL XLXN_26
        SIGNAL XLXN_27
        SIGNAL XLXN_29
        SIGNAL XLXN_30
        SIGNAL XLXN_49
        SIGNAL XLXN_50
        SIGNAL XLXN_51
        SIGNAL XLXN_52
        SIGNAL XLXN_55
        SIGNAL XLXN_56
        SIGNAL XLXN_59
        SIGNAL XLXN_60
        SIGNAL XLXN_61
        SIGNAL XLXN_22
        SIGNAL XLXN_64
        SIGNAL XLXN_65
        SIGNAL XLXN_66
        PORT Input CLK
        PORT Output CEO
        PORT Input CE
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
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -64 64 -96 
            LINE N 76 -48 52 -48 
            LINE N 68 -32 60 -32 
            LINE N 88 -64 40 -64 
            LINE N 64 -64 64 -80 
            LINE N 64 -128 64 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF fd
            TIMESTAMP 2000 1 1 10 10 10
            RECTANGLE N 64 -320 320 -64 
            LINE N 0 -128 64 -128 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
        END BLOCKDEF
        BEGIN BLOCKDEF and6
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 0 -192 64 -192 
            LINE N 0 -256 64 -256 
            LINE N 0 -320 64 -320 
            LINE N 0 -384 64 -384 
            LINE N 256 -224 192 -224 
            LINE N 64 -272 144 -272 
            LINE N 144 -176 64 -176 
            ARC N 96 -272 192 -176 144 -176 144 -272 
            LINE N 64 -64 64 -384 
        END BLOCKDEF
        BEGIN BLOCK XLXI_6 cb4cle
            PIN C CLK
            PIN CE XLXN_29
            PIN CLR CEO
            PIN D0 XLXN_22
            PIN D1 XLXN_22
            PIN D2 XLXN_22
            PIN D3 XLXN_22
            PIN L XLXN_22
            PIN CEO XLXN_30
            PIN Q0
            PIN Q1
            PIN Q2 XLXN_51
            PIN Q3 XLXN_52
            PIN TC
        END BLOCK
        BEGIN BLOCK XLXI_7 cb4cle
            PIN C CLK
            PIN CE XLXN_30
            PIN CLR CEO
            PIN D0 XLXN_22
            PIN D1 XLXN_22
            PIN D2 XLXN_22
            PIN D3 XLXN_22
            PIN L XLXN_22
            PIN CEO
            PIN Q0 XLXN_49
            PIN Q1
            PIN Q2
            PIN Q3 XLXN_50
            PIN TC
        END BLOCK
        BEGIN BLOCK XLXI_8 gnd
            PIN G XLXN_22
        END BLOCK
        BEGIN BLOCK XLXI_5 cb4cle
            PIN C CLK
            PIN CE CE
            PIN CLR CEO
            PIN D0 XLXN_22
            PIN D1 XLXN_22
            PIN D2 XLXN_22
            PIN D3 XLXN_22
            PIN L XLXN_22
            PIN CEO XLXN_29
            PIN Q0 XLXN_65
            PIN Q1 XLXN_66
            PIN Q2
            PIN Q3
            PIN TC
        END BLOCK
        BEGIN BLOCK XLXI_14 fd
            PIN C CLK
            PIN D XLXN_56
            PIN Q CEO
        END BLOCK
        BEGIN BLOCK XLXI_15 and6
            PIN I0 XLXN_66
            PIN I1 XLXN_65
            PIN I2 XLXN_52
            PIN I3 XLXN_51
            PIN I4 XLXN_50
            PIN I5 XLXN_49
            PIN O XLXN_56
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 7609 5382
        ATTR LengthUnitName "CM"
        ATTR GridsPerUnit "4"
        IOMARKER 640 640 CLK R180 28
        INSTANCE XLXI_6 3408 736 R90
        INSTANCE XLXI_7 5104 720 R90
        IOMARKER 640 560 CE R180 28
        BEGIN BRANCH XLXN_30
            WIRE 3600 1120 3600 1184
            WIRE 3600 1184 4240 1184
            WIRE 4240 656 5296 656
            WIRE 5296 656 5296 720
            WIRE 4240 656 4240 1184
        END BRANCH
        BEGIN BRANCH XLXN_29
            WIRE 1904 1088 1904 1168
            WIRE 1904 1168 2432 1168
            WIRE 2432 672 3600 672
            WIRE 3600 672 3600 736
            WIRE 2432 672 2432 1168
        END BRANCH
        BEGIN BRANCH CE
            WIRE 640 560 1904 560
            WIRE 1904 560 1904 704
        END BRANCH
        INSTANCE XLXI_5 1712 704 R90
        BEGIN BRANCH XLXN_49
            WIRE 5680 1104 5680 1344
            WIRE 5680 1344 5920 1344
        END BRANCH
        BEGIN BRANCH XLXN_50
            WIRE 5488 1104 5488 1408
            WIRE 5488 1408 5920 1408
        END BRANCH
        BEGIN BRANCH XLXN_51
            WIRE 3856 1120 3856 1472
            WIRE 3856 1472 5920 1472
        END BRANCH
        BEGIN BRANCH XLXN_52
            WIRE 3792 1120 3792 1536
            WIRE 3792 1536 5920 1536
        END BRANCH
        BEGIN BRANCH CEO
            WIRE 1744 512 3440 512
            WIRE 3440 512 5136 512
            WIRE 5136 512 6960 512
            WIRE 6960 512 7376 512
            WIRE 6960 512 6960 1504
            WIRE 5136 512 5136 720
            WIRE 3440 512 3440 736
            WIRE 1744 512 1744 704
            WIRE 6896 1504 6960 1504
        END BRANCH
        BEGIN BRANCH XLXN_56
            WIRE 6176 1504 6512 1504
        END BRANCH
        IOMARKER 7376 512 CEO R0 28
        BEGIN BRANCH XLXN_22
            WIRE 1968 400 1968 544
            WIRE 1968 544 1968 704
            WIRE 1968 544 2096 544
            WIRE 2096 544 2096 704
            WIRE 2096 544 2160 544
            WIRE 2160 544 2160 704
            WIRE 2160 544 2224 544
            WIRE 2224 544 2224 704
            WIRE 2224 544 2288 544
            WIRE 2288 544 2288 704
            WIRE 2288 544 3664 544
            WIRE 3664 544 3664 736
            WIRE 3664 544 3792 544
            WIRE 3792 544 3856 544
            WIRE 3856 544 3856 736
            WIRE 3856 544 3920 544
            WIRE 3920 544 3920 736
            WIRE 3920 544 3984 544
            WIRE 3984 544 3984 736
            WIRE 3984 544 5360 544
            WIRE 5360 544 5488 544
            WIRE 5488 544 5488 720
            WIRE 5488 544 5552 544
            WIRE 5552 544 5552 720
            WIRE 5552 544 5616 544
            WIRE 5616 544 5616 720
            WIRE 5616 544 5680 544
            WIRE 5680 544 5680 720
            WIRE 5360 544 5360 720
            WIRE 3792 544 3792 736
        END BRANCH
        INSTANCE XLXI_8 2032 272 R180
        INSTANCE XLXI_15 5920 1728 R0
        INSTANCE XLXI_14 6512 1760 R0
        BEGIN BRANCH CLK
            WIRE 640 640 1840 640
            WIRE 1840 640 1840 704
            WIRE 1840 640 3536 640
            WIRE 3536 640 3536 736
            WIRE 3536 640 5232 640
            WIRE 5232 640 5232 720
            WIRE 5232 640 6240 640
            WIRE 6240 640 6240 1632
            WIRE 6240 1632 6512 1632
            WIRE 640 640 6240 640
        END BRANCH
        BEGIN BRANCH XLXN_65
            WIRE 2288 1088 2288 1600
            WIRE 2288 1600 5920 1600
        END BRANCH
        BEGIN BRANCH XLXN_66
            WIRE 2224 1088 2224 1664
            WIRE 2224 1664 5920 1664
        END BRANCH
    END SHEET
END SCHEMATIC
