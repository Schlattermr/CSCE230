----------------------------------------------------------------------------------
-- Name: Prof Jeff Falkinburg
-- Date: Fall 2020
-- Course: CSCE 230
-- File: clock_divider.vhd
-- HW: Lab 8
-- Purp: Clock Divider - Input takes in a high frequency board clock and
-- outputs a low frequency clock
--
-- Doc: <list the names of the people who you helped>
-- <list the names of the people who assisted you>
--
-- Academic Integrity Statement: I certify that, while others may have
-- assisted me in brain storming, debugging and validating this program,
-- the program itself is my own work. I understand that submitting code
-- which is the work of other individuals is a violation of the honor
-- code. I also understand that if I knowingly give my original work to
-- another individual is also a violation of the honor code.
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_divider is
	port(
		i_clk_fast : in std_logic;
		i_reset : in std_logic;
		o_clk_slow : out std_logic
	);
end clock_divider;

architecture horrible_method of clock_divider is
	signal clk_bus : unsigned(23 downto 0);
begin

	process (i_clk_fast, i_reset) is
	begin
		if i_reset = '1' then
			clk_bus <= (others => '0');
		elsif rising_edge(i_clk_fast) then
			clk_bus <= clk_bus + 1;
		end if;
	end process;
	
	o_clk_slow <= clk_bus(23); -- use this for implementation purposes
-- o_clk_slow <= clk_bus(0); -- use this for simulation purposes only

end horrible_method;
