/datum/export/material/plasma/get_cost(obj/exported_item, apply_elastic = TRUE)
	if (!CONFIG_GET(flag/plasma_inflation) || !SSplasma_inflation)
		return ..()
	if (sales_market != EXPORT_MARKET_STATION)
		return ..()

	var/exported_area = get_area(exported_item)
	if (SSplasma_inflation.whitelist_shuttle_area && !istype(exported_area, SSplasma_inflation.whitelist_shuttle_area))
		return ..() // some away level shuttle most likely

	var/amount = get_amount(exported_item)
	return SSplasma_inflation.sell_plasma(amount)
