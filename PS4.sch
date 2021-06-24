VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_1
        SIGNAL XLXN_2(17:0)
        SIGNAL XLXN_3(29:0)
        SIGNAL XLXN_4
        SIGNAL XLXN_5(7:0)
        SIGNAL XLXN_6(7:0)
        SIGNAL XLXN_7
        SIGNAL XLXN_8
        SIGNAL XLXN_9
        SIGNAL XLXN_10
        SIGNAL XLXN_34
        SIGNAL XLXN_37
        SIGNAL XLXN_33
        SIGNAL XLXN_83
        SIGNAL XLXN_84
        SIGNAL XLXN_85
        SIGNAL XLXN_86
        SIGNAL X3
        SIGNAL X2
        SIGNAL X1
        SIGNAL X0
        SIGNAL XLXN_89
        SIGNAL XLXN_91
        SIGNAL XLXN_92
        SIGNAL clk_50MHz
        SIGNAL VGA_B
        SIGNAL VGA_G
        SIGNAL VGA_HSYNC
        SIGNAL VGA_R
        SIGNAL RAM_ADDRESS(17:0)
        SIGNAL RAM_DATA(31:0)
        SIGNAL RAM_OE
        SIGNAL RAM_WE
        SIGNAL VGA_VSYNC
        SIGNAL RAM_GND
        SIGNAL A
        SIGNAL B
        SIGNAL C
        SIGNAL D
        SIGNAL E
        SIGNAL F
        SIGNAL G
        SIGNAL BTN0
        SIGNAL BTN1
        SIGNAL BTN2
        SIGNAL BTN3
        SIGNAL XLXN_93
        SIGNAL XLXN_94
        SIGNAL XLXN_106
        SIGNAL PAUSE
        PORT Output X3
        PORT Output X2
        PORT Output X1
        PORT Output X0
        PORT Input clk_50MHz
        PORT Output VGA_B
        PORT Output VGA_G
        PORT Output VGA_HSYNC
        PORT Output VGA_R
        PORT Output RAM_ADDRESS(17:0)
        PORT BiDirectional RAM_DATA(31:0)
        PORT Output RAM_OE
        PORT Output RAM_WE
        PORT Output VGA_VSYNC
        PORT Output RAM_GND
        PORT Output A
        PORT Output B
        PORT Output C
        PORT Output D
        PORT Output E
        PORT Output F
        PORT Output G
        PORT Input BTN0
        PORT Input BTN1
        PORT Input BTN2
        PORT Input BTN3
        PORT Input PAUSE
        BEGIN BLOCKDEF BOUNCINGBALL
            TIMESTAMP 2011 5 24 2 13 39
            RECTANGLE N 64 -384 576 0 
            LINE N 576 -352 640 -352 
            LINE N 64 -96 0 -96 
            LINE N 64 -160 0 -160 
            LINE N 64 -224 0 -224 
            LINE N 64 -288 0 -288 
            LINE N 64 -352 0 -352 
            LINE N 576 -96 640 -96 
            RECTANGLE N 576 -108 640 -84 
            LINE N 576 -224 640 -224 
            RECTANGLE N 576 -236 640 -212 
            LINE N 576 -160 640 -160 
            RECTANGLE N 576 -172 640 -148 
            LINE N 576 -288 640 -288 
            LINE N 576 -32 640 -32 
            RECTANGLE N 576 -44 640 -20 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF DISPLAY
            TIMESTAMP 2011 5 24 2 15 59
            RECTANGLE N 64 -576 576 0 
            LINE N 576 -160 640 -160 
            LINE N 64 -544 0 -544 
            LINE N 576 -224 640 -224 
            LINE N 576 -32 640 -32 
            LINE N 576 -288 640 -288 
            LINE N 576 -416 640 -416 
            RECTANGLE N 576 -428 640 -404 
            LINE N 576 -352 640 -352 
            RECTANGLE N 576 -364 640 -340 
            LINE N 576 -544 640 -544 
            LINE N 576 -480 640 -480 
            LINE N 576 -96 640 -96 
            LINE N 64 -224 0 -224 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -160 0 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF DIGITSEL
            TIMESTAMP 2011 5 24 2 14 6
            RECTANGLE N 64 -256 320 0 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF SEG7
            TIMESTAMP 2011 5 25 21 58 38
            RECTANGLE N 64 -704 320 -248 
            LINE N 320 -672 384 -672 
            LINE N 320 -608 384 -608 
            LINE N 320 -544 384 -544 
            LINE N 320 -480 384 -480 
            LINE N 320 -416 384 -416 
            LINE N 320 -352 384 -352 
            LINE N 320 -288 384 -288 
            LINE N 64 -672 0 -672 
            LINE N 64 -544 0 -544 
            LINE N 64 -608 0 -608 
            LINE N 64 -480 0 -480 
        END BLOCKDEF
        BEGIN BLOCKDEF CLKDIV
            TIMESTAMP 2011 5 2 22 44 4
            RECTANGLE N 64 -256 320 0 
            LINE N 64 -224 0 -224 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF cb2cle
            TIMESTAMP 2000 1 1 10 10 10
            RECTANGLE N 64 -512 320 -64 
            LINE N 0 -256 64 -256 
            LINE N 0 -32 64 -32 
            LINE N 0 -128 64 -128 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            LINE N 0 -192 64 -192 
            LINE N 0 -448 64 -448 
            LINE N 0 -384 64 -384 
            LINE N 384 -448 320 -448 
            LINE N 384 -384 320 -384 
            LINE N 384 -192 320 -192 
            LINE N 384 -128 320 -128 
        END BLOCKDEF
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -32 64 -64 
            LINE N 64 0 64 -32 
            LINE N 96 -64 32 -64 
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
        BEGIN BLOCKDEF d2_4e
            TIMESTAMP 2000 1 1 10 10 10
            RECTANGLE N 64 -384 320 -64 
            LINE N 0 -128 64 -128 
            LINE N 0 -256 64 -256 
            LINE N 0 -320 64 -320 
            LINE N 384 -128 320 -128 
            LINE N 384 -192 320 -192 
            LINE N 384 -256 320 -256 
            LINE N 384 -320 320 -320 
        END BLOCKDEF
        BEGIN BLOCKDEF inv4
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 224 -32 160 -32 
            LINE N 224 -96 160 -96 
            LINE N 224 -160 160 -160 
            LINE N 224 -224 160 -224 
            LINE N 0 -32 64 -32 
            LINE N 0 -96 64 -96 
            LINE N 0 -160 64 -160 
            LINE N 0 -224 64 -224 
            LINE N 64 -256 128 -224 
            LINE N 128 -224 64 -192 
            LINE N 64 -192 64 -256 
            CIRCLE N 128 -48 160 -16 
            LINE N 64 -64 128 -32 
            LINE N 128 -32 64 0 
            LINE N 64 0 64 -64 
            LINE N 64 -128 128 -96 
            LINE N 128 -96 64 -64 
            LINE N 64 -64 64 -128 
            CIRCLE N 128 -112 160 -80 
            LINE N 64 -192 128 -160 
            LINE N 128 -160 64 -128 
            LINE N 64 -128 64 -192 
            CIRCLE N 128 -176 160 -144 
            CIRCLE N 128 -240 160 -208 
        END BLOCKDEF
        BEGIN BLOCKDEF DEBOUNCE_S
            TIMESTAMP 2011 5 2 23 46 34
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -32 0 -32 
            LINE N 64 -96 0 -96 
            LINE N 320 -96 384 -96 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 BOUNCINGBALL
            PIN back XLXN_1
            PIN button_0 BTN0
            PIN button_1 BTN1
            PIN button_2 BTN2
            PIN button_3 BTN3
            PIN clk_50MHz clk_50MHz
            PIN P(7:0) XLXN_5(7:0)
            PIN pixel_write_address(17:0) XLXN_2(17:0)
            PIN pixel_write_data(29:0) XLXN_3(29:0)
            PIN pixel_write_request XLXN_4
            PIN Q(7:0) XLXN_6(7:0)
            PIN pause XLXN_93
        END BLOCK
        BEGIN BLOCK XLXI_2 DISPLAY
            PIN b VGA_B
            PIN clk_50MHz clk_50MHz
            PIN g VGA_G
            PIN hsync VGA_HSYNC
            PIN r VGA_R
            PIN ram_address(17:0) RAM_ADDRESS(17:0)
            PIN ram_data(31:0) RAM_DATA(31:0)
            PIN ram_output_enable RAM_OE
            PIN ram_write_enable RAM_WE
            PIN vsync VGA_VSYNC
            PIN back XLXN_1
            PIN pixel_write_address(17:0) XLXN_2(17:0)
            PIN pixel_write_data(29:0) XLXN_3(29:0)
            PIN pixel_write_request XLXN_4
        END BLOCK
        BEGIN BLOCK XLXI_3 DIGITSEL
            PIN P(7:0) XLXN_5(7:0)
            PIN Q(7:0) XLXN_6(7:0)
            PIN SEL0 XLXN_89
            PIN SEL1 XLXN_91
            PIN W0 XLXN_7
            PIN W1 XLXN_8
            PIN W2 XLXN_9
            PIN W3 XLXN_10
        END BLOCK
        BEGIN BLOCK XLXI_4 SEG7
            PIN A A
            PIN B B
            PIN C C
            PIN D D
            PIN E E
            PIN F F
            PIN G G
            PIN z XLXN_7
            PIN x XLXN_9
            PIN y XLXN_8
            PIN w XLXN_10
        END BLOCK
        BEGIN BLOCK XLXI_14 cb2cle
            PIN C XLXN_92
            PIN CE XLXN_34
            PIN CLR XLXN_37
            PIN D0 XLXN_37
            PIN D1 XLXN_37
            PIN L XLXN_37
            PIN CEO
            PIN Q0 XLXN_89
            PIN Q1 XLXN_91
            PIN TC
        END BLOCK
        BEGIN BLOCK XLXI_16 vcc
            PIN P XLXN_34
        END BLOCK
        BEGIN BLOCK XLXI_17 gnd
            PIN G XLXN_37
        END BLOCK
        BEGIN BLOCK XLXI_13 d2_4e
            PIN A0 XLXN_89
            PIN A1 XLXN_91
            PIN E XLXN_33
            PIN D0 XLXN_86
            PIN D1 XLXN_85
            PIN D2 XLXN_84
            PIN D3 XLXN_83
        END BLOCK
        BEGIN BLOCK XLXI_15 vcc
            PIN P XLXN_33
        END BLOCK
        BEGIN BLOCK XLXI_25 inv4
            PIN I0 XLXN_83
            PIN I1 XLXN_84
            PIN I2 XLXN_85
            PIN I3 XLXN_86
            PIN O0 X3
            PIN O1 X2
            PIN O2 X1
            PIN O3 X0
        END BLOCK
        BEGIN BLOCK XLXI_26 gnd
            PIN G RAM_GND
        END BLOCK
        BEGIN BLOCK XLXI_27 DEBOUNCE_S
            PIN CLK XLXN_94
            PIN I PAUSE
            PIN O XLXN_93
        END BLOCK
        BEGIN BLOCK XLXI_7 CLKDIV
            PIN MASTER clk_50MHz
            PIN DISPLAY XLXN_92
            PIN DEBOUNCE XLXN_94
            PIN HZ2
            PIN HZ1
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH XLXN_2(17:0)
            WIRE 2096 1104 2432 1104
        END BRANCH
        BEGIN BRANCH XLXN_3(29:0)
            WIRE 2096 1168 2432 1168
        END BRANCH
        BEGIN BRANCH XLXN_5(7:0)
            WIRE 2096 1232 2256 1232
            WIRE 2256 1232 2256 1568
            WIRE 2256 1568 2272 1568
        END BRANCH
        BEGIN BRANCH XLXN_6(7:0)
            WIRE 2096 1296 2176 1296
            WIRE 2176 1296 2176 1632
            WIRE 2176 1632 2272 1632
        END BRANCH
        BEGIN INSTANCE XLXI_3 2272 1792 R0
        END INSTANCE
        BEGIN BRANCH XLXN_7
            WIRE 2656 1568 2688 1568
        END BRANCH
        BEGIN BRANCH XLXN_8
            WIRE 2656 1632 2688 1632
        END BRANCH
        BEGIN BRANCH XLXN_9
            WIRE 2656 1696 2688 1696
        END BRANCH
        BEGIN BRANCH XLXN_10
            WIRE 2656 1760 2688 1760
        END BRANCH
        BEGIN INSTANCE XLXI_4 2688 2240 R0
        END INSTANCE
        BEGIN BRANCH XLXN_1
            WIRE 2096 976 2432 976
        END BRANCH
        BEGIN BRANCH XLXN_4
            WIRE 2096 1040 2432 1040
        END BRANCH
        BEGIN INSTANCE XLXI_2 2432 1200 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_1 1456 1328 R0
        END INSTANCE
        BEGIN BRANCH XLXN_34
            WIRE 1376 2352 1792 2352
        END BRANCH
        BEGIN BRANCH XLXN_37
            WIRE 1472 2096 1680 2096
            WIRE 1680 2096 1792 2096
            WIRE 1680 2096 1680 2160
            WIRE 1680 2160 1792 2160
            WIRE 1680 2160 1680 2288
            WIRE 1680 2288 1792 2288
            WIRE 1680 2288 1680 2512
            WIRE 1680 2512 1792 2512
        END BRANCH
        INSTANCE XLXI_14 1792 2544 R0
        INSTANCE XLXI_16 1376 2416 R270
        INSTANCE XLXI_17 1344 2032 R90
        INSTANCE XLXI_13 2336 2416 R0
        BEGIN BRANCH XLXN_33
            WIRE 2304 2288 2336 2288
        END BRANCH
        INSTANCE XLXI_15 2304 2352 R270
        BEGIN BRANCH XLXN_83
            WIRE 2720 2288 2752 2288
        END BRANCH
        BEGIN BRANCH XLXN_84
            WIRE 2720 2224 2752 2224
        END BRANCH
        BEGIN BRANCH XLXN_85
            WIRE 2720 2160 2752 2160
        END BRANCH
        BEGIN BRANCH XLXN_86
            WIRE 2720 2096 2752 2096
        END BRANCH
        INSTANCE XLXI_25 2752 2320 R0
        BEGIN BRANCH X3
            WIRE 2976 2288 3008 2288
        END BRANCH
        BEGIN BRANCH X2
            WIRE 2976 2224 3008 2224
        END BRANCH
        BEGIN BRANCH X1
            WIRE 2976 2160 3008 2160
        END BRANCH
        BEGIN BRANCH X0
            WIRE 2976 2096 3008 2096
        END BRANCH
        IOMARKER 3008 2288 X3 R0 28
        IOMARKER 3008 2224 X2 R0 28
        IOMARKER 3008 2160 X1 R0 28
        IOMARKER 3008 2096 X0 R0 28
        BEGIN BRANCH XLXN_89
            WIRE 2176 2096 2208 2096
            WIRE 2208 2096 2336 2096
            WIRE 2208 1696 2272 1696
            WIRE 2208 1696 2208 2096
        END BRANCH
        BEGIN BRANCH XLXN_91
            WIRE 2176 2160 2240 2160
            WIRE 2240 2160 2336 2160
            WIRE 2240 1760 2272 1760
            WIRE 2240 1760 2240 2160
        END BRANCH
        BEGIN BRANCH VGA_B
            WIRE 3072 1040 3104 1040
        END BRANCH
        IOMARKER 3104 1040 VGA_B R0 28
        BEGIN BRANCH VGA_G
            WIRE 3072 976 3104 976
        END BRANCH
        IOMARKER 3104 976 VGA_G R0 28
        BEGIN BRANCH VGA_HSYNC
            WIRE 3072 1168 3104 1168
        END BRANCH
        IOMARKER 3104 1168 VGA_HSYNC R0 28
        BEGIN BRANCH VGA_R
            WIRE 3072 912 3104 912
        END BRANCH
        IOMARKER 3104 912 VGA_R R0 28
        BEGIN BRANCH RAM_ADDRESS(17:0)
            WIRE 3072 784 3104 784
        END BRANCH
        IOMARKER 3104 784 RAM_ADDRESS(17:0) R0 28
        BEGIN BRANCH RAM_DATA(31:0)
            WIRE 3072 848 3104 848
        END BRANCH
        IOMARKER 3104 848 RAM_DATA(31:0) R0 28
        BEGIN BRANCH RAM_OE
            WIRE 3072 656 3104 656
        END BRANCH
        IOMARKER 3104 656 RAM_OE R0 28
        BEGIN BRANCH RAM_WE
            WIRE 3072 720 3104 720
        END BRANCH
        IOMARKER 3104 720 RAM_WE R0 28
        BEGIN BRANCH VGA_VSYNC
            WIRE 3072 1104 3104 1104
        END BRANCH
        IOMARKER 3104 1104 VGA_VSYNC R0 28
        INSTANCE XLXI_26 2880 512 R90
        BEGIN BRANCH RAM_GND
            WIRE 3008 576 3040 576
        END BRANCH
        IOMARKER 3040 576 RAM_GND R0 28
        BEGIN BRANCH A
            WIRE 3072 1568 3104 1568
        END BRANCH
        IOMARKER 3104 1568 A R0 28
        BEGIN BRANCH B
            WIRE 3072 1632 3104 1632
        END BRANCH
        IOMARKER 3104 1632 B R0 28
        BEGIN BRANCH C
            WIRE 3072 1696 3104 1696
        END BRANCH
        IOMARKER 3104 1696 C R0 28
        BEGIN BRANCH D
            WIRE 3072 1760 3104 1760
        END BRANCH
        IOMARKER 3104 1760 D R0 28
        BEGIN BRANCH E
            WIRE 3072 1824 3104 1824
        END BRANCH
        IOMARKER 3104 1824 E R0 28
        BEGIN BRANCH F
            WIRE 3072 1888 3104 1888
        END BRANCH
        IOMARKER 3104 1888 F R0 28
        BEGIN BRANCH G
            WIRE 3072 1952 3104 1952
        END BRANCH
        IOMARKER 3104 1952 G R0 28
        BEGIN BRANCH BTN0
            WIRE 1424 1232 1456 1232
        END BRANCH
        IOMARKER 1424 1232 BTN0 R180 28
        BEGIN BRANCH BTN1
            WIRE 1424 1168 1456 1168
        END BRANCH
        IOMARKER 1424 1168 BTN1 R180 28
        BEGIN BRANCH BTN2
            WIRE 1424 1104 1456 1104
        END BRANCH
        IOMARKER 1424 1104 BTN2 R180 28
        BEGIN BRANCH BTN3
            WIRE 1424 1040 1456 1040
        END BRANCH
        IOMARKER 1424 1040 BTN3 R180 28
        BEGIN BRANCH XLXN_93
            WIRE 1264 1296 1456 1296
        END BRANCH
        BEGIN BRANCH clk_50MHz
            WIRE 352 416 368 416
            WIRE 368 416 368 656
            WIRE 368 656 1392 656
            WIRE 1392 656 1392 976
            WIRE 1392 976 1456 976
            WIRE 1392 656 2432 656
            WIRE 352 656 368 656
            WIRE 352 656 352 784
            WIRE 352 784 368 784
        END BRANCH
        IOMARKER 352 416 clk_50MHz R180 28
        BEGIN INSTANCE XLXI_7 368 1008 R0
        END INSTANCE
        BEGIN BRANCH XLXN_92
            WIRE 752 784 800 784
            WIRE 800 784 800 2416
            WIRE 800 2416 1792 2416
        END BRANCH
        BEGIN INSTANCE XLXI_27 880 1392 R0
        END INSTANCE
        BEGIN BRANCH XLXN_94
            WIRE 752 848 768 848
            WIRE 768 848 768 1360
            WIRE 768 1360 880 1360
        END BRANCH
        BEGIN BRANCH PAUSE
            WIRE 640 1296 880 1296
        END BRANCH
        IOMARKER 640 1296 PAUSE R180 28
    END SHEET
END SCHEMATIC
