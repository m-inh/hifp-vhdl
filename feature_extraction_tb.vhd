library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dwt_pkg.all;

entity feature_extraction_tb is
    generic (num_of_fpid_frames: positive := 32);
end entity;

architecture rtl of feature_extraction_tb is

    signal tb_dwt_all: natural_array(0 to num_of_fpid_frames-1);
    signal tb_fpid_all: natural_array(0 to num_of_fpid_frames-1);

    component feature_extraction is
        generic (num_of_fpid_frames: positive);

        port (
            dwt_wave_all: in natural_array(0 to num_of_fpid_frames-1);
            fpid_all: out natural_array(0 to num_of_fpid_frames-1)
        );
    end component;

begin

    en_feature_extraction: feature_extraction
    generic map (num_of_fpid_frames => num_of_fpid_frames)
    port map (
        tb_dwt_all,
        tb_fpid_all
    );

    process is
    begin
        tb_dwt_all <= (10, 12, others => 0);
        wait for 100 ns;

        tb_dwt_all <= (12, 10, others => 0);
        wait for 100 ns;

        tb_dwt_all <= (10000, 1200, others => 0);
        wait for 100 ns;
    end process;

end architecture;