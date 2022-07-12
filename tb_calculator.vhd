
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use ieee.numeric_std.all;

 
ENTITY tb_calculator IS
END tb_calculator;
 
ARCHITECTURE behavior OF tb_calculator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Calculator
		Port ( 	NUM1 : in  signed (7 downto 0) ;
					NUM2 : in  signed (7 downto 0) ;
					OPERATOR : in std_logic_vector(2 downto 0);
					RESULT : out  signed (7 downto 0));
    END COMPONENT;
    

   --Inputs
   signal NUM1 : signed(7 downto 0) := "00000001";
   signal NUM2 : signed(7 downto 0) := "00000001";
   signal OPERATOR : std_logic_vector(2 downto 0) := (others => '0');


 	--Outputs
   signal RESULT : signed(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Calculator PORT MAP (
          NUM1 => NUM1,
          NUM2 => NUM2,
          OPERATOR => OPERATOR,
          RESULT => RESULT
        );


 

 -- Stimulus process
   stim_proc: process
   begin		
		--###first case###
      wait for 50 ns;	
		
		-- (-3 * 1)=-3
		OPERATOR <= "010";
      NUM1 <= "11111101"; -- num1 = -3
		NUM2 <= "00000001"; --num2 = 1
		-- * RESULT SHOULD BE -3 ==> RESULT = 111111101 *
		
		
		--###second case###
		-- (4^2)=16
		wait for 50 ns;
		OPERATOR <= "100";
		NUM1 <= "00000100"; --num1 = 4
      NUM2 <= "00000010"; -- num2 = 2
		-- * RESULT SHOULD BE 16 ==> RESULT = 00010000 *
		
		
		--###third case###
		wait for 50 ns;
		-- (4 - (-3))=7
		OPERATOR <= "001";
		NUM1 <= "00000100"; --num1 = 4
      NUM2 <= "11111101"; -- num2 = -3
		-- * RESULT SHOULD BE 7 ==> RESULT = 00000111 *
		
		
		--###fourht case###
		wait for 50 ns;
		-- logarithm(4)=2
		OPERATOR <= "101";
      NUM1 <= "00000100"; --num1 = 4
		NUM2 <= "00000001"; --num2 = 0
		-- * RESULT SHOULD BE 2 ==> RESULT = 00000010 *
		
		--###fifth case###
		wait for 50 ns;
		-- 15 / 5 = 3
		OPERATOR <= "011";
      NUM1 <= "00001111"; -- num1 = 15
		NUM2 <= "00000101"; --num2 = 5
		-- * RESULT SHOULD BE 3 ==> RESULT = 00000011 *
		
		
		--###sixth case###
		wait for 50 ns;
		-- sqrt(25)=5
		OPERATOR <= "110";
		NUM1 <= "00011001"; -- num1 = 25
		NUM2 <= "00000001"; --num2 = 0
		-- * RESULT SHOULD BE 5 ==> RESULT = 00000101 *
		

      wait;
   end process;

END;