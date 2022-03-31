library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; -- @suppress "Deprecated package"
use work.Common.all;



entity Valid_selection is
    port (Cells:          in  CellType;
	       CellSelect:     in  std_logic_vector(8 downto 0);
			 BoardWon:       in  std_logic;
		    ValidSelection: out std_logic
	 );
end Valid_selection;




architecture logic of Valid_selection is

signal CellFull, CellConflict :std_logic_vector(8 downto 0);
signal NoCellConflict :std_logic;


begin

	CellFull(0) <= (Cells(0,0) or Cells(0,1));
	CellFull(1) <= (Cells(1,0) or Cells(1,1));
	CellFull(2) <= (Cells(2,0) or Cells(2,1));
	CellFull(3) <= (Cells(3,0) or Cells(3,1));
	CellFull(4) <= (Cells(4,0) or Cells(4,1));
	CellFull(5) <= (Cells(5,0) or Cells(5,1));
	CellFull(6) <= (Cells(6,0) or Cells(6,1));
	CellFull(7) <= (Cells(7,0) or Cells(7,1));
	CellFull(8) <= (Cells(8,0) or Cells(8,1));
	
	CellConflict(0) <= CellFull(0) and CellSelect(0);
	CellConflict(1) <= CellFull(1) and CellSelect(1);
	CellConflict(2) <= CellFull(2) and CellSelect(2);
	CellConflict(3) <= CellFull(3) and CellSelect(3);
	CellConflict(4) <= CellFull(4) and CellSelect(4);
	CellConflict(5) <= CellFull(5) and CellSelect(5);
	CellConflict(6) <= CellFull(6) and CellSelect(6);
	CellConflict(7) <= CellFull(7) and CellSelect(7);
	CellConflict(8) <= CellFull(8) and CellSelect(8);
	
	NoCellConflict <= not(CellConflict(0) or CellConflict(1) or CellConflict(2) or CellConflict(3) or CellConflict(4) or CellConflict(5) or CellConflict(6) or CellConflict(7) or CellConflict(8));
	
	ValidSelection <= BoardWon or NoCellConflict;

end logic;