
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use ieee.numeric_std.all;
 

 
ENTITY tb_division IS
END tb_division;
 
ARCHITECTURE behavior OF tb_division IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Division
    PORT(
         NUM1 : IN  signed(7 downto 0);
         NUM2 : IN  signed(7 downto 0);
         RESULT : OUT  signed(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal NUM1 : signed(7 downto 0) := (others => '0');
   signal NUM2 : signed(7 downto 0) := (others => '1');

 	--Outputs
   signal RESULT : signed(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Division PORT MAP (
          NUM1 => NUM1,
          NUM2 => NUM2,
          RESULT => RESULT
        );

   
   -- Stimulus process
   stim_proc: process
   begin		
		--###first case###

      NUM1 <= "11111101"; -- num1 = -3
		NUM2 <= "00000001"; --num2 = 1
		-- * RESULT SHOULD BE -3 ==> RESULT = 11111101 *
		
		
		--###second case###
		wait for 100 ns;
		
		NUM1 <= "00000110"; --num1 = 6
      NUM2 <= "11111101"; -- num2 = -3
		-- * RESULT SHOULD BE -2 ==> RESULT = 11111110 *
		
		
		--###third case###
		wait for 100 ns;
		
      NUM1 <= "11111000"; -- num1 = -8
		NUM2 <= "11111100"; --num2 = -4
		-- * RESULT SHOULD BE 2 ==> RESULT = 00000010 *
		
		
		--###fourht case###
		wait for 100 ns;
		
      NUM1 <= "00001111"; -- num1 = 15
		NUM2 <= "00000101"; --num2 = 5
		-- * RESULT SHOULD BE 3 ==> RESULT = 00000011 *	

      

      wait;
   end process;

END;
