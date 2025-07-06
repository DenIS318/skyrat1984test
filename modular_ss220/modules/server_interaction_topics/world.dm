/world/Topic(T, addr, master, key)
	// So it's basically to silent continue execution in ALL cases when our requirements are not satisfied
	if (!T || !addr || !master || !key)
		return ..(T, addr, master, key)

	if (!CONFIG_GET(flag/compatible_to_server_interaction))
		return ..(T, addr, master, key)

	var/required_ip = CONFIG_GET(string/accept_commands_from_server_ip)
	if (!required_ip || required_ip != addr)
		return ..(T, addr, master, key)

	var/required_key = CONFIG_GET(string/commanding_server_password)
	if (!required_key)
		return ..(T, addr, master, key)

	var/decoded_server_key = RUSTG_CALL(RUST_G, "decode_sha512")(required_key)
	if (!decoded_server_key)
		return ..(T, addr, master, key) // that's weird, but lets not spam logs

	var/decoded_client_key = RUSTG_CALL(RUST_G, "decode_sha512")(key)
	if (!decoded_client_key || decoded_client_key != decoded_server_key)
		return ..(T, addr, master, key)

	// if someone beaten this protection, congrats, would be good if you tell how
	// Ok it seems that its valid topic, or at least we assume it at that point
	handle_custom_server_to_server_topic(T, addr)

	// always return to allow further execution
	return ..(T, addr, master, key)

/world/proc/handle_custom_server_to_server_topic(T, addr) // to be overriden by other modules
	log_topic("Please override handle_custom_server_to_server_topic proc with your logic if you use that system. Don't call base method")
