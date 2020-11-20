library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;
use work.dwt_pkg.all;


ENTITY dwt_all_tb IS
    generic (num_of_fpid_frames : positive := 2);
END ENTITY;

ARCHITECTURE rtl OF dwt_all_tb IS
    
    signal tb_wave_all: natural_array( 0 to num_of_fpid_frames*32-1 );
    signal tb_dwt_wave_all: natural_array( 0 to num_of_fpid_frames-1 );

    component dwt_all is 
        generic (num_of_fpid_frames : positive);
        port (
            wave_all: in natural_array( 0 to num_of_fpid_frames*32-1 );
            dwt_wave_all: out natural_array( 0 to num_of_fpid_frames-1 )
        );
    end component dwt_all;

BEGIN
    
    dwt_all_en: dwt_all 
    generic map(num_of_fpid_frames)
    port map (
        tb_wave_all,
        tb_dwt_wave_all
    );

    process is
    begin
        tb_wave_all <= (1, 1, 1, 1, 1, 1, 1, 1, others => 0);
        wait for 100 ns;
        
        tb_wave_all(0) <= 3;
        tb_wave_all(1) <= 3;
        tb_wave_all(2) <= 3;
        tb_wave_all(3) <= 3;
        tb_wave_all(4) <= 3;
        tb_wave_all(5) <= 3;
        tb_wave_all(6) <= 3;
        tb_wave_all(7) <= 3;
        tb_wave_all(8) <= 2;
        tb_wave_all(9) <= 2;
        tb_wave_all(10) <= 2;
        tb_wave_all(11) <= 2;
        tb_wave_all(12) <= 2;
        tb_wave_all(13) <= 2;
        tb_wave_all(14) <= 2;
        tb_wave_all(15) <= 2;
        tb_wave_all(16) <= 2;
        tb_wave_all(17) <= 2;
        tb_wave_all(18) <= 2;
        tb_wave_all(19) <= 2;
        tb_wave_all(20) <= 2;
        tb_wave_all(21) <= 2;
        tb_wave_all(22) <= 2;
        tb_wave_all(23) <= 2;
        tb_wave_all(24) <= 2;
        tb_wave_all(25) <= 2;
        tb_wave_all(26) <= 2;
        tb_wave_all(27) <= 2;
        tb_wave_all(28) <= 2;
        tb_wave_all(29) <= 2;
        tb_wave_all(30) <= 2;
        tb_wave_all(31) <= 2;

        tb_wave_all(32) <= 4;
        tb_wave_all(33) <= 4;
        tb_wave_all(34) <= 4;
        tb_wave_all(35) <= 4;
        tb_wave_all(36) <= 4;
        tb_wave_all(37) <= 4;
        tb_wave_all(38) <= 4;
        tb_wave_all(39) <= 4;
        tb_wave_all(40) <= 2;
        tb_wave_all(41) <= 2;
        tb_wave_all(42) <= 2;
        tb_wave_all(43) <= 2;
        tb_wave_all(44) <= 2;
        tb_wave_all(45) <= 2;
        tb_wave_all(46) <= 2;
        tb_wave_all(47) <= 2;
        tb_wave_all(48) <= 2;
        tb_wave_all(49) <= 2;
        tb_wave_all(50) <= 2;
        tb_wave_all(51) <= 2;
        tb_wave_all(52) <= 2;
        tb_wave_all(53) <= 2;
        tb_wave_all(54) <= 2;
        tb_wave_all(55) <= 2;
        tb_wave_all(56) <= 2;
        tb_wave_all(57) <= 2;
        tb_wave_all(58) <= 2;
        tb_wave_all(59) <= 2;
        tb_wave_all(60) <= 2;
        tb_wave_all(61) <= 2;
        tb_wave_all(62) <= 2;
        tb_wave_all(63) <= 2;
        

        wait for 100 ns;

        tb_wave_all <= (1, 2, 3, 4, 5, 6, 7, 8, others => 7);

        wait for 100 ns;
    end process;

END ARCHITECTURE;
