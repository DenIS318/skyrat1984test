/obj/item/gun/proc/set_chambered(obj/item/ammo_casing/new_chambered)
	var/obj/item/ammo_casing/old_chambered = new_chambered
	chambered = new_chambered
	if (isnull(chambered))
		return
	chambered.set_chamber_source(src)
