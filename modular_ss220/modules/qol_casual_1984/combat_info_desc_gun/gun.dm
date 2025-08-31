/obj/item/gun/proc/set_chambered(obj/item/ammo_casing/new_chambered)
	var/obj/item/ammo_casing/old_chambered = new_chambered
	chambered = new_chambered
	if (isnull(chambered))
		if (!isnull(old_chambered) && !isnull(old_chambered.was_chambered_at))
			old_chambered.was_chambered_at.Destroy()
		return
	if (!isnull(chambered.was_chambered_at))
		if (chambered.was_chambered_at.resolve() == src)
			return
		chambered.was_chambered_at.Destroy()

	chambered.was_chambered_at = create_weakref()
