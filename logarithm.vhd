
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.math_real.all;



entity Logarithm is
	Port ( NUM1 : in  signed (7 downto 0) ;
          RESULT : out  signed (7 downto 0));
end Logarithm;

architecture Behavioral of Logarithm is
function Log2( input:integer ) return integer is
	variable temp,log,i:integer;
	begin
		i:=0;
		temp:=input;
		log:=0;
		for i in 0 to 100 loop
			if (temp > 1) then
				temp:=temp/2;
				log:=log+1;
			end if;
		end loop;
	return log;
end function log2;
begin

result <= to_signed(Log2(TO_INTEGER(NUM1)),8);


end Behavioral;

