/datum/changelog/ui_static_data()
	. = ..()
	if (!.)
		return .
	var/list/data = .
	if (!data)
		return .
	if (!SSchangelog_highlight || !SSchangelog_highlight.changelog_items_ss1984)
		return .
	var/list/our_changelogs = list()
	for(var/json_entry in SSchangelog_highlight.changelog_items_ss1984)
		our_changelogs += list(json_entry) // no validation required, it's already done
	data["our_changelogs"] = our_changelogs
	data["our_icon_html"] = icon2html('modular_nova/master_files/icons/donator/donator_chat_icon.dmi', world, "ratge")

	return data
