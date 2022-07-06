----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:09:48 07/06/2022 
-- Design Name: 
-- Module Name:    ALU-Reg - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU-Reg is
    Port ( Instruction : in  STD_LOGIC_VECTOR (47 downto 0);
           RESULT : out  STD_LOGIC_VECTOR (7 downto 0));
end ALU-Reg;

architecture Behavioral of ALU-Reg is
COMPONENT ALU is
    Port ( instruction : in  STD_LOGIC_VECTOR (40 downto 0);
           ans : out  signed (7 downto 0));
end COMPONENT ALU;



begin


end Behavioral;

