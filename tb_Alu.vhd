--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:14:51 07/09/2022
-- Design Name:   
-- Module Name:   D:/code/VHDL/Super_ALU/Files/SuperAlu/tb_Alu.vhd
-- Project Name:  Super_ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY tb_Alu IS
END tb_Alu;
 
ARCHITECTURE behavior OF tb_Alu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         instruction : IN  std_logic_vector(40 downto 0);
         ans : OUT  signed(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal instruction : std_logic_vector(40 downto 0) := "000000000"&"00000011"&"00000100"&"00001100"&"00001010";--(others => '0');

 	--Outputs
   signal ans : signed(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          instruction => instruction,
          ans => ans
        );

   -- Clock process definitions
   -- <clock>_process :process
   -- begin
	-- 	<clock> <= '0';
	-- 	wait for <clock>_period/2;
	-- 	<clock> <= '1';
	-- 	wait for <clock>_period/2;
   -- end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 10 ns. 011000001001000000000010000000110000001010
      wait for 10 ns;	
      instruction <= "011000001"&"00010001"&"00000100"&"00000110"&"00001010"; 
      -- (17 /8) - (6 + 10)
      wait for clock_period*1;
      instruction <= "110000001"&"00011110"&"00000100"&"00000111"&"00000011"; 
      -- (18 * 8) - (6 + 3)
      wait for clock_period*1;
      instruction <= "100110000"&"00000011"&"00000010"&"00001001"&"00001010";
		-- (3 ** 2) + ( sqrt(9))
      wait for clock_period*1;


      wait;
   end process;

END;
