library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity top_level is
port (clk, btnc : in std_logic;
      sw : in std_logic_vector (7 downto 0);
      jtag_rx : out std_logic;
      seg_out : out std_logic_vector (7 downto 0);
	  anode_out : out std_logic_vector (3 downto 0));
end top_level;

architecture Structural of top_level is

component multiplexer_seven_segment_display is
port ( clk : in std_logic;
	   input_1, input_2, input_3, input_4 : in std_logic_vector (7 downto 0);
       seg_out : out std_logic_vector (7 downto 0);
	   anode_out : out std_logic_vector (3 downto 0));
end component;

component bcd_seven_segment_decoder is
port (input : in std_logic_vector (3 downto 0);
	  enable : in std_logic;
      seg_out : out std_logic_vector (7 downto 0));
end component;

component buffer_8_bit is
port (clk, reset, enable : in std_logic;
	  input : in std_logic_vector (7 downto 0);
	  output : out std_logic_vector (7 downto 0));
end component;

component release_debouncer is
port (clk : in std_logic;
      button_press : in std_logic;
      output : out std_logic);
end component;

component serial_transmit is
port (clk : in std_logic;
      transmit_oneshot : in std_logic;
      switches : in std_logic_vector(7 downto 0);
      jtag_rx : out std_logic);
end component;

signal buffer_output : std_logic_vector (7 downto 0);
signal seg_c, seg_d : std_logic_vector (7 downto 0);
signal transmit_deb_signal : std_logic;

begin

transmit_deb: release_debouncer port map (clk => clk,
                                          button_press => btnc,
                                          output => transmit_deb_signal);

B1: buffer_8_bit port map (clk => clk,
                           reset => '0',
                           enable => transmit_deb_signal,
                           input => sw,
                           output => buffer_output);
                           
S1: serial_transmit port map (clk => clk,
                              transmit_oneshot => transmit_deb_signal,
                              switches => sw,
                              jtag_rx => jtag_rx);
                       
SEG_D_DEC: bcd_seven_segment_decoder port map (input => buffer_output(3 downto 0),
                                               enable => '1',
                                               seg_out => seg_d);
SEG_C_DEC: bcd_seven_segment_decoder port map (input => buffer_output(7 downto 4),
                                               enable => '1',
                                               seg_out => seg_c);
                                                                                      
M1: multiplexer_seven_segment_display port map (clk => clk,
                                                input_1 => seg_d,
                                                input_2 => seg_c,
                                                input_3 => "11111111",
                                                input_4 => "11111111",
                                                seg_out => seg_out,
                                                anode_out => anode_out);

end Structural;
