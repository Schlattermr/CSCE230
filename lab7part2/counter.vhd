----------------------------------------------------------------------------------
-- Name: Matthew Schlatter
-- Date: 10/11/2023
-- Course: CSCE 230
-- File: counter.vhd
-- HW: Lab 7
-- Purp: Counter based on input
-- Doc: None
-- Academic Integrity Statement: I certify that, while others may have
-- assisted me in brain storming, debugging and validating this program,
-- the program itself is my own work. I understand that submitting code
-- which is the work of other individuals is a violation of the honor
-- code. I also understand that if I knowingly give my original work to
-- another individual is also a violation of the honor code.
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity counter is
	port(
		clock : in std_logic;
		reset : in std_logic;
		increment : in std_logic;
		output : out std_logic_vector(6 downto 0);
		debug_current_state : out std_logic_vector(2 downto 0));
end counter;

architecture implementation of counter is
	signal current_state: std_logic_vector(2 downto 0);
	signal next_state : std_logic_vector(2 downto 0);
begin
	debug_current_state <= current_state;

	-- current state logic defined below
	process(clock, reset)
	begin

	if (reset = '1') then
		current_state <= "000";
	elsif rising_edge(clock) then
		current_state <= next_state;
	end if;

	end process;

	-- next state logic defined below
	process(current_state, increment)
	begin
	
		case current_state is
			when "000" =>
				if (increment = '0') then 
					next_state <= "001";
				else
					next_state <= "010";
				end if;
			
			when "001" =>
				if (increment = '0') then
					next_state <= "010";
				else
					next_state <= "011";
				end if;
				
			when "010" =>
				if (increment = '0') then
					next_state <= "011";
				else
					next_state <= "100";
				end if;
				
			when "011" =>
				if (increment = '0') then
					next_state <= "100";
				else
					next_state <= "101";
				end if;
				
			when "100" =>
				if (increment = '0') then
					next_state <= "101";
				else
					next_state <= "110";
				end if;
				
			when "101" =>
				if (increment = '0') then
					next_state <= "110";
				else
					next_state <= "111";
				end if;
				
			when "110" =>
				if (increment = '0') then
					next_state <= "111";
				else
					next_state <= "000";
				end if;
				
			when others =>
				if (increment = '0') then
					next_state <= "000";
				else
					next_state <= "001";
				end if;
				
		end case;
	end process;

	-- Output logic defined below
	process(current_state)
	begin

    case current_state is
        when "000" =>
            output <= "1000000";
        when "001" =>
            output <= "1111001";
        when "010" =>
            output <= "0100100";
        when "011" =>
            output <= "0110000";
        when "100" =>
            output <= "0011001";
        when "101" =>
            output <= "0010010";
        when "110" =>
            output <= "0000010";
        when others =>
				output <= "1111000";
				
		end case;
		
	end process;

end implementation;
