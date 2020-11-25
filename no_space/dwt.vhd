library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
package dwt_pkg is
    type natural_array is array(natural range <>) of natural range 0 to 65535;
end package;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dwt_pkg.all;
ENTITY dwt IS
    PORT (
        wave: IN natural_array( 0 to 7 );
        dwt_wave: OUT natural
    );
END ENTITY;
ARCHITECTURE rtl OF dwt IS
    signal temp_dwt_1: natural_array( 0 to 3 );
    signal temp_dwt_2: natural_array( 0 to 1 );
    signal temp_dwt_3: natural;
BEGIN
    temp_dwt_1(0) <= (wave(0) + wave(1)) / 2;
    temp_dwt_1(1) <= (wave(2) + wave(3)) / 2;
    temp_dwt_1(2) <= (wave(4) + wave(5)) / 2;
    temp_dwt_1(3) <= (wave(6) + wave(7)) / 2;
    temp_dwt_2(0) <= (temp_dwt_1(0) + temp_dwt_1(1)) / 2;
    temp_dwt_2(1) <= (temp_dwt_1(2) + temp_dwt_1(3)) / 2;
    temp_dwt_3 <= (temp_dwt_2(0) + temp_dwt_2(1)) / 2;
    dwt_wave <= temp_dwt_3;
END ARCHITECTURE;