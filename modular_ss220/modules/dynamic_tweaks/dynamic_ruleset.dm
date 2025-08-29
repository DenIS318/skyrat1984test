/datum/dynamic_ruleset
	/**
	 * The required amount of enemies for ruleset to be considered valid to pick.
	 *
	 * This can either be
	 * - A list of min_enemies corresponding to dynamic tiers.
	 * If a tier is not specified, it will use the next highest tier.
	 * Or
	 * - A single min_enemies for all tiers.
	 */
	VAR_PROTECTED/list/min_enemies = 0 // you should access it from get_minimal_num_of_enemies()
	var/list/enemy_roles = list(
		JOB_CAPTAIN,
		JOB_DETECTIVE,
		JOB_HEAD_OF_SECURITY,
		JOB_SECURITY_OFFICER,
		JOB_WARDEN,
		JOB_CORRECTIONS_OFFICER,
		JOB_BLUESHIELD,
		JOB_NT_REP,
	)

/datum/dynamic_ruleset/proc/get_minimal_num_of_enemies(tier = DYNAMIC_TIER_LOW)
	if (islist(min_enemies))
		var/len = length(min_enemies)
		if (len < 1)
			return 0
		if (tier < len)
			return min_enemies[tier]
		return min_enemies[len - 1] // last defined tier num
	if (min_enemies > 0)
		return min_enemies
	return 0

/datum/dynamic_ruleset/can_be_selected()
	. = ..()
	if (!.)
		return .
	var/list/valid_enemy = get_all_valid_enemies()
	var/current_tier = DYNAMIC_TIER_LOW
	if (SSdynamic && SSdynamic.current_tier)
		current_tier = SSdynamic.current_tier.tier
	var/final_min_num = get_minimal_num_of_enemies(current_tier)
	if (final_min_num < 0) // in case someone didn't correctly overrided get_minimal_num_of_enemies()
		final_min_num = 0
	if (!valid_enemy && final_min_num == 0) // that's actually case when valid_enemy is null, for safety
		return TRUE
	if (!valid_enemy)
		log_runtime("get_all_valid_enemies() returned null valid_enemy list for ruleset [name]. It shouldn't be null here, but instead a empty list")
		return FALSE
	return length(valid_enemy) >= final_min_num

/datum/dynamic_ruleset/proc/get_all_valid_enemies()
	var/list/valid_enemy = list()
	for(var/mob/living/living_mob in GLOB.alive_player_list)
		if (!living_mob)
			continue
		if (SSdynamic && !SSdynamic.is_mob_considered_as_valid(living_mob, GET_CLIENT(living_mob), allow_ghost = FALSE))
			continue
		var/mob/living/carbon/human/human_mob = living_mob
		if (!human_mob)
			continue
		if (human_mob.is_antag())
			continue
		if (!human_mob.mind || !human_mob.mind.assigned_role)
			continue
		if (!("[human_mob.mind.assigned_role.type]" in enemy_roles))
			continue
		valid_enemy += human_mob
	return valid_enemy

