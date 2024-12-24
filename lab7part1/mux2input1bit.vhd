----------------------------------------------------------------------------------
-- Name: Matthew Schlatter
-- Date: 10/4/2023
-- Course: CSCE 230
-- File: mux2input1bit.vhd
-- HW: Lab 7
-- Purp: Implement a 2 input 1 bit mux
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

entity mux2input1bit is
	port(
		s : in std_logic;
		a,b : in std_logic;
		output : out std_logic);
end mux2input1bit;

architecture implementation of mux2input1bit is
	signal term1, term2 : std_logic;
begin
	term1 <= not s and a;
	term2 <= s and b;
	output <= term1 or term2;
end implementation;
