
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.NUMERIC_STD.all;


entity Power is
	Port (  NUM1 : in  signed (7 downto 0) ;
           NUM2 : in  signed (7 downto 0);
           RESULT : out  signed (7 downto 0));
end Power;

architecture Behavioral of Power is
function pow( input1:integer ; input2:integer ) return integer is
	variable temp1,temp2,i,res:integer;
	begin
		i:=0;
		temp1:=input1;
		temp2:=input2;
		res:=input1;
		if(input2 = 0) 
			then res:=1;
		else
			for i in 0 to 100 loop
				if (temp2 > 1) then
					res := res*temp1;
					temp2:=temp2-1;
				end if;
			end loop;
		end if;
	return res;
end function pow;
begin
	result <= to_signed(pow(input1=>TO_INTEGER(NUM1),input2=>TO_INTEGER(NUM2)),8);

end Behavioral;

