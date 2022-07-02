
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use ieee.numeric_std.all;



entity Calculator is
		Port ( 	NUM1 : in  signed (7 downto 0) ;
					NUM2 : in  signed (7 downto 0) ;
					OPERATOR : in std_logic_vector(2 downto 0);
					RESULT : out  signed (7 downto 0));
end Calculator;

architecture Behavioral of Calculator is

component Addition is 
    Port ( NUM1 : in  signed (7 downto 0);
           NUM2 : in  signed (7 downto 0);
           RESULT : out  signed (7 downto 0));
end component Addition;

component Subtraction is 
    Port ( NUM1 : in  signed (7 downto 0);
           NUM2 : in  signed (7 downto 0);
           RESULT : out  signed (7 downto 0));
end component Subtraction;

component Multiplication is
    Port ( NUM1 : in  signed (7 downto 0);
           NUM2 : in  signed (7 downto 0);
           RESULT : out  signed (7 downto 0));
end component Multiplication;

component Division is 
    Port ( NUM1 : in  signed (7 downto 0);
           NUM2 : in  signed (7 downto 0);
           RESULT : out  signed (7 downto 0));
end component Division;

component SQRT is 
    Generic ( b  : natural range 4 to 32 := 16 ); 
    Port ( value  : in   STD_LOGIC_VECTOR (15 downto 0);
           result : out  STD_LOGIC_VECTOR (7 downto 0));
end component SQRT;

component Logarithm is
Port ( NUM1 : in  signed (7 downto 0) ;
          RESULT : out  signed (7 downto 0));
end component Logarithm;

component Power is 
Port (  NUM1 : in  signed (7 downto 0) ;
           NUM2 : in  signed (7 downto 0);
           RESULT : out  signed (7 downto 0));
end component Power;

signal add_res, sub_res, mul_res, div_res, log_res, pow_res : signed (7 downto 0);
signal sqrt_res : STD_LOGIC_VECTOR(7 downto 0);
signal tmp : STD_LOGIC_VECTOR(15 downto 0);
begin
	
	tmp <= std_logic_vector(to_signed(to_integer(NUM1),16));
	
	res_add : Addition port map(NUM1, NUM2, add_res);
	res_sub : Subtraction port map(NUM1, NUM2, sub_res);
	res_mul : Multiplication port map(NUM1, NUM2, mul_res);
	res_div : Division port map(NUM1, NUM2, div_res);
	res_sqrt : SQRT port map(tmp , sqrt_res);
	res_log : Logarithm port map(NUM1,log_res);
	res_pow : Power port map(NUM1, NUM2, pow_res);
	

	
	with OPERATOR select 
			RESULT <= add_res when "000",
						 sub_res when "001",
						 mul_res when "010",
						 div_res when "011",
						 signed(sqrt_res) when "110",
						 pow_res when "100",
						 log_res when "101",
						 "00000000" when others;

end Behavioral;

