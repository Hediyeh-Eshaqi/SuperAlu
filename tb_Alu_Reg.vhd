--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:11:47 07/09/2022
-- Design Name:   
-- Module Name:   D:/code/VHDL/Super_ALU/Files/SuperAlu/tb_Alu_Reg.vhd
-- Project Name:  Super_ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU_Reg
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
 
ENTITY tb_Alu_Reg IS
END tb_Alu_Reg;
 
ARCHITECTURE behavior OF tb_Alu_Reg IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_Reg
    PORT(
         Instruction : IN  std_logic_vector(47 downto 0);
         RESULT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Instruction : std_logic_vector(47 downto 0) := (others => '0');

 	--Outputs
   signal RESULT : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_Reg PORT MAP (
          Instruction => Instruction,
          RESULT => RESULT
        );

   -- Clock process definitions
--   <clock>_process :process
--  begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--	wait for <clock>_period/2;
-- end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
      instruction <="000001001000001001000001001000001001000000000001"; -- (9+9)+(9+9) -> reg(1)
      wait for clock_period*1;
      instruction <="000001001000001001000001001000001001000000001010"; -- (9+9)+(9-9) -> reg(2)
      wait for clock_period*1;
      instruction <="100000001000001001000001001100000010001000000011"; -- (reg(1) - 9)+(9 + reg(2)) -> reg(3)
      wait for clock_period*1;

      -- insert stimulus here 

      wait;
   end process;

END;