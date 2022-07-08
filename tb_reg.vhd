--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:51:52 07/08/2022
-- Design Name:   
-- Module Name:   D:/code/VHDL/Super_ALU/Files/SuperAlu/tb_reg.vhd
-- Project Name:  Super_ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reg
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
 
ENTITY tb_reg IS
END tb_reg;
 
ARCHITECTURE behavior OF tb_reg IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg 
    PORT(
        data_in: in  signed (7 downto 0);
        enable: in std_logic;
        data_out: out signed (7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal data_in : signed(7 downto 0) := (others => '0');
   signal enable : std_logic := '0';

 	--Outputs
   signal data_out : signed(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg PORT MAP (
          data_in => data_in,
          enable => enable,
          data_out => data_out
        );

   -- Clock process definitions
   -- <clock>_process :process
   -- begin
	-- 	<clock> <= '0';
	-- 	wait for <clock>_period/2;
	-- 	<clock> <= '1';
	--	wait for clock_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
      
      data_in <= x"0f";
      enable <=   '0';
      wait for clock_period*1;
      data_in <=x"0f";
      enable <=   '1';
      wait for clock_period*1;
      data_in <= x"21";
      enable <=   '0';
      wait for clock_period*1;
      data_in <=x"2f";
      enable <=   '1';
      wait for clock_period*1;
      data_in <=x"47";
      enable <=   '1';
      wait for clock_period*1;

      -- insert stimulus here 

      wait;
   end process;

END;
