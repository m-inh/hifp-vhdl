library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;
use work.dwt_pkg.all;


ENTITY dwt_tb IS
END ENTITY;

ARCHITECTURE rtl OF dwt_tb IS
    
    signal tb_wave: natural_array( 0 to 7 );
    signal tb_dwt_wave: natural;

    component dwt is 
        port (
            wave: in natural_array;
            dwt_wave: out natural
        );
    end component dwt;

BEGIN
    
    dwt_en: dwt
    port map (
        tb_wave,
        tb_dwt_wave
    );

    process is
    begin
        tb_wave <= (0, 0, 0, 0, 0, 0, 0, 0);
        wait for 100 ns;
        tb_wave <= (1, 1, 1, 1, 1, 1, 1, 1);
        wait for 100 ns;
        tb_wave <= (0, 1, 2, 3, 4, 5, 6, 7);
        wait for 100 ns;
    end process;

END ARCHITECTURE;
