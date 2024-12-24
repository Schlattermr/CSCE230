library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity thunderbird_fsm is
	port(
		i_clk, i_reset : in std_logic;
		i_left, i_right : in std_logic;
		o_lights_L : out std_logic_vector(2 downto 0);
		o_lights_R : out std_logic_vector(2 downto 0)
	);

end thunderbird_fsm;
	
architecture implementation of thunderbird_fsm is
	type light_state is (hazard, right3, right2, right1, left1, left2, left3, all_off);
	signal cs: light_state;
	signal ns : light_state;
begin

	-- current state logic
	process(i_clk, i_reset)
	begin

	if (i_reset = '1') then
		cs <= all_off;
	elsif rising_edge(i_clk) then
		cs <= ns;
	end if;

	end process;
	
	-- next state logic
	process(cs, i_left, i_right)
	begin
	
		case cs is
			when all_off =>
				if (i_left = '1' and i_right = '1') then
					ns <= hazard;
				elsif (i_right = '1') then
					ns <= right1;
				elsif (i_left = '1') then
					ns <= left1;
				else 
					ns <= all_off;
				end if;
			when hazard => ns <= all_off;
			when right1 => ns <= right2;
         when right2 => ns <= right3;
         when right3 => ns <= all_off;
         when left1 => ns <= left2;
         when left2 => ns <= left3;
         when left3 => ns <= all_off;
		end case;
		
	end process;
	
	-- output logic
	process(cs)
	begin
	
	case cs is
	 when all_off =>
      o_lights_L <= "000";
      o_lights_R <= "000";
    when left1 =>
      o_lights_L <= "100";
      o_lights_R <= "000";
    when left2 =>
      o_lights_L <= "110";
      o_lights_R <= "000";
    when left3 =>
      o_lights_L <= "111";
      o_lights_R <= "000";
    when right1 =>
      o_lights_L <= "000";
      o_lights_R <= "001";
    when right2 =>
      o_lights_L <= "000";
      o_lights_R <= "011";
    when right3 =>
      o_lights_L <= "000";
      o_lights_R <= "111";
	 when hazard =>
		o_lights_L <= "111";
		o_lights_R <= "111";
    when others =>
      o_lights_L <= "000";
      o_lights_R <= "000";
	 end case;
		
	end process;

end implementation;
