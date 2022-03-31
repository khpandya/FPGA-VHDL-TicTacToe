
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;
	 
entity Mar28 is
    port(SW  : in  std_logic_vector (3 downto 0);
			KEY : in  std_logic_vector (3 downto 0);
			LEDR: out std_logic_vector (9 downto 0);
         HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: out std_logic_vector (6 downto 0));
			
end Mar28;

architecture logic of Mar28 is



component Decoder4_16 is
    port (input : in  std_logic_vector(3 downto 0);
		    output: out std_logic_vector(15 downto 0)
	 );
end component;




component Display_eval is

	 --type CellType is array (0 to 8, 0 to 1) of std_logic;

    port (BoardWon: in  std_logic;
		    Winner  : in  std_logic_vector(1 downto 0);
		    Cells   : in  CellType;
		    Display : out CellType
	 );
end component;




component Cell_logic is

	 --type CellType is array (0 to 8, 0 to 1) of std_logic;

    port (Q         : in  std_logic;
		    CellSelect: in  std_logic_vector(8 downto 0);
		    BoardWon  : in  std_logic;
		    Cells     : out CellType;
	 );
end component;




component Win_logic is
    port (Cells   : in  array (0 to 8, 0 to 1) of std_logic;
		    BoardWon: out std_logic;
		    Winner  : out std_logic_vector(1 downto 0);
    );
end component;




component Valid_selection is
    port (Cells:          in  array (0 to 8, 0 to 1) of std_logic;
	       CellSelect:     in  std_logic_vector(8 downto 0);
			 BoardWon:       in  std_logic;
		    ValidSelection: out std_logic;
	 );
end component;




component TFF is
    port ( T    : in  std_logic;
	        Clock: in  std_logic;
	        Q    : out std_logic
	 );
end component;


		 

signal CellSelect     :std_logic_vector(8 downto 0);
signal Cells          :array (0 to 8, 0 to 1) of std_logic;
signal BoardWon       :std_logic;
signal ValidSelection :std_logic;
signal Q              :std_logic;
signal Winner         :std_logic_vector(1 downto 0);
signal Display        :array (0 to 8, 0 to 1) of std_logic;


BEGIN
                                                        --input                         --output
load_switches:                Decoder4_16     port map (SW(3 downto 0),                 CellSelect);
determine_selection_validity: Valid_selection port map (Cells, CellSelect, BoardWon,    ValidSelection);
determine_board_win_state:    Win_logic       port map (Cells,                          BoardWon, Winner);
determine_board_cell_state:   Cell_logic      port map (Q, CellSelect, BoardWon,        Cells);
determine_display:            Display_eval    port map (BoardWon, Winner, Cells,        Display);
Turn:                         TFF             port map (ValidSelection, KEY(0),         Q);

LED(9) <= Q;
LED(8) <= Q;
LED(7) <= Q;
LED(6) <= Q;
LED(5) <= Q;

LED(4) <= not Q;
LED(3) <= not Q;
LED(2) <= not Q;
LED(1) <= not Q;
LED(0) <= not Q;

HEX5(3) <= Display(0,1);
HEX5(6) <= Display(1,1);
HEX5(0) <= Display(2,1);

HEX4(3) <= Display(0,0);
HEX4(6) <= Display(1,0);
HEX4(0) <= Display(2,0);

HEX3(3) <= Display(3,1);
HEX3(6) <= Display(4,1);
HEX3(0) <= Display(5,1);

HEX2(3) <= Display(3,0);
HEX2(6) <= Display(4,0);
HEX2(0) <= Display(5,0);

HEX1(3) <= Display(6,1);
HEX1(6) <= Display(7,1);
HEX1(0) <= Display(8,1);

HEX0(3) <= Display(6,0);
HEX0(6) <= Display(7,0);
HEX0(0) <= Display(8,0);





END logic;
