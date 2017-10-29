library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;

use std.textio.all;
use ieee.std_logic_textio.all;

entity counter_tb is 
end;

architecture bench_direct of counter_tb is

	signal clk : std_logic := '0';
	signal state_tb : std_logic_vector(3 downto 0) := (others => '0');
--	signal expected_tb : std_logic_vector(3 downto 0) := (others => '0');
	
	signal stop : boolean := false; 
	
	begin
	DUV : entity work.counter 
		port map (
			state_out => state_tb,
			clk => clk);
			
	
--	expected_output : process(clk)
--	begin
--		if(rising_edge(clk)) then 
--			expected_output <= ;
--		end if;
--	end process expected_output;
	
	clk_proc: process
	begin	
		wait for 10 ns;
		if(NOT stop) then
			clk <= NOT clk;
		end if;
	end process;
	
	
	STIM: process is
		begin
			--Variables
			wait for 100 ns;
			stop <= true;
			wait; 
			--other stimulus
	end process STIM;
	
	
end architecture bench_direct;
