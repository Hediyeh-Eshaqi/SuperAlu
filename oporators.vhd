----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    	06/28/2022 
-- Design Name: 
-- Module Name:    	oporators - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 		Gets the 41 bit instruction and return the oporators code
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity oporators is
    Port ( ins : in  STD_LOGIC_VECTOR (40 downto 0);
           opt1 : out  STD_LOGIC_VECTOR (2 downto 0);
           opt2 : out  STD_LOGIC_VECTOR (2 downto 0);
           opt3 : out  STD_LOGIC_VECTOR (2 downto 0);
			  n1 : out  STD_LOGIC_VECTOR (7 downto 0);
           n2 : out  STD_LOGIC_VECTOR (7 downto 0);
           n3 : out  STD_LOGIC_VECTOR (7 downto 0);
           n4 : out  STD_LOGIC_VECTOR (7 downto 0));
			  
end oporators;

architecture Behavioral of oporators is

begin

opt1 <= ins(40 downto 38);
opt2 <= ins(37 downto 35);
opt3 <= ins(34 downto 32);
n1 <= ins(31 downto 24);
n2 <= ins(23 downto 16);
n3 <= ins(15 downto 8);
n4 <= ins(7 downto 0);

end Behavioral;

