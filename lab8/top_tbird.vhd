--+----------------------------------------------------------------------------
--|
--| FILENAME : top_tbird.vhd
--| AUTHOR(S) : Matthew Schlatter
--| CREATED : 10/22/2023
--| DESCRIPTION : This file implements the top level module for a NEXYS2 in
--| order to drive a Thunderbird taillight controller.
--|
--| Inputs: sw(3:0) --> clk reset, FSM reset, left, and right turn signals
--| clk --> 50 MHz clock from FPGA
--| Output: led(5:0) --> left and right turn signal lights (three per side)
--|
--| DOCUMENTATION : None
--|
--+----------------------------------------------------------------------------
--|
--| REQUIRED FILES :
--|
--| Libraries : ieee
--| Packages : std_logic_1164, numeric_std, unisim
--| Files : thunderbird_fsm.vhd, clock_divider.vhd
--|
--+----------------------------------------------------------------------------
--|
--| NAMING CONVENSIONS :
--|
--| xb_<port name> = off-chip bidirectional port ( _pads file )
--| xi_<port name> = off-chip input port ( _pads file )
--| xo_<port name> = off-chip output port ( _pads file )
--| b_<port name> = on-chip bidirectional port
--| i_<port name> = on-chip input port
--| o_<port name> = on-chip output port
--| c_<signal name> = combinatorial signal
--| f_<signal name> = synchronous signal
--| ff_<signal name> = pipeline stage (ff_, fff_, etc.)
--| <signal name>_n = active low signal
--| w_<signal name> = top level wiring signal
--| g_<generic name> = generic
--| k_<constant name> = constant
--| v_<variable name> = variable
--| sm_<state machine type> = state machine type definition
--| s_<signal name> = state name
--|
--+----------------------------------------------------------------------------
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
entity top_tbird is
	port(
		i_clk_50MHz : in std_logic; -- native 50MHz FPGA clock
		i_sw : in std_logic_vector(3 downto 0); -- clk_reset,fsm_reset,left, right
		o_led : out std_logic_vector(5 downto 0) -- taillights (LC, LB, LA, RA, RB, RC)
	);
end top_tbird;

architecture top_tbird_arch of top_tbird is

	signal clk_slow : std_logic;
	
	-- declare components
	component thunderbird_fsm
		port(
			  i_clk, i_reset : in std_logic;
           i_left, i_right : in std_logic;
           o_lights_L : out std_logic_vector(2 downto 0);
           o_lights_R : out std_logic_vector(2 downto 0)
      );
    end component;
	 
	 component clock_divider
        port(
            i_clk_fast : in std_logic;
            i_reset : in std_logic;
            o_clk_slow : out std_logic
        );
    end component;

begin
	-- PORT MAPS / COMPONENT INSTANTIATION --------------
	
	thuderbird_instance : thunderbird_fsm
   port map (
        i_clk => clk_slow,          		-- Use the 50MHz FPGA clock
        i_reset => i_sw(1),            	-- Use the reset signal from the switch
        i_left => i_sw(2),             	-- Connect the left switch to the FSM
        i_right => i_sw(3),            	-- Connect the right switch to the FSM
        o_lights_L => o_led(2 downto 0),  -- Connect the left turn signal lights
        o_lights_R => o_led(5 downto 3)   -- Connect the right turn signal lights
   );
	
	clock_divider_instance : clock_divider
   port map (
        i_clk_fast => i_clk_50MHz,  		-- Use the 50MHz FPGA clock as input
        i_reset => i_sw(0),         		-- Connect the reset switch to the clock divider
        o_clk_slow => clk_slow      		-- Connect the slow clock output
   );
	
end top_tbird_arch;
