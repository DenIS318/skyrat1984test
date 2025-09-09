#define EVENT_EDITOR_NAME_SS1984 "Custom Event Outfit"
#define WHITELIST_TYPE_MOB_COOLDOWN "/datum/action/cooldown/mob_cooldown"
#define WHITELIST_TYPE_SPELL "/datum/action/cooldown/spell"

#define TRAITS_DATA_KEY "traits"
#define ABILITIES_DATA_KEY "abilities"

/datum/event_outfit_editor_ss1984
	var/client/owner
	var/datum/outfit/outfit_instance

/datum/event_outfit_editor_ss1984/New(user, datum/outfit/target)
	owner = CLIENT_FROM_VAR(user)

	if(ispath(target))
		outfit_instance = new /datum/outfit
		outfit_instance.copy_from(new target)
	else if(istype(target))
		outfit_instance = target
	else
		outfit_instance = new /datum/outfit
		outfit_instance.name = "New Outfit"

/datum/event_outfit_editor_ss1984/ui_status(mob/user, datum/ui_state/state)
	if(QDELETED(outfit_instance))
		return UI_CLOSE
	return ..()

/datum/event_outfit_editor_ss1984/ui_state(mob/user)
	return ADMIN_STATE(R_VAREDIT)

/datum/event_outfit_editor_ss1984/ui_close(mob/user)
	qdel(src)

/datum/event_outfit_editor_ss1984/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "EventOutfitEditor1984", EVENT_EDITOR_NAME_SS1984)
		ui.open()

// EXAMPLE:
// return list(
// 	"traits" = list(TRAIT_UNKNOWN),
// 	"abilities" = list(
// 		"/datum/action/cooldown/mob_cooldown/dash" = list(
// 			"cooldown_time" = "100"
// 		)
// 	),
// )
/datum/event_outfit_editor_ss1984/proc/init_extra_data()
	return list(
		TRAITS_DATA_KEY = list(),
		ABILITIES_DATA_KEY = list(),
	)

/datum/event_outfit_editor_ss1984/ui_data(mob/user)
	var/list/data = list()

	if (outfit_instance)
		if (isnull(outfit_instance.extra_data_1984))
			outfit_instance.extra_data_1984 = init_extra_data()
		data["extra_data_1984"] = outfit_instance.extra_data_1984

	return data

/datum/event_outfit_editor_ss1984/proc/do_update(list/traits_list, list/abilities_list_with_vv)
	if (outfit_instance.extra_data_1984 && length(outfit_instance.extra_data_1984) > 0)
		QDEL_LIST_ASSOC_VAL(outfit_instance.extra_data_1984) // wipe old, only values could be non-strings
	if (isnull(outfit_instance.extra_data_1984))
		outfit_instance.extra_data_1984 = init_extra_data()
	if (islist(traits_list))
		outfit_instance.extra_data_1984[TRAITS_DATA_KEY] = traits_list
	if (islist(abilities_list_with_vv))
		// validation stuff
		var/list/checked_list = list()
		for (var/str_typepath in abilities_list_with_vv)
			if (!str_typepath || length(str_typepath) < 1)
				continue
			if (findtext(str_typepath, WHITELIST_TYPE_SPELL) != 1 && findtext(str_typepath, WHITELIST_TYPE_MOB_COOLDOWN) != 1)
				log_admin("[key_name(usr)] tried to use outfit [str_typepath], which is not in whitelist. Skipping this one")
				continue
			// another validation
			var/typepath = text2path(str_typepath)
			if (!typepath)
				log_runtime("Failed to cast [str_typepath] as type for outfit [outfit_instance.name]. Skipping")
				continue
			var/datum/initial_val = initial(typepath)
			if (!initial_val)
				log_runtime("Failed to find initial val of typepath [str_typepath] for outfit [outfit_instance.name]. Skipping")
				continue
			var/list/vv_list = abilities_list_with_vv[str_typepath]
			var/list/vv_list_checked
			if (!vv_list || !islist(vv_list))
				vv_list = list()
				vv_list_checked = list()
			else
				for (var/vv_val in vv_list)
					if (!initial_val.vars.Find(vv_val)) // 0 means not found
						continue
					vv_list_checked += vv_val

			checked_list += list(str_typepath = vv_list_checked)
		outfit_instance.extra_data_1984[ABILITIES_DATA_KEY] = checked_list

/datum/event_outfit_editor_ss1984/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	if(..())
		return
	. = TRUE

	switch(action)
		if("update")
			do_update(params["traits_list"], params["abilities_list_with_vv"])

#undef TRAITS_DATA_KEY
#undef ABILITIES_DATA_KEY

#undef EVENT_EDITOR_NAME_SS1984
#undef WHITELIST_TYPE_MOB_COOLDOWN
#undef WHITELIST_TYPE_SPELL
