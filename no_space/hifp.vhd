library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dwt_pkg.all;
entity hifp is
    generic (num_of_fpid_frames: positive := 4096);
    port (
        wave_all: in natural_array(0 to num_of_fpid_frames*32-1);
        wave_dwt_all: out natural_array(0 to num_of_fpid_frames-1);
        fpid_all: out natural_array(0 to num_of_fpid_frames-1)
    );
end entity;
architecture rtl of hifp is
    signal temp_dwt_all: natural_array(0 to num_of_fpid_frames-1);
    component dwt_all is
        generic (num_of_fpid_frames : positive);
        port (
            wave_all: in natural_array( 0 to num_of_fpid_frames*32-1 );
            dwt_wave_all: out natural_array( 0 to num_of_fpid_frames-1 )
        );
    end component;
    component feature_extraction is
        generic (num_of_fpid_frames: positive);
        port (
            dwt_wave_all: in natural_array(0 to num_of_fpid_frames-1);
            fpid_all: out natural_array(0 to num_of_fpid_frames-1)
        );
    end component;
begin
    en_dwt_all: dwt_all
    generic map(num_of_fpid_frames => num_of_fpid_frames)
    port map(
        wave_all,
        temp_dwt_all
    );
    en_feature_extraction: feature_extraction
    generic map(num_of_fpid_frames => num_of_fpid_frames)
    port map(
        temp_dwt_all,
        fpid_all
    );
    wave_dwt_all <= temp_dwt_all;
end architecture;