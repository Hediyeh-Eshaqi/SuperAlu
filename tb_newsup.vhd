library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use ieee.numeric_std.all;
library work;
use work.arr_package.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_newsup IS
END tb_newsup;
 
ARCHITECTURE behavior OF tb_newsup IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT superALU
    PORT(
          n : in integer;
			lines : in input_arr ;
         clk : IN  std_logic;
         RESULT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal  n : integer := 0;
   signal lines :  input_arr ;
   signal clk : std_logic := '0';

 	--Outputs
   signal RESULT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: superALU PORT MAP (
          n => n,
          lines => lines,
          clk => clk,
          RESULT => RESULT
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		 n <= 1;
		 
				-- 1 line and line is (2+3)*(4-1)
				lines <= (('0','0','0','0','1','0','0','0','1','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','1','1','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','1','0','0','0'), others => (others => '0'));
			   
				
			wait for 100ns;
			
			-- 2 lines and lines are (6/3)-(2-1) and (2+3)*(4-1)
			n<= 2;
			lines <= (('0','1','1','0','0','1','0','0','1','0','0','0','0','0','0','1','1','0','0','0','0','0','0','0','0','1','1','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','1','0','0','0'),('0','0','0','0','1','0','0','0','1','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','1','1','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','1','0','0','0'), others => (others => '0'));

      wait;
   end process;

END;
