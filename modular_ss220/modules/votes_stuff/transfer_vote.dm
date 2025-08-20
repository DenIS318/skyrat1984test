#ifndef CHOICE_CONTINUE
	#define CHOICE_CONTINUE "Continue Playing"
#endif

#define EARLY_VOTE_FORBID_BEFORE_THRESHOLD 15 MINUTES
#define EARLY_VOTE_FORBID_AFTER_THRESHOLD 40 MINUTES
#define LATE_VOTE_ALLOW_THRESHOLD 90 MINUTES

/datum/vote/transfer_vote
	var/any_admin_changed_toggle = FALSE

/datum/vote/transfer_vote/toggle_votable()
	. = ..()
	any_admin_changed_toggle = TRUE

/datum/vote/transfer_vote/can_be_initiated(forced)
	if (!any_admin_changed_toggle)
		CONFIG_SET(flag/allow_vote_map, get_available_at_time())
	return ..()

/datum/vote/transfer_vote/proc/get_available_at_time()
	var/ticks_passed = STATION_TIME_PASSED()
	if (ticks_passed < EARLY_VOTE_FORBID_BEFORE_THRESHOLD)
		return FALSE // someone didn't rolled antag or something like nuke ops mode?
	// so in case station is ruined because of SM and someone really want to transfer early
	// or it's already past 1:30 and don't really want to wait for autotransfer for that round
	return ticks_passed < EARLY_VOTE_FORBID_AFTER_THRESHOLD || ticks_passed > LATE_VOTE_ALLOW_THRESHOLD

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
