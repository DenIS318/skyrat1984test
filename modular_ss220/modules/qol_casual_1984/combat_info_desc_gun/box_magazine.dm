/obj/item/ammo_box
	var/datum/weakref/was_chambered_at

/obj/item/ammo_box/proc/set_chambered(obj/item/gun/new_gun)
	if (!isnull(was_chambered_at))
		if (was_chambered_at.resolve() == new_gun)
			return
		was_chambered_at.Destroy()
	if (isnull(new_gun))
		return
	was_chambered_at = new_gun.create_weakref()
