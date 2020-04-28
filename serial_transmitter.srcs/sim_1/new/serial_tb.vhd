library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity serial_tb is
end serial_tb;

architecture Behavioral of serial_tb is

component serial_transmit is
Port (clk : in STD_LOGIC;
      transmit_oneshot : in STD_LOGIC;
      switches : in STD_LOGIC_VECTOR(7 downto 0);
      jtag_rx : out STD_LOGIC);
end component;

signal clk, transmit_oneshot : STD_LOGIC := '0';
signal jtag_rx : STD_LOGIC;
signal switches : STD_LOGIC_VECTOR(7 downto 0) := x"08";

signal count_clk_div : std_logic_vector (15 downto 0) := b"0000_0000_0000_0000";
signal count_delay : natural := 0;

begin

U1: serial_transmit port map(clk => clk,
                             transmit_oneshot => transmit_oneshot,
                             switches => switches,
                             jtag_rx => jtag_rx);
                             
    clock: process
        begin
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
        end process;
        
    transmit: process
        begin
            wait for 1055 ns;
            transmit_oneshot <= '1';
            wait for 5 ns;
            transmit_oneshot <= '0';
            wait;
--            if rising_edge(clk) then
--                if count_delay < 1000000 then
--                    count_delay <= count_delay + 1;
--                end if;
                
--                if (count_delay = 105) then
--                    transmit_oneshot <= '1';
--                elsif (count_delay = 107) then
--                    transmit_oneshot <= '0';
--                end if;
--            end if;
        end process;
end Behavioral;
