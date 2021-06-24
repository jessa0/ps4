VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL I
        SIGNAL O
        SIGNAL XLXN_3
        SIGNAL CLK
        SIGNAL XLXN_7
        PORT Input I
        PORT Output O
        PORT Input CLK
        BEGIN BLOCKDEF ftsre
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            LINE N 192 -352 64 -352 
            LINE N 192 -320 192 -352 
            LINE N 384 -256 320 -256 
            LINE N 0 -352 64 -352 
            LINE N 0 -256 64 -256 
            LINE N 0 -32 64 -32 
            LINE N 0 -192 64 -192 
            LINE N 0 -128 64 -128 
            RECTANGLE N 64 -320 320 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF inv
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -32 64 -32 
            LINE N 224 -32 160 -32 
            LINE N 64 -64 128 -32 
            LINE N 128 -32 64 0 
            LINE N 64 0 64 -64 
            CIRCLE N 128 -48 160 -16 
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
        BEGIN BLOCK XLXI_3 ftsre
            PIN C CLK
            PIN CE XLXN_7
            PIN R XLXN_3
            PIN S I
            PIN T XLXN_7
            PIN Q O
        END BLOCK
        BEGIN BLOCK XLXI_4 inv
            PIN I I
            PIN O XLXN_3
        END BLOCK
        BEGIN BLOCK XLXI_5 gnd
            PIN G XLXN_7
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH I
            WIRE 640 640 800 640
            WIRE 800 640 800 848
            WIRE 800 848 1296 848
            WIRE 800 528 1552 528
            WIRE 800 528 800 640
        END BRANCH
        IOMARKER 640 640 I R180 28
        BEGIN BRANCH O
            WIRE 1936 624 1952 624
            WIRE 1952 624 2880 624
        END BRANCH
        INSTANCE XLXI_3 1552 880 R0
        BEGIN BRANCH XLXN_3
            WIRE 1520 848 1552 848
        END BRANCH
        INSTANCE XLXI_4 1296 880 R0
        IOMARKER 2880 624 O R0 28
        BEGIN BRANCH CLK
            WIRE 624 752 1552 752
        END BRANCH
        IOMARKER 624 752 CLK R180 28
        INSTANCE XLXI_5 1552 336 R180
        BEGIN BRANCH XLXN_7
            WIRE 1488 464 1488 624
            WIRE 1488 624 1552 624
            WIRE 1488 624 1488 688
            WIRE 1488 688 1552 688
        END BRANCH
    END SHEET
END SCHEMATIC
