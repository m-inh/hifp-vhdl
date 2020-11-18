-- `e.numeric_std.all;

ENTITY my_sum_tb IS
END ENTITY;

ARCHITECTURE rtl OF my_sum_tb IS
    
    signal at: integer;
    signal bt: integer;
    signal ct: integer;

    component my_sum is 
        port (
            a: in integer;
            b: in integer;
            c: out integer
        );
    end component my_sum;

BEGIN
    
    my_sum_en: my_sum
    port map (
        a => at,
        b => bt,
        c => ct
    );

    process is
    begin
        at <= 1;
        bt <= 1;
        report "okmen";
        wait for 1000000000 ns;
    end process;

END ARCHITECTURE;
