ENTITY dwt IS
    PORT (
        wave: IN INTEGER;
        dwt_wave: OUT INTEGER
        );
END ENTITY;

ARCHITECTURE rtl OF dwt IS
    TYPE INTEGER_VECTOR is
        array(1 to 8) of integer;
    SIGNAL temp_wave : INTEGER_VECTOR;

BEGIN
    PROCESS(clk)
    BEGIN
        IF (clk'EVENT AND clk='0') THEN
            
        END IF;
    END PROCESS;
END ARCHITECTURE;
