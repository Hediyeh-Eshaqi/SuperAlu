----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07/02/2022 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( instruction : in  STD_LOGIC_VECTOR (40 downto 0):= "000000000"&"00001111"&"00000100"&"00011000"&"00001010";
           ans : out  signed (7 downto 0));
end ALU;


architecture STRUCTURAL of ALU is

component Calculator is
		Port ( 	NUM1 : in  signed (7 downto 0) ;
					NUM2 : in  signed (7 downto 0) ;
					OPERATOR : in std_logic_vector(2 downto 0);
					RESULT : out  signed (7 downto 0));
end component Calculator;

component oporators is
    Port ( ins : in  STD_LOGIC_VECTOR (40 downto 0);
           opt1 : out  STD_LOGIC_VECTOR (2 downto 0);
           opt2 : out  STD_LOGIC_VECTOR (2 downto 0);
           opt3 : out  STD_LOGIC_VECTOR (2 downto 0);
		   n1 : out  STD_LOGIC_VECTOR (7 downto 0);
           n2 : out  STD_LOGIC_VECTOR (7 downto 0);
           n3 : out  STD_LOGIC_VECTOR (7 downto 0);
           n4 : out  STD_LOGIC_VECTOR (7 downto 0));
			  
end component oporators;

-- signals for output of oporators 
signal	opt1 : 	STD_LOGIC_VECTOR (2 downto 0):=(others=>'0'); -- oporator for first Calculator
signal	opt2 : 	STD_LOGIC_VECTOR (2 downto 0):=(others=>'0'); -- oporator for second Calculator
signal	opt3 : 	STD_LOGIC_VECTOR (2 downto 0):=(others=>'0'); -- oporator for output Calculator
signal	n1 :   	STD_LOGIC_VECTOR (7 downto 0):= "00000001";
signal	n2 :   	STD_LOGIC_VECTOR (7 downto 0):= "00000001";
signal	n3 :   	STD_LOGIC_VECTOR (7 downto 0):= "00000001";
signal	n4 :   	STD_LOGIC_VECTOR (7 downto 0):= "00000001";

-- signals for output of first Calculator
signal	cal1 : signed (7 downto 0);

-- signals for output of second Calculator
signal	cal2 : signed (7 downto 0);


begin

	-- op: oporators port map(
	-- 	ins=>instruction,
	-- 	opt1=>opt1,
	-- 	opt2=> opt2,
	-- 	opt3 => opt3,
	-- 	n1 => n1,
	-- 	n2 => n2,
	-- 	n3 => n3,
	-- 	n4 => n4
	-- );
	
	opt1 <= instruction(40 downto 38);
	opt2 <= instruction(37 downto 35);
	opt3 <= instruction(34 downto 32);
	n1 <= instruction(31 downto 24);
	n2 <= instruction(23 downto 16);
	n3 <= instruction(15 downto 8);
	n4 <= instruction(7 downto 0);

	first_c: Calculator port map(
		NUM1 => signed(n1),
		NUM2 => signed(n2),
		OPERATOR => opt1,
		RESULT => cal1

	);

	second_c: Calculator port map(
		NUM1 => signed(n3),
		NUM2 => signed(n4),
		OPERATOR => opt2,
		RESULT => cal2
	);

	OUTPUT_C: Calculator port map(
		NUM1 => CAL1,
		NUM2 => cal2,
		OPERATOR => opt3,
		RESULT => ans
	);

end structural;

