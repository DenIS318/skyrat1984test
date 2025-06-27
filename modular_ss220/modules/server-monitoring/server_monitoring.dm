SUBSYSTEM_DEF(server_monitoring)
	name = "Server Monitoring"
	flags = SS_BACKGROUND
	wait = 30 SECONDS // Default wait time before fire() invoked, should be set to increase_interval during setup

/datum/controller/subsystem/server_monitoring/Initialize()
	if (!CONFIG_GET(flag/compatible_to_server_monitoring) || !CONFIG_GET(flag/server_monitoring_filesave_path))
		return SS_INIT_FAILURE // it's ok, server just not configured to use it

	return SS_INIT_SUCCESS

/datum/controller/subsystem/server_monitoring/fire()
	var/datum/json_savefile/savefile
	savefile.path = CONFIG_GET(flag/server_monitoring_filesave_path)
	var/map_name = SSmapping.current_map?.map_name // don't even try to exploit it with VV, it's validated on monitoring server anyway
	if (!map_name)
		map_name = "?"

	var/list/adminstuff_list = get_list_of_admins()
	var/adminstuff_count = 0
	if (adminstuff_list)
		adminstuff_count = adminstuff_list.len

	var/round_time = ROUND_TIME()
	if (!round_time)
		round_time = "?"

	savefile.set_entry("OnlineTotal", GLOB.clients.len)
	savefile.set_entry("OnlineAdminStuff", adminstuff_count)
	savefile.set_entry("RoundTime", round_time)
	savefile.set_entry("UpdatedAt", time2text(world.timeofday, "YYYY-MM-DD hh:mm:ss"))
	savefile.set_entry("Map", map_name)

	savefile.save()
