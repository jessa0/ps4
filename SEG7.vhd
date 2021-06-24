--Copyright (c) 2011 jessa0 & Yan Ding
--Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
--
--The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
--
--THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SEG7 is
	port (
		w:	in std_logic;
		x:	in std_logic;
		y:	in std_logic;
		z:	in std_logic;
		A: out std_logic;
		B: out std_logic;
		C: out std_logic;
		D: out std_logic;
		E: out std_logic;
		F: out std_logic;
		G: out std_logic
	);
end SEG7;

architecture Behavioral of SEG7 is

begin

	A <= NOT (y OR (x AND z) OR w OR ((NOT x) AND (NOT z)));
	B <= NOT ((y AND z) OR (NOT x) OR ((NOT y) AND (NOT z)));
	C <= NOT (z OR x OR (NOT y));
	D <= NOT (((NOT x) AND y) OR (y AND (NOT z)) OR (x AND (NOT y) AND z) OR ((NOT x) AND (NOT z)));
	E <= NOT ((y AND (NOT z)) OR ((NOT x) AND (NOT z)));
	F <= NOT ((x AND (NOT y)) OR (x AND (NOT z)) OR w OR ((NOT y) AND (NOT z)));
	G <= NOT (((NOT x) AND y) OR (x AND (NOT y)) OR (x AND (NOT z)) OR w);
	
end Behavioral;

