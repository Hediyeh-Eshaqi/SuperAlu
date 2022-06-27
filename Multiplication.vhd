
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.NUMERIC_STD.all;

entity Multiplication is
    Port ( NUM1 : in  signed (7 downto 0);
           NUM2 : in  signed (7 downto 0);
           RESULT : out  signed (7 downto 0));
end Multiplication;

architecture Behavioral of Multiplication is
begin

	RESULT <= to_signed(to_integer(NUM1 * NUM2),8) ;
	
end Behavioral;

