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
   signal Instruction : std_logic_vector(47 downto 0) := "000"&"000110000"&"000001001"&"000000001"&"000011001"&"000001001"; 
	-- (9+1) + (sqrt(25)) -->reg(0)

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
      instruction <="001"&"000000000"&"000001001"&"000001001"&"000001001"&"000001001"; -- (9+9)+(9+9) -> reg(1)
      wait for clock_period*1;
      instruction <="010"&"000000001"&"000000111"&"000010011"&"000011001"&"000001001"; -- (7+19)+(27-9) -> reg(2)
      wait for clock_period*1;
      instruction <="011"&"001000000"&"100000001"&"000001001"&"000001001"&"100000010"; -- (reg(1) - 9)+(9 + reg(2)) -> reg(3)
      wait for clock_period*1;

      -- insert stimulus here 

      wait;
   end process;

END;
