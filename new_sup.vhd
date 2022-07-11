library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use ieee.numeric_std.all;
library work;
use work.arr_package.all;



entity superALU is
    Port ( n : in integer;
				lines : in input_arr ;
				clk : in STD_LOGIC;
           RESULT : out  STD_LOGIC_VECTOR (7 downto 0)) ;
end superALU;

architecture Behavioral of superALU is

component ALU_Reg is
    Port ( Instruction : in  STD_LOGIC_VECTOR (47 downto 0);
           RESULT : out  STD_LOGIC_VECTOR (7 downto 0));
end component ALU_Reg;
 


signal tmp_out : STD_LOGIC_VECTOR (7 downto 0);
--signal t : integer := 0;
signal line : STD_LOGIC_VECTOR(47 downto 0) :=  (others => '0');
begin



		ALU_Reg_ins: ALU_Reg port map (line, tmp_out);

	 
	 
	process(clk, tmp_out, n, lines) is
	variable i : integer := 0;
	begin 
--	if(n'event) then i := 0;
	--end if;
	if(rising_edge(clk))
		then 
				if( i < n+1)
				then
					RESULT <= tmp_out;
					line <= lines(i);
					i := i+1;

				end if;
			end if;
	
	
	end process;



end Behavioral;
