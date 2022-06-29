
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use ieee.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_sqrt IS
END tb_sqrt;
 
ARCHITECTURE behavior OF tb_sqrt IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SQRT
    PORT(
         value : IN  std_logic_vector(15 downto 0);
         result : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal value : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SQRT PORT MAP (
          value => value,
          result => result
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
		--###first case###

      value <= "0000000000000100"; -- value = 4
		-- * RESULT SHOULD BE 2 ==> RESULT = 00000010 *
		
		
		--###second case###
		wait for 100 ns;
		
      value <= "0000000000010000"; -- value = 16
		-- * RESULT SHOULD BE 4 ==> RESULT = 00000100 *
		
		
		--###third case###
		wait for 100 ns;
		
      value <= "0000000000001001"; -- value = 9
		-- * RESULT SHOULD BE 3 ==> RESULT = 00000011 *
		
		
		--###fourht case###
		wait for 100 ns;
		
      value <= "0000000000011001"; -- value = 25
		-- * RESULT SHOULD BE 5 ==> RESULT = 00000101 *

      

      wait;
   end process;

END;
