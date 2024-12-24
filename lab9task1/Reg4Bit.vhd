----------------------------------------------------------------------------------
-- Name:	Prof Jeff Falkinburg
-- Date:	Fall 2020
-- Course:	CSCE 230
-- File:	Reg4Bit.vhd
-- HW:		Lab 9
-- Purp:	Implements a 4-Bit Register 
--
-- Doc:		Lecture Notes
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

entity Reg4Bit is
	port(
		clock   : in std_logic;
		reset   : in std_logic;
		enable  : in std_logic;
		D		  : in std_logic_vector(3 downto 0);
		Q		  : out std_logic_vector(3 downto 0)
	);
end Reg4Bit;

architecture implementation of Reg4Bit is
	component Reg1Bit is
	port(
		clock   : in std_logic;
		reset   : in std_logic;
		enable  : in std_logic;
		D		  : in std_logic;
		Q		  : out std_logic
	);
	end component;
begin
	bit0: Reg1Bit port map (clock=>clock, reset=>reset, enable=>enable, D=>D(0), Q=>Q(0));
	bit1: Reg1Bit port map (clock=>clock, reset=>reset, enable=>enable, D=>D(1), Q=>Q(1));
	bit2: Reg1Bit port map (clock=>clock, reset=>reset, enable=>enable, D=>D(2), Q=>Q(2));
	bit3: Reg1Bit port map (clock=>clock, reset=>reset, enable=>enable, D=>D(3), Q=>Q(3));
end implementation;