
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use ieee.numeric_std.all;

entity Addition is
    Port ( NUM1 : in  signed (7 downto 0);
           NUM2 : in  signed (7 downto 0);
           RESULT : out  signed (7 downto 0));
end Addition;

architecture Behavioral of Addition is

begin

		RESULT <= NUM1 + NUM2;

end Behavioral;

