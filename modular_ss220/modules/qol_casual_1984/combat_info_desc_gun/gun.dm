/obj/item/gun/proc/set_chambered(obj/item/ammo_casing/new_chambered)
	chambered = new_chambered
	if (isnull(chambered))
		return
	chambered.was_chambered_at = create_weakref()
