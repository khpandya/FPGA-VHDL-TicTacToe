-- FPGA projects using VHDL/ VHDL 
-- fpga4student.com
-- VHDL code for D Flip FLop
-- VHDL code for rising edge D flip flop 
Library IEEE;
USE IEEE.Std_logic_1164.all;

entity DFF is 
   port(
      Q : out std_logic;    
      Clk :in std_logic;   
      D :in  std_logic    
   );
end DFF;
architecture logic of DFF is  
begin  
 process(Clk)
 begin 
    if(rising_edge(Clk)) then
   Q <= D; 
    end if;       
 end process;  
end logic; 