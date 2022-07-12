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

    -- decode Instruction (n1 34 downto 27) (n2 25 downto 18) (n3 16 downto 9) (n4 7 downto 0)
    -- (opt1 44-42) (opt2 41-39) (opt3 38-36) (out_reg 47-45)
        if Instruction(35)='1'
        then
            -- index := std_logic_vector(to_signed(to_integer(signed (instruction(46 downto 39))),3));
            index := to_integer(signed (instruction(34 downto 27)));
            ins_v(31 downto 24):= std_logic_vector(reg_out(index));
        else
            ins_v(31 downto 24):=instruction(34 downto 27);

        end if;
        if Instruction(26)='1'
        then
            -- index := std_logic_vector(to_signed(to_integer(signed(instruction(37 downto 30))),3));
            index := to_integer(signed(instruction(25 downto 18)));
            ins_v(23 downto 16):= std_logic_vector(reg_out(index));
        else
            ins_v(23 downto 16):=instruction(25 downto 18);

        end if;
        if Instruction(17)='1'
        then
            -- index := std_logic_vector(to_signed(to_integer(signed (instruction(28 downto 21))),3));
            index := to_integer(signed (instruction(16 downto 9)));
            ins_v(15 downto 8):= std_logic_vector(reg_out(index));
        else
            ins_v(15 downto 8):=instruction(16 downto 9);

        end if;
        if Instruction(8)='1'
        then
            -- index := std_logic_vector(to_signed(to_integer(signed (instruction(19 downto 12))),3));
            index := to_integer(signed(instruction(7 downto 0)));
            ins_v(7 downto 0):= std_logic_vector(reg_out(index));
        else
            ins_v(7 downto 0):=instruction(7 downto 0);

        end if;
        ins_v(40 downto 32) := instruction(44 downto 36);

        
        -- set instruction output enable
        reg_en(to_integer(unsigned(instruction(47 downto 45)))) <= '1';
    
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
