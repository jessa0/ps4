--Copyright (c) 2011 jessa0 & Yan Ding
--Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
--
--The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
--
--THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity DISPLAY is
  generic (
    -- display timing parameters
    H_FRONT_PORCH: integer := 16;
    H_PULSE: integer := 96;
    H_BACK_PORCH: integer := 48;
    H_DISPLAY: integer := 640;
    V_FRONT_PORCH: integer := 10;
    V_PULSE: integer := 2;
    V_BACK_PORCH: integer := 29;
    V_DISPLAY: integer := 480;
    -- ram layout parameters
    DISPLAY_START_ADDRESS: std_logic_vector(17 downto 0) := (others => '0');
    BITS_PER_PIXEL: integer := 3;
    PIXELS_PER_WORD: integer := 10;
    PIXEL_BITS_PER_WORD: integer := 30);
  port (
    clk_50MHz: in std_logic;
    back: in std_logic;
    -- pixel data lines
    pixel_write_request: in std_logic;
    pixel_write_address: in std_logic_vector(17 downto 0);
    pixel_write_data: in std_logic_vector(PIXEL_BITS_PER_WORD - 1 downto 0);
    -- ram lines
    ram_output_enable: out std_logic := '1';
    ram_write_enable: out std_logic := '1';
    ram_address: out std_logic_vector(17 downto 0);
    ram_data: inout std_logic_vector(31 downto 0) := (others => 'Z');
    -- vga pins
    r: out std_logic := '0';
    g: out std_logic := '0';
    b: out std_logic := '0';
    vsync: out std_logic := '1';
    hsync: out std_logic := '1');
end DISPLAY;

architecture behavioral of DISPLAY is
begin
  process
    constant H_PULSE_TIME: integer :=
      H_DISPLAY + H_FRONT_PORCH + H_PULSE + H_BACK_PORCH;
    constant V_PULSE_TIME: integer :=
      V_DISPLAY + V_FRONT_PORCH + V_PULSE + V_BACK_PORCH;
    constant PIXEL_WORD_COUNT: integer :=
      V_DISPLAY * H_DISPLAY / PIXELS_PER_WORD;
   
    variable x: integer range 0 to H_PULSE_TIME - 1 := 0;
    variable y: integer range 0 to V_PULSE_TIME - 1 := 0;
    variable display_cycle_ctr: integer range 0 to 1 := 0;
    variable display_back_buffer: boolean;
    variable pixel_offset:
      integer range 0 to PIXEL_BITS_PER_WORD - BITS_PER_PIXEL := 0;
    variable read_word: boolean := TRUE;
    variable current_word: std_logic_vector(PIXEL_BITS_PER_WORD - 1 downto 0);
    variable finish_word_read: boolean := FALSE;
    variable next_word_offset: integer range 0 to PIXEL_WORD_COUNT - 1 := 0;
   begin
    wait until rising_edge(clk_50MHz);
    
    -- service pixel word read before pixel word write
    if (read_word) then
      -- read pixel word from ram
      ram_output_enable <= '0';
      ram_write_enable <= '1';
      -- stop driving data over ram data bus
      for i in 31 downto 0 loop
        ram_data(i) <= 'Z';
      end loop;
      if (not display_back_buffer) then
        -- read from front buffer
        ram_address <= DISPLAY_START_ADDRESS + next_word_offset;
      else
        -- read from back buffer
        ram_address <=
          DISPLAY_START_ADDRESS + PIXEL_WORD_COUNT + next_word_offset;
      end if;

      if (next_word_offset < PIXEL_WORD_COUNT - 1) then
        next_word_offset := next_word_offset + 1;
      else
        next_word_offset := 0;
      end if;

      read_word := FALSE;
      finish_word_read := TRUE;
    elsif (finish_word_read) then
      ram_output_enable <= '0';
      
      -- store pixel word read from ram
      for i in PIXEL_BITS_PER_WORD - 1 downto 0 loop
        current_word(i) := ram_data(i);
      end loop;

      finish_word_read := FALSE;
    elsif (pixel_write_request = '1') then
      -- do a pixel word write
      ram_output_enable <= '1';
      ram_write_enable <= '0';
      -- drive pixel data over ram data bus
      for i in PIXEL_BITS_PER_WORD - 1 downto 0 loop
        ram_data(i) <= pixel_write_data(i);
      end loop;
      for i in 31 downto PIXEL_BITS_PER_WORD loop
        ram_data(i) <= '0';
      end loop;
      -- pass pixel write address through
      ram_address <= pixel_write_address;
    else
      -- no ram operation this cycle
      ram_output_enable <= '1';
      ram_write_enable <= '1';
      -- stop driving data over ram data bus
      for i in 31 downto 0 loop
        ram_data(i) <= 'Z';
      end loop;
    end if;

    -- update vga output every other cycle (25 MHz)
    if (display_cycle_ctr = 1) then
      -- display
      if (x < H_DISPLAY and y < V_DISPLAY) then
        -- set colors to value read from ram
        r <= current_word(pixel_offset);
        g <= current_word(pixel_offset + 1);
        b <= current_word(pixel_offset + 2);
        
        -- XXX fix this at end of 640x480 cycle
        if (pixel_offset < PIXEL_BITS_PER_WORD - BITS_PER_PIXEL) then
          pixel_offset := pixel_offset + BITS_PER_PIXEL;
        else
          pixel_offset := 0;
          -- read the next word
          read_word := TRUE;
        end if;
      else
        -- set color to black during refresh
        r <= '0';
        g <= '0';
        b <= '0';
        
        -- horiz sync pulse
        if (x > H_DISPLAY + H_FRONT_PORCH
            and x < H_PULSE_TIME - H_BACK_PORCH) then
          hsync <= '0';
        else
          hsync <= '1';
        end if;
        -- vert sync pulse
        if (y > V_DISPLAY + V_FRONT_PORCH
            and y < V_PULSE_TIME - V_BACK_PORCH) then
          vsync <= '0';
        else
          vsync <= '1';
        end if;
      end if;
      
      if (x < H_PULSE_TIME - 1) then
        x := x + 1;
      else
        x := 0;
        if (y < V_PULSE_TIME - 1) then
          y := y + 1;
        else
          y := 0;
          -- change to front/back buffer if necessary
          display_back_buffer := back = '1';
        end if;
      end if;

      display_cycle_ctr := 0;
    else
      display_cycle_ctr := 1;
    end if;
  end process;
end behavioral;
