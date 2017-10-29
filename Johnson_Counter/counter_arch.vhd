-- File: counter_arch.vhd

library ieee;
use ieee.std_logic_1164.all;

entity counter is 
	port(
		signal state_out : out std_logic_vector(3 downto 0) := (others => '0');
		signal clk 		 : in std_logic);
end entity counter;

architecture arch  of counter is
	signal state : std_logic_vector(3 downto 0) := (others => '0');
	begin 
		process(clk)
		begin
			if(rising_edge(clk)) then 
				case state is	
					when "0000" =>
						state <= "0001";
					when "0001" =>
						state <= "0011";
					when "0011" =>
						state <= "0111";
					when "0111" =>
						state <= "1111";
					when "1111" =>
						state <= "1110";
					when "1110" =>
						state <= "1100";
					when "1100" =>
						state <= "1000";
					when "1000" =>
						state <= "0000";
					when others =>
						state <= "0000";
				end case;
				state_out <= state;
			end if;
		end process; 
	
end architecture arch;
