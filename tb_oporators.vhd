--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:35:31 06/28/2022
-- Design Name:   
-- Module Name:   D:/code/VHDL/Super_ALU/Files/SuperAlu/tb_oporators.vhd
-- Project Name:  Super_ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: oporators
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
 
ENTITY tb_oporators IS
END tb_oporators;
 
ARCHITECTURE behavior OF tb_oporators IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT oporators
    PORT(
         ins : IN  std_logic_vector(40 downto 0);
         opt1 : OUT  std_logic_vector(2 downto 0);
         opt2 : OUT  std_logic_vector(2 downto 0);
         opt3 : OUT  std_logic_vector(2 downto 0);
         n1 : OUT  std_logic_vector(7 downto 0);
         n2 : OUT  std_logic_vector(7 downto 0);
         n3 : OUT  std_logic_vector(7 downto 0);
         n4 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ins : std_logic_vector(40 downto 0) := ( 1 downto 0 => '1' ,others => '0');

 	--Outputs
   signal opt1 : std_logic_vector(2 downto 0);
   signal opt2 : std_logic_vector(2 downto 0);
   signal opt3 : std_logic_vector(2 downto 0);
   signal n1 : std_logic_vector(7 downto 0);
   signal n2 : std_logic_vector(7 downto 0);
   signal n3 : std_logic_vector(7 downto 0);
   signal n4 : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: oporators PORT MAP (
          ins => ins,
          opt1 => opt1,
          opt2 => opt2,
          opt3 => opt3,
          n1 => n1,
          n2 => n2,
          n3 => n3,
          n4 => n4
        );

   -- Clock process definitions
   --<clock>_process :process
   --begin
	--	<clock> <= '0';
	--	wait for <clock>_period/2;
	--	<clock> <= '1';
		--wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      -- wait for 20 ns;	
		
		
		
		ins <= ( 2 downto 0=>'1',others =>'0');
      wait for clock_period;
		ins <= (others =>'1');
      wait for clock_period;
		ins <= "010110101"&x"af140356";
      wait for clock_period;
		ins <= "001110111"&x"8b100217";
      wait for clock_period;
      ins <= "011000001"&"00010001"&"00000100"&"00000110"&"00001010";
      wait for clock_period;
      ins <= "010000001"&"00010010"&"00000100"&"00000110"&"00000011";
      wait for clock_period;
      ins <= "000100001"&"00000011"&"00000100"&"00001100"&"00001010";
      wait for clock_period;
      
      -- insert stimulus here 

      wait;
   end process;

END;
