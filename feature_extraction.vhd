library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dwt_pkg.all;

entity feature_extraction is

    generic (num_of_fpid_frames: positive := 4096);

    port (
        dwt_wave_all: in natural_array(0 to num_of_fpid_frames-1);
        fpid_all: out std_logic_vector(0 to num_of_fpid_frames-1)
    );

end entity;

architecture rtl of feature_extraction is

begin

    fpid_all(num_of_fpid_frames-1 to num_of_fpid_frames-1) <= "0";

    gen: for i in 0 to num_of_fpid_frames-2 generate
        -- process (dwt_all) is
        --     if (dwt_all(i) > dwt_all(i+1)) then
        --         fpid_all(i to i) <= "1";
        --     else
        --         fpid_all(i to i) <= "0";
        --     end if;
        -- end process;
        fpid_all(i to i) <= "1" when (dwt_wave_all(i) > dwt_wave_all(i+1)) else "0";
    end generate;

end architecture;