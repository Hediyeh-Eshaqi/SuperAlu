----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:09:48 07/06/2022 
-- Design Name: 
-- Module Name:    ALU-Reg - Behavioral 
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

entity ALU_Reg is
    Port ( Instruction : in  STD_LOGIC_VECTOR (47 downto 0);
           RESULT : out  STD_LOGIC_VECTOR (7 downto 0));
end ALU_Reg;

architecture Behavioral of ALU_Reg is
COMPONENT ALU is
    Port ( instruction : in  STD_LOGIC_VECTOR (40 downto 0);
           ans : out  signed (7 downto 0));
end COMPONENT ALU;

component reg is 
    port( 
        data_in: in  signed (7 downto 0);
        enable: in std_logic;
        data_out: out signed (7 downto 0));
end COMPONENT reg;

-- alu input output ports
signal alu_instruction : STD_LOGIC_VECTOR (40 downto 0):= (others => '0');
signal alu_result : signed (7 downto 0):= (others => '0');

-- register file input, output, enable ports
type reg_array is array (0 to 7) of signed(7 downto 0);
signal reg_in : signed(7 downto 0);
signal reg_out : reg_array;
signal reg_en : std_logic_vector(7 downto 0):= (others => '0');

begin

    reg_file:  for i in 0 to 7 generate
		regu: reg port map (data_in => reg_in,enable=>reg_en(i),data_out=>reg_out(i));
    end generate;

    ALU_unit: ALU port map(
        instruction => alu_instruction,
        ans => alu_result
    );
    RESULT <= std_logic_vector(alu_result); 
    reg_in <= alu_result; 

    -- process for setting alu input instruction
    alu_in: process(instruction)
    variable ins_v: std_logic_vector(40 downto 0):= (others => '0');
    -- variable index: std_logic_vector(2 downto 0);
    variable index: integer:=0;
    begin
    -- reset all register enables
    reg_en<=(others => '0');
    --index :=(others=>'0');

    -- decode Instruction (n1 46 - 39) (n2 37 - 30) (n3 28 - 21) (n4 19 - 12)
    -- (opt1 11-9) (opt2 8-6) (opt3 5-3) (out_reg 2-0)
        if Instruction(47)='1'
        then
            -- index := std_logic_vector(to_signed(to_integer(signed (instruction(46 downto 39))),3));
            index := to_integer(signed (instruction(46 downto 39)));
            ins_v(40 downto 33):= std_logic_vector(reg_out(index));
        else
            ins_v(40 downto 33):=instruction(46 downto 39);

        end if;
        if Instruction(38)='1'
        then
            -- index := std_logic_vector(to_signed(to_integer(signed(instruction(37 downto 30))),3));
            index := to_integer(signed(instruction(37 downto 30)));
            ins_v(32 downto 25):= std_logic_vector(reg_out(index));
        else
            ins_v(32 downto 25):=instruction(37 downto 30);

        end if;
        if Instruction(29)='1'
        then
            -- index := std_logic_vector(to_signed(to_integer(signed (instruction(28 downto 21))),3));
            index := to_integer(signed (instruction(28 downto 21)));
            ins_v(24 downto 17):= std_logic_vector(reg_out(index));
        else
            ins_v(24 downto 17):=instruction(28 downto 21);

        end if;
        if Instruction(20)='1'
        then
            -- index := std_logic_vector(to_signed(to_integer(signed (instruction(19 downto 12))),3));
            index := to_integer(signed(instruction(19 downto 12)));
            ins_v(16 downto 9):= std_logic_vector(reg_out(index));
        else
            ins_v(16 downto 9):=instruction(19 downto 12);

        end if;
        ins_v(8 downto 0) := instruction(11 downto 3);

        
        -- set instruction output enable
        reg_en(to_integer(unsigned(instruction(2 downto 0)))) <= '1';
    
        alu_instruction <= ins_v;
    end process alu_in;

end Behavioral;

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity reg is
    port(
        data_in: in  signed (7 downto 0);
        enable: in std_logic;
        data_out: out signed (7 downto 0):= (others => '0'));
end entity reg;

architecture Behavioral of reg is

begin


process 
variable data : signed (7 downto 0):= (others => '0');
begin
    wait until enable = '1';
    data:= data_in;
    data_out <= data;

end process;

end Behavioral;
