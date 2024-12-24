----------------------------------------------------------------------------------
-- Name:	Matthew Schlatter
-- Date:	11/2/23
-- Course:	CSCE 230
-- File:	Adder4Bit.vhd
-- HW:		Lab 9
-- Purp:	Implements a 4-Bit Adder 
--
-- Doc:	
-- 	
-- Academic Integrity Statement: I certify that, while others may have 
-- assisted me in brain storming, debugging and validating this program, 
-- the program itself is my own work. I understand that submitting code 
-- which is the work of other individuals is a violation of the honor   
-- code.  I also understand that if I knowingly give my original work to 
-- another individual is also a violation of the honor code. 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Adder4Bit is

	port(
		X, Y : in std_logic_vector(3 downto 0);
		C_in : in std_logic;
		S : out std_logic_vector(3 downto 0);
		C_out_2, C_out_3 : out std_logic
	);
	
end Adder4Bit;

architecture implementation of Adder4Bit is

	component Adder1Bit
		port(
			X, Y, C_in : in std_logic;
			S, C_out : out std_logic
		);
	end component;
	
	signal C_in_temp0 : std_logic;
	signal C_in_temp1 : std_logic;
	signal C_in_temp2 : std_logic;
	signal C_in_temp3 : std_logic;
	
begin
	
	Adder0 : Adder1Bit port map (X => X(0), Y => Y(0), C_in => C_in, S => S(0), C_out => C_in_temp0);
	Adder1 : Adder1Bit port map (X => X(1), Y => Y(1), C_in => C_in_temp0, S => S(1), C_out => C_in_temp1);
	Adder2 : Adder1Bit port map (X => X(2), Y => Y(2), C_in => C_in_temp1, S => S(2), C_out => C_in_temp2);
	Adder3 : Adder1Bit port map (X => X(3), Y => Y(3), C_in => C_in_temp2, S => S(3), C_out => C_in_temp3);
	C_out_2 <= C_in_temp2;
	C_out_3 <= C_in_temp3;

end implementation;