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
