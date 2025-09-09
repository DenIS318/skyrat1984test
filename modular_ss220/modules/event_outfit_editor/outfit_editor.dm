/datum/outfit_editor/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if (!.) // assuming it returns TRUE even if nothing valid was clicked, and false only on before actually clicking
		return .
	if (!drip)
		return .
	switch(action)
		if("extra_outfit_ss1984")
			var/datum/event_outfit_editor_ss1984/new_ui = new(usr, drip)
			new_ui.ui_interact(usr)
