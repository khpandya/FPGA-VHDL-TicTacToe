library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

package CellStuff is
	type CellType is array (0 to 8, 0 to 1) of std_logic;
end CellStuff;

use CellStuff.all;

entity Display_eval is

	--type CellType is array (0 to 8, 0 to 1) of std_logic;

	port(BoardWon: in  std_logic;
		  Winner  : in  std_logic_vector(1 downto 0);
		  Cells   : in  CellType;
		  Display : out CellType;
		  );
end Display_eval;



architecture logic of Display_eval is


begin
	
	Display(0,0) <= (BoardWon and Winner(0)) or (not BoardWon and Cells(0,0));
	Display(1,0) <= (BoardWon and Winner(0)) or (not BoardWon and Cells(1,0));
	Display(2,0) <= (BoardWon and Winner(0)) or (not BoardWon and Cells(2,0));
	Display(3,0) <= (BoardWon and Winner(0)) or (not BoardWon and Cells(3,0));
	Display(4,0) <= (BoardWon and Winner(0)) or (not BoardWon and Cells(4,0));
	Display(5,0) <= (BoardWon and Winner(0)) or (not BoardWon and Cells(5,0));
	Display(6,0) <= (BoardWon and Winner(0)) or (not BoardWon and Cells(6,0));
	Display(7,0) <= (BoardWon and Winner(0)) or (not BoardWon and Cells(7,0));
	Display(8,0) <= (BoardWon and Winner(0)) or (not BoardWon and Cells(8,0));
	
	
	Display(0,1) <= (BoardWon and Winner(1)) or (not BoardWon and Cells(0,1));
	Display(1,1) <= (BoardWon and Winner(1)) or (not BoardWon and Cells(1,1));
	Display(2,1) <= (BoardWon and Winner(1)) or (not BoardWon and Cells(2,1));
	Display(3,1) <= (BoardWon and Winner(1)) or (not BoardWon and Cells(3,1));
	Display(4,1) <= (BoardWon and Winner(1)) or (not BoardWon and Cells(4,1));
	Display(5,1) <= (BoardWon and Winner(1)) or (not BoardWon and Cells(5,1));
	Display(6,1) <= (BoardWon and Winner(1)) or (not BoardWon and Cells(6,1));
	Display(7,1) <= (BoardWon and Winner(1)) or (not BoardWon and Cells(7,1));
	Display(8,1) <= (BoardWon and Winner(1)) or (not BoardWon and Cells(8,1));
	
	
end logic;