	----------------------------------------------------------------------------------
	-- Name: Matthew Schlatter
	-- Date:	10/30/23
	-- Course:	CSCE 230
	-- File:	RegisterFile16by4Bit.vhd
	-- HW:		Lab 9
	-- Purp:	Implements a register file 16 by 4 bits 
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

	entity RegisterFile16by4Bit is

		port(
			clock, reset, RF_write :in std_logic;
			AddressA, AddressB, AddressC :in std_logic_vector(3 downto 0);
			InputC :in std_logic_vector(3 downto 0);
			OutputA, OutputB :out std_logic_vector(3 downto 0)
		);
			
	end RegisterFile16by4Bit;

	architecture implementation of RegisterFile16by4Bit is
		
		component Decoder4Bit 
			port(
				x : in std_logic_vector(3 downto 0);
				y : out std_logic_vector(15 downto 0)
			);
		end component;
		
		component Mux16Input4Bit
			port(
				s : in std_logic_vector(3 downto 0);
				input0, input1, input2, input3, input4 : in std_logic_vector(3 downto 0);
				input5, input6, input7, input8, input9 : in std_logic_vector(3 downto 0);
				input10, input11, input12, input13, input14 : in std_logic_vector(3 downto 0);
				input15 : in std_logic_vector(3 downto 0);
				output : out std_logic_vector(3 downto 0)
			);
		end component;
		
		component Reg4Bit
			port(
				clock   : in std_logic;
				reset   : in std_logic;
				enable  : in std_logic;
				D		  : in std_logic_vector(3 downto 0);
				Q		  : out std_logic_vector(3 downto 0)
			);
		end component;

		signal decoded_bit : std_logic_vector(15 downto 0);
		signal enable_signals : std_logic_vector(15 downto 1);
		signal r_input15, r_input1, r_input2, r_input3, r_input4 : std_logic_vector(3 downto 0);
		signal r_input5, r_input6, r_input7, r_input8, r_input9 : std_logic_vector(3 downto 0);
		signal r_input10, r_input11, r_input12, r_input13, r_input14 : std_logic_vector(3 downto 0);
		
	begin

		Decoder4Bit_instance : Decoder4Bit port map (x => AddressC, y => decoded_bit);
		
		enable_signals(1) <= RF_write and decoded_bit(1);
		enable_signals(2) <= RF_write and decoded_bit(2);
		enable_signals(3) <= RF_write and decoded_bit(3);
		enable_signals(4) <= RF_write and decoded_bit(4);
		enable_signals(5) <= RF_write and decoded_bit(5);
		enable_signals(6) <= RF_write and decoded_bit(6);
		enable_signals(7) <= RF_write and decoded_bit(7);
		enable_signals(8) <= RF_write and decoded_bit(8);
		enable_signals(9) <= RF_write and decoded_bit(9);
		enable_signals(10) <= RF_write and decoded_bit(10);
		enable_signals(11) <= RF_write and decoded_bit(11);
		enable_signals(12) <= RF_write and decoded_bit(12);
		enable_signals(13) <= RF_write and decoded_bit(13);
		enable_signals(14) <= RF_write and decoded_bit(14);
		enable_signals(15) <= RF_write and decoded_bit(15);
		
		Register1 : Reg4Bit port map (clock => clock, reset => reset, enable => enable_signals(1), D => InputC, Q => r_input1);
		Register2 : Reg4Bit port map (clock => clock, reset => reset, enable => enable_signals(2), D => InputC, Q => r_input2);
		Register3 : Reg4Bit port map (clock => clock, reset => reset, enable => enable_signals(3), D => InputC, Q => r_input3);
		Register4 : Reg4Bit port map (clock => clock, reset => reset, enable => enable_signals(4), D => InputC, Q => r_input4);
		Register5 : Reg4Bit port map (clock => clock, reset => reset, enable => enable_signals(5), D => InputC, Q => r_input5);
		Register6 : Reg4Bit port map (clock => clock, reset => reset, enable => enable_signals(6), D => InputC, Q => r_input6);
		Register7 : Reg4Bit port map (clock => clock, reset => reset, enable => enable_signals(7), D => InputC, Q => r_input7);
		Register8 : Reg4Bit port map (clock => clock, reset => reset, enable => enable_signals(8), D => InputC, Q => r_input8);
		Register9 : Reg4Bit port map (clock => clock, reset => reset, enable => enable_signals(9), D => InputC, Q => r_input9);
		Register10 : Reg4Bit port map (clock => clock, reset => reset, enable => enable_signals(10), D => InputC, Q => r_input10);
		Register11 : Reg4Bit port map (clock => clock, reset => reset, enable => enable_signals(11), D => InputC, Q => r_input11);
		Register12 : Reg4Bit port map (clock => clock, reset => reset, enable => enable_signals(12), D => InputC, Q => r_input12);
		Register13 : Reg4Bit port map (clock => clock, reset => reset, enable => enable_signals(13), D => InputC, Q => r_input13);
		Register14 : Reg4Bit port map (clock => clock, reset => reset, enable => enable_signals(14), D => InputC, Q => r_input14);
		Register15 : Reg4Bit port map (clock => clock, reset => reset, enable => enable_signals(15), D => InputC, Q => r_input15);
		
		Mux16Input4Bit_instanceA : Mux16Input4Bit
		port map( 
			s => AddressA,
			input0 => "0000", 
			input1 => r_input1,
			input2 => r_input2,
			input3 => r_input3,
			input4 => r_input4,
			input5 => r_input5,
			input6 => r_input6,
			input7 => r_input7,
			input8 => r_input8,
			input9 => r_input9,
			input10 => r_input10,
			input11 => r_input11,
			input12 => r_input12,
			input13 => r_input13,
			input14 => r_input14,
			input15 => r_input15,
			output => OutputA
		);
		
		Mux16Input4Bit_instanceB : Mux16Input4Bit
		port map( 
			s => AddressB,
			input0 => "0000", 
			input1 => r_input1,
			input2 => r_input2,
			input3 => r_input3,
			input4 => r_input4,
			input5 => r_input5,
			input6 => r_input6,
			input7 => r_input7,
			input8 => r_input8,
			input9 => r_input9,
			input10 => r_input10,
			input11 => r_input11,
			input12 => r_input12,
			input13 => r_input13,
			input14 => r_input14,
			input15 => r_input15,
			output => OutputB
		);

	end implementation;