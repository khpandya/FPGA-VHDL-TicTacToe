--https://allaboutfpga.com/vhdl-code-flipflop-d-t-jk-sr/#:~:text=Flipflop%20truth%20table-,VHDL%20Code%20for%20T%C2%A0FlipFlop,-library%20IEEE%3B

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity TFlipFlop is
	port( T    : in  std_logic;
	      Clock: in  std_logic;
	      Q    : out std_logic
	);
end TFlipFlop;
 
architecture logic of TFlipFlop is

signal tmp: std_logic;


begin
	process (Clock)
		begin
		
			if Clock'event and Clock='1' then
				if T='0' then
					tmp <= tmp;
				elsif T='1' then
					tmp <= not (tmp);
				end if;
			end if;
			
	end process;
	
	Q <= tmp;
	
end logic;
