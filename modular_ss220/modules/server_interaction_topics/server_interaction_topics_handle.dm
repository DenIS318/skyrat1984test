#define server_to_server_topic_data_separator ";"

/world/handle_custom_server_to_server_topic(T, addr)
	var/list/arguments = splittext(T, server_to_server_topic_data_separator)
	if (arguments.len < 1)
		return
	var/cmd = arguments[0]
	if (!cmd)
		return

	log_topic("addr is [addr]");
	var/to_respond = handle_custom_command(cmd, arguments)
	if (!to_respond)
		world.Export("http://[addr]/?command=ack")
		return

	world.Export("http://127.0.0.1:5001/?command=round_start&testkey=testvalue")

/world/proc/handle_custom_command(cmd, list/arguments)
	switch (cmd)
		if ("test")
			log_topic("test")
			return
		if ("notest")
			return
		else
			return
