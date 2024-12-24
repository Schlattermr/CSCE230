----------------------------------------------------------------------------------
-- Name:	Matthew Schlatter
-- Date:	11/2/23
-- Course:	CSCE 230
-- File:	ALU.vhd
-- HW:		Lab 9
-- Purp:	Implements an ALU
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

entity ALU is

	port(
		A, B : in std_logic_vector(3 downto 0);
		ALU_op : in std_logic_vector(1 downto 0);
		A_inv, B_inv : in std_logic;
		C_in : in std_logic;
		ALU_out : out std_logic_vector(3 downto 0);
		N, C, V, Z : out std_logic
	);

end ALU;

architecture implementation of ALU is 

	component Mux2Input4Bit
		port(
			s : in  std_logic;
			input0, input1 : in  std_logic_vector(3 downto 0);
			output : out std_logic_vector(3 downto 0)
		);
	end component;
	
	component Mux4Input4Bit
		port(
			s : in  std_logic_vector(1 downto 0);
			input0, input1, input2, input3 : in  std_logic_vector(3 downto 0);
			output : out std_logic_vector(3 downto 0)
		);
	end component;
	
	component Adder4Bit
		port(
			X, Y : in std_logic_vector(3 downto 0);
			C_in : in std_logic;
			S : out std_logic_vector(3 downto 0);
			C_out_2, C_out_3 : out std_logic
		);
	end component;
	
	-- temporary signals
	signal A_not : std_logic_vector(3 downto 0);
	signal B_not : std_logic_vector(3 downto 0);
	signal Mux0_output : std_logic_vector(3 downto 0);
	signal Mux1_output : std_logic_vector(3 downto 0);
	signal And4Bit : std_logic_vector(3 downto 0);
	signal Or4Bit : std_logic_vector(3 downto 0);
	signal Xor4Bit : std_logic_vector(3 downto 0);
	signal S_temp : std_logic_vector(3 downto 0);
	signal C_out_2_temp : std_logic;
	signal C_out_3_temp : std_logic;
	signal Z_temp : std_logic;
	
begin

	A_not <= not A;
	B_not <= not B;
	Mux0 : Mux2Input4Bit port map (s => A_inv, input0 => A, input1 => A_not, output => Mux0_output);
	Mux1 : Mux2Input4Bit port map (s => B_inv, input0 => B, input1 => B_not, output => Mux1_output);
	
	Adder : Adder4Bit port map (X => Mux0_output, Y => Mux1_output, C_in => C_in, S => S_temp, C_out_2 => C_out_2_temp, C_out_3 => C_out_3_temp);
	
	And4Bit <= Mux0_output and Mux1_output;
	Or4Bit <= Mux0_output or Mux1_output;
	Xor4Bit <= Mux0_output xor Mux1_output;
	Mux2 : Mux4Input4Bit port map (s => ALU_op, input0 => And4Bit, input1 => Or4Bit, input2 => Xor4Bit, input3 => S_temp, output => ALU_out);
	
	-- flag circuit
	N <= S_temp(3);
	C <= C_out_3_temp;
	V <= C_out_3_temp xor C_out_2_temp;
	Z_temp <= (not S_temp(3)) or (not S_temp(2)) or (not S_temp(1)) or not (S_temp(0));
	z <= not Z_temp;

end implementation;