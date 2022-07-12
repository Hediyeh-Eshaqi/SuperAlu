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
--USE ieee.numeric_std.ALL;
 
ENTITY tb_Alu IS
END tb_Alu;
 
ARCHITECTURE behavior OF tb_Alu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         instruction : IN  std_logic_vector(40 downto 0);
         ans : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal instruction : std_logic_vector(40 downto 0) := "00000001"&"00000100"&"00000100"&"00000010"&"000000000";--(others => '0');

 	--Outputs
   signal ans : std_logic_vector(7 downto 0);
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
      -- hold reset state for 100 ns.
      wait for 10 ns;	
      instruction <= "00100000"&"00000100"&"00000110"&"00001010"&"011000001"; 
      -- (32 /8) + (6 - 10)
      wait for clock_period*1;
      instruction <= "00010000"&"00000100"&"00000110"&"00000011"&"010000001"; 
      -- (16 * 8) + (6 - 10)
      wait for clock_period*1;

      -- insert stimulus here 

      wait;
   end process;

END;
