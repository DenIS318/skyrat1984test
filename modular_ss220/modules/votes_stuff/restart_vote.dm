/datum/vote/restart_vote/is_config_enabled()
	return ..() && !admins_present()
