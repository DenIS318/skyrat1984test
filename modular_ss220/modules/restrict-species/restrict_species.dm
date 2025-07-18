/datum/dynamic_ruleset
	var/list/restricted_species = list()

/datum/dynamic_ruleset/trim_candidates()
	..()
	if (!candidates || candidates.len < 1 || !restricted_species || restricted_species.len < 1)
		return

	for(var/mob/dead/new_player/candidate_player in candidates)
		var/client/candidate_client = GET_CLIENT(candidate_player)
		if (!candidate_client || !candidate_player.mind) // Are they connected?
			continue // is handled by parent proc, this check here only for safety, not removal
		if (!candidate_client.mob || !iscarbon(candidate_client.mob)) // TODO: here not correctly getting stuff
			continue

		var/mob/living/carbon/player_mob_to_create = candidate_client.mob
		if (!player_mob_to_create)
			continue

		var/datum/species/species_to_create = player_mob_to_create.dna?.species
		if (!species_to_create)
			continue
		var/species_text_path = "[species_to_create]"
		if (species_text_path in restricted_species)
			candidates -= candidate_player
