library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity isqroot_comb is 
	generic (NBITS : positive := 8);
	port(
		signal isroot : out std_logic_vector(NBITS-1 downto 0) := (others => '0');
		signal arg    : in std_logic_vector(NBITS-1 downto 0) := (others => '0');
		signal roundUp: in std_logic := '0');
end entity isqroot_comb;

architecture isqroot_comb_arch  of isqroot_comb is
	
	begin 

		isqroot : process(arg)
			variable delta : unsigned(NBITS-1 downto 0) := (others => '0');
			delta := delta + 1;
			delta := shift_left(unsigned(delta), 1);
	        variable iroot : unsigned(NBITS-1 downto 0) := (others => '0');
			variable res : unsigned(NBITS-1 downto 0);
			res := arg;
			 
			while(delta >= 1) loop
					if((iroot + delta) <= res) then
						res = res - (iroot + delta);
						iroot = iroot + shift_left(unsigned(delta),1);
					end if;
					iroot := shift_right(unsigned(iroot),1);
					delta := shift_right(unsigned(delta),2);
			end loop;
				
			if(roundUp AND (res > iroot)) then
					iroot := iroot + 1; 
			end if;
				
			isroot <= iroot; 
			
		end process isqroot;
		
end architecture isqroot_comb_arch;
