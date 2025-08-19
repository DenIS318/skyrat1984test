/proc/try_reconnect_all_players()
	if(IsAdminAdvancedProcCall())
		return
	var/server = CONFIG_GET(string/server)
	for(var/thing in GLOB.clients)
		if(!thing)
			continue
		var/client/C = thing
		if (!C)
			continue
		C.tgui_panel?.send_roundrestart()
