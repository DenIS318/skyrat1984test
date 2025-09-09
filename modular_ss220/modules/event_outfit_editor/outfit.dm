/datum/outfit
	var/list/extra_data_1984 = null

/datum/outfit/get_json_data()
	. = ..()
	if (!isnull(extra_data_1984))
		.["extra_data_1984"] = extra_data_1984
	return .
