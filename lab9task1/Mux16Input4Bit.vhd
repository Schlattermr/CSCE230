----------------------------------------------------------------------------------
-- Name: Prof Jeff Falkinburg
-- Date: Fall 2020
-- Course: CSCE 230
-- File: Mux16Input4Bit.vhd
-- HW: Lab 9
-- Purp: Implements a 16 Input by 4-Bit Multiplexer
--
-- Doc: Lecture Notes
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

entity Mux16Input4Bit is
	port(
		s : in std_logic_vector(3 downto 0);
		input0, input1, input2, input3, input4 : in std_logic_vector(3 downto 0);
		input5, input6, input7, input8, input9 : in std_logic_vector(3 downto 0);
		input10, input11, input12, input13, input14 : in std_logic_vector(3
		downto 0);
		input15 : in std_logic_vector(3 downto 0);
		output : out std_logic_vector(3 downto 0));
	end Mux16Input4Bit;
	
architecture implementation of mux16Input4Bit is
begin

	with s select
		output <= input0 when "0000",
		input1 when "0001",
		input2 when "0010",
		input3 when "0011",
		input4 when "0100",
		input5 when "0101",
		input6 when "0110",
		input7 when "0111",
		input8 when "1000",
		input9 when "1001",
		input10 when "1010",
		input11 when "1011",
		input12 when "1100",
		input13 when "1101",
		input14 when "1110",
		input15 when others;
		
end implementation;
