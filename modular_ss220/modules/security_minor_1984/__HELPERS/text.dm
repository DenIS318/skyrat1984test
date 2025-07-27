/// Take a value in seconds and makes it display like a clock. Hours are stripped. (mm:ss)
/proc/seconds_to_clock(seconds as num)
	return "[add_zero(num2text((seconds / 60) % 60), 2)]:[add_zero(num2text(seconds % 60), 2)]"

//Adds 'u' number of zeros ahead of the text 't'
/proc/add_zero(t, u)
	while(length(t) < u)
		t = "0[t]"
	return t
