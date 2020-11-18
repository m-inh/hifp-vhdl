-- library ieee;
-- use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;

ENTITY my_sum IS
    PORT (
        a: IN INTEGER;
        b: IN INTEGER;
        c: OUT INTEGER
        );
END ENTITY;

ARCHITECTURE rtl OF my_sum IS
    
BEGIN
    
    c <= a + b;

END ARCHITECTURE;
