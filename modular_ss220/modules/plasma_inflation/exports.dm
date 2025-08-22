/datum/export/proc/get_cost_ready_to_sell(obj/exported_item, apply_elastic = TRUE, dry_run = FALSE)
	return -1 // not compatible by default, uses get_cost instead

/datum/export/material/plasma/get_cost_ready_to_sell(obj/exported_item, apply_elastic = TRUE, dry_run = FALSE)
	if (!CONFIG_GET(flag/plasma_inflation) || !SSplasma_inflation)
		return get_cost(exported_item, apply_elastic)

	var/exported_area = get_area(exported_item)
	if (SSplasma_inflation.whitelist_shuttle_area && !istype(exported_area, SSplasma_inflation.whitelist_shuttle_area))
		if (sales_market == EXPORT_MARKET_STATION)
			return get_cost(exported_item, apply_elastic) // how it even possible? Well in such weird case, don't modify cost of plasma

	var/amount = get_amount(exported_item)
	return SSplasma_inflation.sell_plasma(amount, sales_market, dry_run)
