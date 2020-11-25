library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dwt_pkg.all;
entity dwt_all is
    generic (num_of_fpid_frames : positive := 4096);
    port (
        wave_all: in natural_array( 0 to num_of_fpid_frames*32-1 );
        dwt_wave_all: out natural_array( 0 to num_of_fpid_frames-1 )
    );
end entity;
architecture rtl of dwt_all is
    signal tmp_wave_all: natural_array( 0 to num_of_fpid_frames*32-1 );
    signal tmp_dwt_all: natural_array( 0 to num_of_fpid_frames-1 );
    component dwt is 
        port (
            wave: in natural_array;
            dwt_wave: out natural
        );
    end component dwt;
begin
    tmp_wave_all <= wave_all;
    gen_dwt: for i in 0 to num_of_fpid_frames-1 generate
        dwt_en: dwt 
        port map (
            tmp_wave_all( i*32 to i*32+7 ),
            tmp_dwt_all(i)
        );
    end generate;
    dwt_wave_all <= tmp_dwt_all;
end architecture;