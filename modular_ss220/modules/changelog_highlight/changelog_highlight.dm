#define CHANGELOG_HIGHLIGHT_GENERATED_FILE_PATH "tools/ss1984_changelog_highlight_generated.json" // don't forget to update in in .py script

// The reason why this is subsystem, because we don't want for clients to execute it
// Instead, we do it one time at server-side and send data to clients, also in non-blocking way becaues of I/O

SUBSYSTEM_DEF(changelog_highlight)
	name = "Changelog Highlight SS1984"
	flags = SS_NO_FIRE
	runlevels = (RUNLEVEL_LOBBY | RUNLEVEL_SETUP | RUNLEVEL_GAME | RUNLEVEL_POSTGAME)
	init_stage = INITSTAGE_FIRST
	var/static/list/changelog_items_ss1984 = list()

/datum/controller/subsystem/changelog_highlight/Initialize()
	if (!fexists(CHANGELOG_HIGHLIGHT_GENERATED_FILE_PATH))
		return SS_INIT_NO_NEED
	var/list/json_data = json_load(CHANGELOG_HIGHLIGHT_GENERATED_FILE_PATH)
	if (!json_data || (length(json_data) < 1))
		return SS_INIT_FAILURE
	for(var/json_entry in json_data)
		changelog_items_ss1984 += json_entry

	return SS_INIT_SUCCESS
