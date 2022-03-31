library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;        -- @suppress "Deprecated package"
use work.Common.all;

entity Cell_logic is
    port(Q          : in    std_logic;
         CellSelect : in    std_logic_vector(8 downto 0);
         BoardWon   : in    std_logic;
         Cells      : inout CellType
        );
end Cell_logic;

architecture logic of Cell_logic is

    component DFF is
        port(
            Q   : out std_logic;
            Clk : in  std_logic;
            D   : in  std_logic
        );
    end component;

    signal D         : std_logic_vector(8 downto 0);
    signal Pulse     : CellType;
    signal Qi        : CellType;
    signal Full      : std_logic_vector(8 downto 0);
    signal temp_vect : std_logic_vector(8 downto 0);
begin
    process(BoardWon, CellSelect) is
    begin
        if (BoardWon = '1') then
            temp_vect <= "111111111";
        end if;
        if (BoardWon = '0') then
            temp_vect <= "000000000";
        end if;
        D <= (not temp_vect) and CellSelect;
    end process;

    Cells(0, 0) <= Qi(0, 0);
    Cells(1, 0) <= Qi(1, 0);
    Cells(2, 0) <= Qi(2, 0);
    Cells(3, 0) <= Qi(3, 0);
    Cells(4, 0) <= Qi(4, 0);
    Cells(5, 0) <= Qi(5, 0);
    Cells(6, 0) <= Qi(6, 0);
    Cells(7, 0) <= Qi(7, 0);
    Cells(8, 0) <= Qi(8, 0);

    Cells(0, 1) <= Qi(0, 1);
    Cells(1, 1) <= Qi(1, 1);
    Cells(2, 1) <= Qi(2, 1);
    Cells(3, 1) <= Qi(3, 1);
    Cells(4, 1) <= Qi(4, 1);
    Cells(5, 1) <= Qi(5, 1);
    Cells(6, 1) <= Qi(6, 1);
    Cells(7, 1) <= Qi(7, 1);
    Cells(8, 1) <= Qi(8, 1);

    Memory00 : DFF port map(Qi(0, 0), Pulse(0, 0), D(0));
    Memory01 : DFF port map(Qi(0, 1), Pulse(0, 1), D(0));
    Memory10 : DFF port map(Qi(1, 0), Pulse(1, 0), D(1));
    Memory11 : DFF port map(Qi(1, 1), Pulse(1, 1), D(1));
    Memory20 : DFF port map(Qi(2, 0), Pulse(2, 0), D(2));
    Memory21 : DFF port map(Qi(2, 1), Pulse(2, 1), D(2));
    Memory30 : DFF port map(Qi(3, 0), Pulse(3, 0), D(3));
    Memory31 : DFF port map(Qi(3, 1), Pulse(3, 1), D(3));
    Memory40 : DFF port map(Qi(4, 0), Pulse(4, 0), D(4));
    Memory41 : DFF port map(Qi(4, 1), Pulse(4, 1), D(4));
    Memory50 : DFF port map(Qi(5, 0), Pulse(5, 0), D(5));
    Memory51 : DFF port map(Qi(5, 1), Pulse(5, 1), D(5));
    Memory60 : DFF port map(Qi(6, 0), Pulse(6, 0), D(6));
    Memory61 : DFF port map(Qi(6, 1), Pulse(6, 1), D(6));
    Memory70 : DFF port map(Qi(7, 0), Pulse(7, 0), D(7));
    Memory71 : DFF port map(Qi(7, 1), Pulse(7, 1), D(7));
    Memory80 : DFF port map(Qi(8, 0), Pulse(8, 0), D(8));
    Memory81 : DFF port map(Qi(8, 1), Pulse(8, 1), D(8));

--    D <= (not BoardWon) and to_bit(CellSelect);

    Full(0) <= Qi(0, 0) or Qi(0, 1);
    Full(1) <= Qi(1, 0) or Qi(1, 1);
    Full(2) <= Qi(2, 0) or Qi(2, 1);
    Full(3) <= Qi(3, 0) or Qi(3, 1);
    Full(4) <= Qi(4, 0) or Qi(4, 1);
    Full(5) <= Qi(5, 0) or Qi(5, 1);
    Full(6) <= Qi(6, 0) or Qi(6, 1);
    Full(7) <= Qi(7, 0) or Qi(7, 1);
    Full(8) <= Qi(8, 0) or Qi(8, 1);

    Pulse(0, 0) <= (Full(0) or BoardWon) and (Q);
    Pulse(1, 0) <= (Full(1) or BoardWon) and (Q);
    Pulse(2, 0) <= (Full(2) or BoardWon) and (Q);
    Pulse(3, 0) <= (Full(3) or BoardWon) and (Q);
    Pulse(4, 0) <= (Full(4) or BoardWon) and (Q);
    Pulse(5, 0) <= (Full(5) or BoardWon) and (Q);
    Pulse(6, 0) <= (Full(6) or BoardWon) and (Q);
    Pulse(7, 0) <= (Full(7) or BoardWon) and (Q);
    Pulse(8, 0) <= (Full(8) or BoardWon) and (Q);

    Pulse(0, 1) <= (Full(0) or BoardWon) and (not Q);
    Pulse(1, 1) <= (Full(1) or BoardWon) and (not Q);
    Pulse(2, 1) <= (Full(2) or BoardWon) and (not Q);
    Pulse(3, 1) <= (Full(3) or BoardWon) and (not Q);
    Pulse(4, 1) <= (Full(4) or BoardWon) and (not Q);
    Pulse(5, 1) <= (Full(5) or BoardWon) and (not Q);
    Pulse(6, 1) <= (Full(6) or BoardWon) and (not Q);
    Pulse(7, 1) <= (Full(7) or BoardWon) and (not Q);
    Pulse(8, 1) <= (Full(8) or BoardWon) and (not Q);

end logic;
