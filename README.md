# serial-transmitter
VHDL model for implementation on a Digilent Basys 3 Artix-7 development board. The slide switches SW0 through SW7 will signify an 8-bit word. When BTNC is pressed and released, the 8-bit word will be sent serially to a PC using a 9600-8-N-1 serial format.
The browthom/vhdl-user-component-dir repository must be imported into the Vivado project as a directory. This is done so that the top_level.vhd file can properly instantiate all components listed in its vhdl model.
