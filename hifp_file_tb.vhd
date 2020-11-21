library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dwt_pkg.all;
use STD.textio.all;
use ieee.std_logic_textio.all;

entity hifp_file_tb is
    generic (num_of_fpid_frames : positive := 32);
end entity;

architecture rtl of hifp_file_tb is

    signal tb_wave_all: natural_array(0 to num_of_fpid_frames*32-1);
    signal tb_fpid_all: natural_array(0 to num_of_fpid_frames-1);

    component hifp is
        generic (num_of_fpid_frames: positive);
    
        port (
            wave_all: in natural_array(0 to num_of_fpid_frames*32-1);
            fpid_all: out natural_array(0 to num_of_fpid_frames-1)
        );
    end component;

    -- for file
    -----------------------------------------
    file file_VECTORS : text;
    file file_RESULTS : text;
    
    constant c_WIDTH : natural := 4;

begin

    en_hifp: hifp
    generic map (num_of_fpid_frames => num_of_fpid_frames)
    port map (
        tb_wave_all,
        tb_fpid_all
    );

    process is
        variable v_ILINE     : line;
        variable v_OLINE     : line;
        -- variable v_ADD_TERM1 : std_logic_vector(c_WIDTH-1 downto 0);
        -- variable v_ADD_TERM2 : std_logic_vector(c_WIDTH-1 downto 0);
        -- variable v_SPACE     : character;
        variable v_wave: natural;
        variable v_wave_all: natural_array(0 to num_of_fpid_frames*32-1);
        variable i: natural := 0;
        variable j: natural := 0;

    begin
        file_open(file_VECTORS, "sample_wave_1024.txt",  read_mode);
        file_open(file_RESULTS, "fpid.txt", write_mode);

        while (not endfile(file_VECTORS) and i < (num_of_fpid_frames*32)) loop
            readline(file_VECTORS, v_ILINE);
            -- read(v_ILINE, v_ADD_TERM1);
            -- read(v_ILINE, v_SPACE);           -- read in the space character
            -- read(v_ILINE, v_ADD_TERM2);

            read(v_ILINE, v_wave);
            v_wave_all(i) := v_wave;

            
       
            -- Pass the variable to a signal to allow the ripple-carry to use it
            -- r_ADD_TERM1 <= v_ADD_TERM1;
            -- r_ADD_TERM2 <= v_ADD_TERM2;
       
            -- wait for 60 ns;

            -- report "wave: " & integer'image(v_wave);
            -- report "wave____: " & integer'image(v_wave_all(i));

            i := i + 1;
      
            -- write(v_OLINE, w_SUM, right, c_WIDTH);
            -- writeline(file_RESULTS, v_ILINE);
        end loop;

        wait for 600000 ns;

        tb_wave_all <= v_wave_all;


        -- wait for 60 ns;
        -- wait for 60 ns;
        -- wait for 60 ns;
        wait for 600000 ns;
        
        while j < (num_of_fpid_frames) loop
            report "fpid: " & integer'image(tb_fpid_all(j));

            write(v_OLINE, tb_fpid_all(j), right, 1);
            -- writeline(file_RESULTS, v_OLINE);

            j := j + 1;
        end loop;
        
        writeline(file_RESULTS, v_OLINE);

        file_close(file_VECTORS);
        file_close(file_RESULTS);

        -- tb_wave_all <= (1, 1, 1, 1, 1, 1, 1, 1, others => 0);
        -- wait for 100 ns;

        -- tb_wave_all(0) <= 3;
        -- tb_wave_all(1) <= 3;
        -- tb_wave_all(2) <= 3;
        -- tb_wave_all(3) <= 3;
        -- tb_wave_all(4) <= 3;
        -- tb_wave_all(5) <= 3;
        -- tb_wave_all(6) <= 3;
        -- tb_wave_all(7) <= 3;
        -- tb_wave_all(8) <= 2;
        -- tb_wave_all(9) <= 2;
        -- tb_wave_all(10) <= 2;
        -- tb_wave_all(11) <= 2;
        -- tb_wave_all(12) <= 2;
        -- tb_wave_all(13) <= 2;
        -- tb_wave_all(14) <= 2;
        -- tb_wave_all(15) <= 2;
        -- tb_wave_all(16) <= 2;
        -- tb_wave_all(17) <= 2;
        -- tb_wave_all(18) <= 2;
        -- tb_wave_all(19) <= 2;
        -- tb_wave_all(20) <= 2;
        -- tb_wave_all(21) <= 2;
        -- tb_wave_all(22) <= 2;
        -- tb_wave_all(23) <= 2;
        -- tb_wave_all(24) <= 2;
        -- tb_wave_all(25) <= 2;
        -- tb_wave_all(26) <= 2;
        -- tb_wave_all(27) <= 2;
        -- tb_wave_all(28) <= 2;
        -- tb_wave_all(29) <= 2;
        -- tb_wave_all(30) <= 2;
        -- tb_wave_all(31) <= 2;

        -- tb_wave_all(32) <= 4;
        -- tb_wave_all(33) <= 4;
        -- tb_wave_all(34) <= 4;
        -- tb_wave_all(35) <= 4;
        -- tb_wave_all(36) <= 4;
        -- tb_wave_all(37) <= 4;
        -- tb_wave_all(38) <= 4;
        -- tb_wave_all(39) <= 4;
        -- tb_wave_all(40) <= 2;
        -- tb_wave_all(41) <= 2;
        -- tb_wave_all(42) <= 2;
        -- tb_wave_all(43) <= 2;
        -- tb_wave_all(44) <= 2;``
        -- tb_wave_all(45) <= 2;
        -- tb_wave_all(46) <= 2;
        -- tb_wave_all(47) <= 2;
        -- tb_wave_all(48) <= 2;
        -- tb_wave_all(49) <= 2;
        -- tb_wave_all(50) <= 2;
        -- tb_wave_all(51) <= 2;
        -- tb_wave_all(52) <= 2;
        -- tb_wave_all(53) <= 2;
        -- tb_wave_all(54) <= 2;
        -- tb_wave_all(55) <= 2;
        -- tb_wave_all(56) <= 2;
        -- tb_wave_all(57) <= 2;
        -- tb_wave_all(58) <= 2;
        -- tb_wave_all(59) <= 2;
        -- tb_wave_all(60) <= 2;
        -- tb_wave_all(61) <= 2;
        -- tb_wave_all(62) <= 2;
        -- tb_wave_all(63) <= 2;
        
        -- wait for 100 ns;
        

        -- tb_wave_all <= (1, 2, 3, 4, 5, 6, 7, 8, others => 7);
        -- wait for 100 ns;

        wait;

    end process;

end architecture;