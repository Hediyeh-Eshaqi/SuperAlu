
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use ieee.numeric_std.all;
 

 
ENTITY tb_multiplication IS
END tb_multiplication;
 
ARCHITECTURE behavior OF tb_multiplication IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Multiplication
    PORT(
         NUM1 : IN  signed(7 downto 0);
         NUM2 : IN  signed(7 downto 0);
         RESULT : OUT  signed(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal NUM1 : signed(7 downto 0) := (others => '0');
   signal NUM2 : signed(7 downto 0) := (others => '0');

 	--Outputs
   signal RESULT : signed(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Multiplication PORT MAP (
          NUM1 => NUM1,
          NUM2 => NUM2,
          RESULT => RESULT
        );

   
   -- Stimulus process
   stim_proc: process
   begin		
		--###first case###
      wait for 100 ns;	

      NUM1 <= "11111101"; -- num1 = -3
		NUM2 <= "00000001"; --num2 = 1
		-- * RESULT SHOULD BE -3 ==> RESULT = 111111101 *
		
		
		--###second case###
		wait for 100 ns;
		
		NUM1 <= "00000100"; --num1 = 4
      NUM2 <= "11111101"; -- num2 = -3
		-- * RESULT SHOULD BE -12 ==> RESULT = 11110100 *
		
		
		--###third case###
		wait for 100 ns;
		
      NUM1 <= "11111011"; -- num1 = -5
		NUM2 <= "11111100"; --num2 = -4
		-- * RESULT SHOULD BE 20 ==> RESULT = 00010100 *
		
		
		--###fourht case###
		wait for 100 ns;
		
      NUM1 <= "00001010"; -- num1 = 10
		NUM2 <= "00000011"; --num2 = 3
		-- * RESULT SHOULD BE 30 ==> RESULT = 00011110 *

      wait;
   end process;

END;
