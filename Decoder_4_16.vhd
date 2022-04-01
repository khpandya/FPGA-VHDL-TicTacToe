library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; -- @suppress "Deprecated package"

entity Decoder_4_16 is
    port(input  : in  std_logic_vector(3 downto 0);
         output : out std_logic_vector(8 downto 0)
        );
end Decoder_4_16;

architecture logic of Decoder_4_16 is
begin
    output(0)  <= (not input(3) and not input(2) and not input(1) and not input(0)); -- 0000
	output(1)  <= (not input(3) and not input(2) and not input(1) and     input(0)); -- 0001
	output(2)  <= (not input(3) and not input(2) and     input(1) and not input(0)); -- 0010
	output(3)  <= (not input(3) and not input(2) and     input(1) and     input(0)); -- 0011
	output(4)  <= (not input(3) and     input(2) and not input(1) and not input(0)); -- 0100
	output(5)  <= (not input(3) and     input(2) and not input(1) and     input(0)); -- 0101
	output(6)  <= (not input(3) and     input(2) and     input(1) and not input(0)); -- 0110
	output(7)  <= (not input(3) and     input(2) and     input(1) and     input(0)); -- 0111
	output(8)  <= (    input(3) and not input(2) and not input(1) and not input(0)); -- 1000
--	output(9)  <= (    input(3) and not input(2) and not input(1) and     input(0)); -- 1001
--	output(10) <= (    input(3) and not input(2) and     input(1) and not input(0)); -- 1010
--	output(11) <= (    input(3) and not input(2) and     input(1) and     input(0)); -- 1011
--	output(12) <= (    input(3) and     input(2) and not input(1) and not input(0)); -- 1100
--	output(13) <= (    input(3) and     input(2) and not input(1) and     input(0)); -- 1101
--	output(14) <= (    input(3) and     input(2) and     input(1) and not input(0)); -- 1110
--	output(15) <= (    input(3) and     input(2) and     input(1) and     input(0)); -- 1111
end logic;
