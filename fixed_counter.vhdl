```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity fixed_counter is
  port (
    clk : in std_logic;
    rst : in std_logic;
    count_out : out integer range 0 to 15
  );
end entity;

architecture behavioral of fixed_counter is
  signal count : integer range 0 to 15 := 0;
  signal next_count : integer range 0 to 15;
begin
  process (clk, rst)
  begin
    if rst = '1' then
      next_count <= 0;
    elsif rising_edge(clk) then
      if count = 15 then
        next_count <= 0;
      else
        next_count <= count + 1;
      end if;
    end if;
  end process;
  process (clk) 
  begin
    if rising_edge(clk) then
        count <= next_count; 
    end if;
  end process; 
  count_out <= count;
end architecture;
```