/datum/dynamic_ruleset/proc/get_required_threat(population, threat_level)
	pop_per_requirement = pop_per_requirement > 0 ? pop_per_requirement : SSdynamic.pop_per_requirement
	indice_pop = min(requirements.len,round(population/pop_per_requirement)+1)
	return requirements[indice_pop]
	THIS GONNA NEVER COMPILE LETS CHECK IT AGAIN 6
