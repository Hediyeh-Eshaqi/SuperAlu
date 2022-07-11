library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use ieee.numeric_std.all;
library work;
use work.arr_package.all;



entity SuperAlu_last is
    Port ( n : in integer;
				lines : in input_arr ;
           RESULT : out  output_arr) ;
end SuperAlu_last;

architecture Behavioral of SuperAlu_last is

component test is
    Port ( Instruction : in  STD_LOGIC_VECTOR (47 downto 0);
           RESULT : out  STD_LOGIC_VECTOR (7 downto 0));
end component test;
 
 
begin



    my_for: for i in 0 to 10 generate
		ALU_Reg_ins: test port map (lines(i), RESULT(i));
    end generate;




end Behavioral;

