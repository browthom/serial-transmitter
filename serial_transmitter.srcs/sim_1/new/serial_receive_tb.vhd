library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity serial_receive_tb is
end serial_receive_tb;

architecture Behavioral of serial_receive_tb is

component serial_receive is
port (clk : in std_logic;
      jtag_tx : in std_logic;
      output : out std_logic_vector(7 downto 0));
end component;

signal clk : std_logic := '0';
signal jtag_tx : std_logic := '1';
signal baud_clk : std_logic := '0';
signal baud_reset : std_logic := '0';
signal output : std_logic_vector(7 downto 0) := (others => '0');

signal clk_div_signal : std_logic_vector (15 downto 0) := (others => '0');

signal test_serial_stream : std_logic_vector (15 downto 0) := b"1111_0010_0010_0111";
signal index : natural range 0 to 15 := 0;

begin

U1: serial_receive port map (clk => clk,
                             jtag_tx => jtag_tx,
                             output => output);

process
    begin
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
        clk <= '0';
    end process;

baud_clock: process(clk, baud_reset)
    begin
        if baud_reset = '1' then
            clk_div_signal <= (others => '0');
        elsif rising_edge(clk) then
            -- 100 MHz / 9600 Hz = 10,416.6 => Period
            -- 10,416.6 / 2 = 5,208.3 => Half Period
            -- 0b0010_1000_1011_0001 = 10,417(_10)
            if (clk_div_signal < 5208) then
                clk_div_signal <= clk_div_signal + 1;
            else
                clk_div_signal <= (others => '0');
    
                baud_clk <= not baud_clk;
            end if;
        end if;
    end process;
    
process(baud_clk)
    begin
        if rising_edge(baud_clk) then
            if index < 15 then
                index <= index + 1;
            end if;
            jtag_tx <= test_serial_stream(index);
        end if;
    end process;
    
end Behavioral;
