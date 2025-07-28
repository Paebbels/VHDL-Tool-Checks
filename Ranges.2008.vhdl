entity Ranges is
	port (
		signal Clock : in  bit;
		signal LED   : out bit
	);
end entity;


architecture test of Ranges is
	type freq is range natural'low to natural'high units
		Hz;
		kHz = 1000 Hz;
		MHz = 1000 kHz;
		GHz = 1000 MHz;
		THz = 1000 GHz;
	end units;
	
	function contains(str : string; find : character) return boolean is
	begin
		for i in str'range loop
			if str(i) = find then
				return true;
			end if;
		end loop;
		return false;
	end function;
	
	constant freq_5Hz      : string := freq'image(5 Hz);
	constant freq_5Hz_unit : string := freq_5Hz(freq_5Hz'high - 1 to freq_5Hz'high);
begin
	-- IMPORTANT: activate assertions in synthesis settings
	
	assert integer'low   <= -2147483647    report "FAILED: integer'low   <= -2147483647   ; integer'low   = " & integer'image(integer'low)    ; -- & " / " & to_image(integer'low);
	assert integer'high  >=  2147483647    report "FAILED: integer'high  >=  2147483647   ; integer'high  = " & integer'image(integer'high)   ; -- & " / " & to_image(integer'low);
	assert natural'low    =           0    report "FAILED: natural'low    =           0   ; natural'low   = " & natural'image(natural'low)    ; -- & " / " & to_image(natural'low);
	assert natural'high  >=  2147483647    report "FAILED: natural'high  >=  2147483647   ; natural'high  = " & natural'image(natural'high)   ; -- & " / " & to_image(natural'high);
	assert positive'low   =           1    report "FAILED: positive'low   =           1   ; positive'low  = " & positive'image(positive'low)  ; -- & " / " & to_image(positive'low);
	assert positive'high >=  2147483647    report "FAILED: positive'high >=  2147483647   ; positive'high = " & positive'image(positive'high) ; -- & " / " & to_image(positive'high);
																																																 
	assert time'low      <= -2.56204778 hr report "FAILED: time'low      <= -2.56204778 hr; time'low      = " & time'image(time'low)  ; -- & " / " & to_image(time'low);
	assert time'high     >=  2.56204778 hr report "FAILED: time'high     >=  2.56204778 hr; time'high     = " & time'image(time'high) ; -- & " / " & to_

	assert freq'low       =           0 Hz report "FAILED: freq'low      <=           0 Hz; freq'low      = " & freq'image(freq'low)  ; -- & " / " & to_image(freq'low);
	assert freq'high      =  2147483647 Hz report "FAILED: freq'high     >=  2147483647 Hz; freq'high     = " & freq'image(freq'high) ; -- & " / " & to_image(freq'high);
	
	assert freq_5Hz_unit = "Hz"            report "FAILED: Unit of '5 Hz' is 'Hz'; Unit = " & freq_5Hz_unit;
	assert not contains(freq_5Hz, '.')     report "FAILED: Physical type is an integer number";

	LED <= not LED when rising_edge(Clock);
end architecture;
