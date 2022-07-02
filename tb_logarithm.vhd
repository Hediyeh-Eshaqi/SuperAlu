
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.math_real.all;
 

 
ENTITY tb_logarithm IS
END tb_logarithm;
 
ARCHITECTURE behavior OF tb_logarithm IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Logarithm
    PORT(
         NUM1 : IN  signed(7 downto 0);
         RESULT : OUT  signed(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal NUM1 : signed(7 downto 0) := (others => '0');

 	--Outputs
   signal RESULT : signed(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Logarithm PORT MAP (
          NUM1 => NUM1,
          RESULT => RESULT
        );

   
 

    -- Stimulus process
   stim_proc: process
   begin		
		--###first case###
      wait for 100 ns;	

      NUM1 <= "00000010"; -- num1 = 2

		-- * RESULT SHOULD BE 1 ==> RESULT = 00000001 *
		
		
		--###second case###
		wait for 100 ns;
		
		NUM1 <= "00000100"; --num1 = 4
		
		-- * RESULT SHOULD BE 2 ==> RESULT = 00000010 *
		
		
		--###third case###
		wait for 100 ns;
		
      NUM1 <= "00001000"; -- num1 = 8

		-- * RESULT SHOULD BE 3 ==> RESULT = 00000011 *
		
		
		--###fourht case###
		wait for 100 ns;
		
      NUM1 <= "00100000"; -- num1 = 32

		-- * RESULT SHOULD BE 5 ==> RESULT = 00000101 *

      wait;
   end process;

END;
