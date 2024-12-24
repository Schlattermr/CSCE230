----------------------------------------------------------------------------------
-- Name: Matthew Schlatter
-- Date: 10/4/2023
-- Course: CSCE 230
-- File: mux2input4bit.vhd
-- HW: Lab 7
-- Purp: Implement a 2 input 4 bit mux
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

entity mux2input4bit is
	port(
		s : in std_logic;
		a,b : in std_logic_vector(3 downto 0);
		output : out std_logic_vector(3 downto 0));
end mux2input4bit;

architecture implementation of mux2input4bit is
	component mux2input1bit is
		port(
			s : in std_logic;
			a,b : in std_logic;
			output : out std_logic);
	end component;
	
	signal out0, out1, out2, out3: std_logic;
begin

	-- Exactly four component statements below
	m0: mux2input1bit port map(s, a(0), b(0), out0);
   m1: mux2input1bit port map(s, a(1), b(1), out1);
   m2: mux2input1bit port map(s, a(2), b(2), out2);
   m3: mux2input1bit port map(s, a(3), b(3), out3);

   output <= out3 & out2 & out1 & out0;

end implementation;
