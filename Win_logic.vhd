library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;        -- @suppress "Deprecated package"
use work.Common.all;

entity Win_logic is
    port(Cells : in CellType;
		  BoardWon: out std_logic;
		  Winner  : out std_logic_vector(1 downto 0)
		  );
end Win_logic;

architecture logic of Win_logic is

signal BlueWin :std_logic;
signal RedWin  :std_logic;


begin
	
	RedWin <= (Cells(0,1) and Cells(1,1) and Cells(2,1)) or (Cells(3,1) and Cells(4,1) and Cells(5,1)) or (Cells(6,1) and Cells(7,1) and Cells(8,1)) or (Cells(0,1) and Cells(3,1) and Cells(6,1)) or (Cells(1,1) and Cells(4,1) and Cells(7,1)) or (Cells(2,1) and Cells(5,1) and Cells(8,1)) or (Cells(0,1) and Cells(4,1) and Cells(8,1)) or (Cells(2,1) and Cells(4,1) and Cells(6,1));
	BlueWin  <= (Cells(0,0) and Cells(1,0) and Cells(2,0)) or (Cells(3,0) and Cells(4,0) and Cells(5,0)) or (Cells(6,0) and Cells(7,0) and Cells(8,0)) or (Cells(0,0) and Cells(3,0) and Cells(6,0)) or (Cells(1,0) and Cells(4,0) and Cells(7,0)) or (Cells(2,0) and Cells(5,0) and Cells(8,0)) or (Cells(0,0) and Cells(4,0) and Cells(8,0)) or (Cells(2,0) and Cells(4,0) and Cells(6,0));
	Winner(0) <= BlueWin;
	Winner(1) <= RedWin;
	BoardWon  <= BoardWon and (Cells(0,0) or Cells(1,0) or Cells(2,0) or Cells(3,0) or Cells(4,0) or Cells(5,0) or Cells(6,0) or Cells(7,0) or Cells(8,0) or Cells(0,1) or Cells(1,1) or Cells(2,1) or Cells(3,1) or Cells(4,1) or Cells(5,1) or Cells(6,1) or Cells(7,1) or Cells(8,1)); 
	
end logic;