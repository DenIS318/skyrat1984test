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
		if (!server)
			continue
		C.reconnect_link_serv = "byond://[server]"
		C << link("?client_start_reconnect_loop")

/client
	var/reconnect_link_serv // even if someone VV it, considering how code is written, that doesn't matter (assuming it's all done on shutdown)

/client/proc/is_reconnect_href(href_list)
	if(IsAdminAdvancedProcCall())
		return
	if (href_list["client_start_reconnect_loop"])
		if (reconnect_link_serv)
			client_start_reconnect_loop(reconnect_link_serv)
		return TRUE

/client/proc/client_try_reconnect(reconnect_link_text) //client-side
	if(IsAdminAdvancedProcCall())
		return
	var/client/C = usr
	if (!C)
		return
	C << link(reconnect_link_text)

/client/proc/client_start_reconnect_loop(reconnect_link_text) //client-side
	if(IsAdminAdvancedProcCall())
		return
	// Hacky timer loop calling reconnect after delay
	spawn (5 SECONDS) {
		client_try_reconnect(reconnect_link_text)
	}
	spawn (10 SECONDS) {
		client_try_reconnect(reconnect_link_text)
	}
	spawn (20 SECONDS) {
		client_try_reconnect(reconnect_link_text)
	}
	spawn (60 SECONDS) {
		client_try_reconnect(reconnect_link_text)
	}
	// is server deploying something?
	spawn (90 SECONDS) {
		client_try_reconnect(reconnect_link_text)
	}
	// ok looks like no server
