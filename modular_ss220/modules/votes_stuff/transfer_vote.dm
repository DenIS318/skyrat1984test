#ifndef CHOICE_CONTINUE
	#define CHOICE_CONTINUE "Continue Playing"
#endif

/datum/vote/transfer_vote/is_config_enabled()
	. = ..()
	if (!.)
		return .
	var/ticks_passed = STATION_TIME_PASSED()
	if (ticks_passed < 15 MINUTES)
		return FALSE // someone didn't rolled antag or something like nuke ops mode?
	// so in case station is ruined because of SM and someone really want to transfer early
	// or it's already past 1:30 and don't really want to wait for autotransfer for that round
	return ticks_passed < 40 MINUTES || ticks_passed > 90 MINUTES

/datum/vote/transfer_vote/get_vote_result(list/non_voters)
	. = ..()

	if (!choices || choices.len < 1)
		return CHOICE_CONTINUE

	var/total_votes = 0
	for(var/option in choices)
		total_votes += choices[option]
	if (total_votes < 1)
		return CHOICE_CONTINUE

	return .
