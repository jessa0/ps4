VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        BEGIN SIGNAL P(4)
        END SIGNAL
        SIGNAL SEL0
        SIGNAL SEL1
        SIGNAL XLXN_45
        SIGNAL XLXN_46
        SIGNAL XLXN_47
        SIGNAL XLXN_48
        SIGNAL W3
        SIGNAL W2
        SIGNAL W0
        SIGNAL W1
        SIGNAL Q(7:0)
        SIGNAL P(7:0)
        SIGNAL Q(0)
        SIGNAL Q(4)
        SIGNAL P(0)
        SIGNAL Q(1)
        SIGNAL Q(5)
        SIGNAL P(1)
        SIGNAL P(5)
        SIGNAL Q(2)
        SIGNAL Q(6)
        SIGNAL P(2)
        SIGNAL P(6)
        SIGNAL Q(3)
        SIGNAL Q(7)
        SIGNAL P(3)
        SIGNAL P(7)
        PORT Input SEL0
        PORT Input SEL1
        PORT Output W3
        PORT Output W2
        PORT Output W0
        PORT Output W1
        PORT Input Q(7:0)
        PORT Input P(7:0)
        BEGIN BLOCKDEF m4_1e
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -416 96 -416 
            LINE N 0 -352 96 -352 
            LINE N 0 -288 96 -288 
            LINE N 0 -224 96 -224 
            LINE N 0 -32 96 -32 
            LINE N 320 -320 256 -320 
            LINE N 0 -160 96 -160 
            LINE N 0 -96 96 -96 
            LINE N 176 -96 96 -96 
            LINE N 176 -208 176 -96 
            LINE N 224 -32 96 -32 
            LINE N 224 -216 224 -32 
            LINE N 256 -224 96 -192 
            LINE N 256 -416 256 -224 
            LINE N 96 -448 256 -416 
            LINE N 96 -192 96 -448 
            LINE N 128 -160 96 -160 
            LINE N 128 -200 128 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -32 64 -64 
            LINE N 64 0 64 -32 
            LINE N 96 -64 32 -64 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 m4_1e
            PIN D0 Q(0)
            PIN D1 Q(4)
            PIN D2 P(0)
            PIN D3 P(4)
            PIN E XLXN_45
            PIN S0 SEL0
            PIN S1 SEL1
            PIN O W0
        END BLOCK
        BEGIN BLOCK XLXI_3 m4_1e
            PIN D0 Q(2)
            PIN D1 Q(6)
            PIN D2 P(2)
            PIN D3 P(6)
            PIN E XLXN_47
            PIN S0 SEL0
            PIN S1 SEL1
            PIN O W2
        END BLOCK
        BEGIN BLOCK XLXI_4 m4_1e
            PIN D0 Q(3)
            PIN D1 Q(7)
            PIN D2 P(3)
            PIN D3 P(7)
            PIN E XLXN_48
            PIN S0 SEL0
            PIN S1 SEL1
            PIN O W3
        END BLOCK
        BEGIN BLOCK XLXI_6 vcc
            PIN P XLXN_45
        END BLOCK
        BEGIN BLOCK XLXI_7 vcc
            PIN P XLXN_46
        END BLOCK
        BEGIN BLOCK XLXI_8 vcc
            PIN P XLXN_47
        END BLOCK
        BEGIN BLOCK XLXI_9 vcc
            PIN P XLXN_48
        END BLOCK
        BEGIN BLOCK XLXI_2 m4_1e
            PIN D0 Q(1)
            PIN D1 Q(5)
            PIN D2 P(1)
            PIN D3 P(5)
            PIN E XLXN_46
            PIN S0 SEL0
            PIN S1 SEL1
            PIN O W1
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_1 2624 928 R0
        INSTANCE XLXI_3 2624 1872 R0
        INSTANCE XLXI_4 2624 2352 R0
        BEGIN BRANCH P(4)
            WIRE 1504 688 2464 688
            WIRE 2464 688 2464 704
            WIRE 2464 704 2624 704
            BEGIN DISPLAY 2464 704 ATTR Name
                ALIGNMENT SOFT-TCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_45
            WIRE 2592 896 2624 896
        END BRANCH
        INSTANCE XLXI_6 2592 960 R270
        INSTANCE XLXI_7 2592 1424 R270
        BEGIN BRANCH XLXN_47
            WIRE 2592 1840 2624 1840
        END BRANCH
        INSTANCE XLXI_8 2592 1904 R270
        BEGIN BRANCH XLXN_48
            WIRE 2592 2320 2624 2320
        END BRANCH
        INSTANCE XLXI_9 2592 2384 R270
        BEGIN BRANCH W3
            WIRE 2944 2032 3104 2032
        END BRANCH
        BEGIN BRANCH W2
            WIRE 2944 1552 3104 1552
        END BRANCH
        BEGIN BRANCH W0
            WIRE 2944 608 3104 608
        END BRANCH
        IOMARKER 3104 2032 W3 R0 28
        IOMARKER 3104 1552 W2 R0 28
        IOMARKER 3104 608 W0 R0 28
        IOMARKER 3104 1072 W1 R0 28
        IOMARKER 576 768 SEL0 R180 28
        IOMARKER 576 832 SEL1 R180 28
        BEGIN BRANCH Q(7:0)
            WIRE 1712 208 1712 512
            WIRE 1712 512 1712 576
            WIRE 1712 576 1712 976
            WIRE 1712 976 1712 1040
            WIRE 1712 1040 1712 1456
            WIRE 1712 1456 1712 1520
            WIRE 1712 1520 1712 1936
            WIRE 1712 1936 1712 2000
            WIRE 1712 2000 1712 2016
        END BRANCH
        BEGIN BRANCH P(7:0)
            WIRE 1408 208 1408 624
            WIRE 1408 624 1408 688
            WIRE 1408 688 1408 1104
            WIRE 1408 1104 1408 1168
            WIRE 1408 1168 1408 1584
            WIRE 1408 1584 1408 1648
            WIRE 1408 1648 1408 2064
            WIRE 1408 2064 1408 2128
            WIRE 1408 2128 1408 2144
        END BRANCH
        BUSTAP 1712 512 1808 512
        BUSTAP 1712 576 1808 576
        BUSTAP 1408 624 1504 624
        BUSTAP 1408 688 1504 688
        IOMARKER 1712 208 Q(7:0) R270 28
        IOMARKER 1408 208 P(7:0) R270 28
        BEGIN BRANCH Q(0)
            WIRE 1808 512 2624 512
        END BRANCH
        BEGIN BRANCH Q(4)
            WIRE 1808 576 2624 576
        END BRANCH
        BEGIN BRANCH P(0)
            WIRE 1504 624 2064 624
            WIRE 2064 624 2064 640
            WIRE 2064 640 2624 640
        END BRANCH
        BEGIN BRANCH Q(1)
            WIRE 1808 976 2624 976
        END BRANCH
        BEGIN BRANCH P(1)
            WIRE 1504 1104 2624 1104
        END BRANCH
        BEGIN BRANCH Q(2)
            WIRE 1808 1456 2624 1456
        END BRANCH
        BEGIN BRANCH Q(6)
            WIRE 1808 1520 2624 1520
        END BRANCH
        BEGIN BRANCH P(2)
            WIRE 1504 1584 2624 1584
        END BRANCH
        BEGIN BRANCH P(6)
            WIRE 1504 1648 2624 1648
        END BRANCH
        BEGIN BRANCH Q(3)
            WIRE 1808 1936 2624 1936
        END BRANCH
        BEGIN BRANCH Q(7)
            WIRE 1808 2000 2624 2000
        END BRANCH
        BEGIN BRANCH P(3)
            WIRE 1504 2064 2624 2064
        END BRANCH
        BEGIN BRANCH P(7)
            WIRE 1504 2128 2624 2128
        END BRANCH
        BUSTAP 1712 976 1808 976
        BUSTAP 1712 1040 1808 1040
        BUSTAP 1408 1104 1504 1104
        BUSTAP 1408 1168 1504 1168
        BUSTAP 1712 1456 1808 1456
        BUSTAP 1712 1520 1808 1520
        BUSTAP 1408 1584 1504 1584
        BUSTAP 1408 1648 1504 1648
        BUSTAP 1712 1936 1808 1936
        BUSTAP 1712 2000 1808 2000
        BUSTAP 1408 2064 1504 2064
        BUSTAP 1408 2128 1504 2128
        BEGIN BRANCH W1
            WIRE 2944 1072 3088 1072
            WIRE 3088 1072 3104 1072
        END BRANCH
        BEGIN BRANCH XLXN_46
            WIRE 2592 1360 2608 1360
            WIRE 2608 1360 2624 1360
        END BRANCH
        BEGIN BRANCH SEL1
            WIRE 576 832 2224 832
            WIRE 2224 832 2624 832
            WIRE 2224 832 2224 1296
            WIRE 2224 1296 2224 1776
            WIRE 2224 1776 2624 1776
            WIRE 2224 1776 2224 2256
            WIRE 2224 2256 2624 2256
            WIRE 2224 1296 2624 1296
        END BRANCH
        BEGIN BRANCH SEL0
            WIRE 576 768 2288 768
            WIRE 2288 768 2624 768
            WIRE 2288 768 2288 1232
            WIRE 2288 1232 2288 1712
            WIRE 2288 1712 2624 1712
            WIRE 2288 1712 2288 2192
            WIRE 2288 2192 2624 2192
            WIRE 2288 1232 2624 1232
        END BRANCH
        BEGIN BRANCH P(5)
            WIRE 1504 1168 2624 1168
        END BRANCH
        BEGIN BRANCH Q(5)
            WIRE 1808 1040 2624 1040
        END BRANCH
        INSTANCE XLXI_2 2624 1392 R0
    END SHEET
END SCHEMATIC