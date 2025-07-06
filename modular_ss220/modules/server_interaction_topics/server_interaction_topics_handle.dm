#define CODE_INVALID 0
#define CODE_TEST 1
#define CODE_INVOKE 2

/world/handle_custom_server_to_server_topic(code_received, list/args_received)
	var/result_msg = handle_custom_command(code_received, args_received)
	if (!result_msg)
		return "Ok"
	return result_msg

/world/proc/handle_custom_command(cmd, list/arguments)
	switch (cmd)
		if (CODE_INVALID) // aka invalid
			return "Invalid, yet received"
		if (CODE_TEST) // aka test
			log_topic("test")
			return
		if (CODE_INVOKE) // aka invoke
			return
		else
			return "Invalid code"
