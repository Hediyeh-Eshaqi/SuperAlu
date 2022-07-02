
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use ieee.numeric_std.all;
 
ENTITY tb_power IS
END tb_power;
 
ARCHITECTURE behavior OF tb_power IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Power
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
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Power PORT MAP (
          NUM1 => NUM1,
          NUM2 => NUM2,
          RESULT => RESULT
        );

  
 

      -- Stimulus process
   stim_proc: process
   begin		
		--###first case###
      wait for 100 ns;	

      NUM1 <= "00000010"; -- num1 = 2
		NUM2 <= "00000011"; --num2 = 3
		-- * RESULT SHOULD BE 8 ==> RESULT = 00001000 *
		
		
		--###second case###
		wait for 100 ns;
		
		NUM1 <= "00000100"; --num1 = 4
      NUM2 <= "00000010"; -- num2 = 2
		-- * RESULT SHOULD BE 16 ==> RESULT = 00010000 *
		
		
		--###third case###
		wait for 100 ns;
		
      NUM1 <= "00000101"; -- num1 = 5
		NUM2 <= "00000000"; --num2 = 0
		-- * RESULT SHOULD BE 1 ==> RESULT = 00000001 *
		
		
		--###fourht case###
		wait for 100 ns;
		
      NUM1 <= "00000111"; -- num1 = 7
		NUM2 <= "00000010"; --num2 = 2
		-- * RESULT SHOULD BE 49 ==> RESULT = 00110001 *

      wait;
   end process;

END;
