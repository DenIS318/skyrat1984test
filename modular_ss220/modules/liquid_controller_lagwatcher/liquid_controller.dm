/datum/controller/subsystem/liquids
	// default values
	var/evaporation_chance_default = EVAPORATION_CHANCE
	var/evaporation_process_required_default = REQUIRED_EVAPORATION_PROCESSES
	var/required_fire_process_default = REQUIRED_FIRE_PROCESSES
	var/group_decay_time_default = LIQUID_GROUP_DECAY_TIME
	// The panic values
	var/liquid_panic_cost_threshold = 100 // running above 100 ms and we go panic to avoid freezing by that subsystem liquids abuses
	var/evaporation_chance_panic = 100
	var/evaporation_process_required_panic = 10
	var/required_fire_process_panic = 1
	var/group_decay_time_panic = 1
	// The actual values
	var/evaporation_chance_current
	var/evaporation_process_required_current
	var/required_fire_process_actual
	var/group_decay_time_actual
	// notifications about panic stuff
	var/fires_without_panic_threshold_for_message = 100
	var/fires_without_panic = 100
	var/fires_without_panic_counter = 0

/datum/controller/subsystem/liquids/fire(resumed = FALSE)
	if (cost < liquid_panic_cost_threshold)
		evaporation_chance_current = evaporation_chance_default
		evaporation_process_required_current = evaporation_process_required_default
		required_fire_process_actual = required_fire_process_default
		group_decay_time_actual = group_decay_time_default

		fires_without_panic_counter++
	else
		evaporation_chance_current = evaporation_chance_panic
		evaporation_process_required_current = evaporation_process_required_panic
		required_fire_process_actual = required_fire_process_panic
		group_decay_time_actual = group_decay_time_panic

		if (fires_without_panic_counter > fires_without_panic_threshold_for_message)
			var/msg_constructed = "Subsystem [name] gone to panic at, trying to minimize lags"
			message_admins(msg_constructed)
			log_runtime(msg_constructed)

		fires_without_panic_counter = 0
	..()
