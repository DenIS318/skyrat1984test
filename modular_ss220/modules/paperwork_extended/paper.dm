/obj/item/paper
	var/static/regex/blacklist = new("(<iframe|<embed|<script|<canvas|<video|<audio|onload)", "g")

/obj/item/paper/vv_edit_var(var_name, var_value)
	if(var_name == "blacklist")
		return FALSE
	return ..()

/obj/item/paper/ui_act(action, params, datum/tgui/ui)
	. = ..()
	if(.)
		return

	var/mob/user = ui.user

	switch(action)
		if("write") // our-own action
			var/input_element = input("Enter what you want to write:", "Write") as message
			var/obj/item/item_write = user.get_active_held_item()
			add_hiddenprint(user)
			if(!is_pen(item_write) && !istype(item_write, /obj/item/toy/crayon))
				return
			if(loc != user && !Adjacent(user) && !((istype(loc, /obj/item/clipboard) || istype(loc, /obj/item/folder)) && ((user in get_turf(user)) || loc.Adjacent(user))))
				return // If paper is not in usr, then it must be near them, or in a clipboard or folder, which must be in or near usr
			if(blacklist.Find(input_element))
				message_admins("<span class='danger'>EXPLOIT WARNING: </span> [user.ckey] attempted to write paper containing JS abusable tags!")
				log_admin("EXPLOIT WARNING: [user.ckey] attempted to write paper containing JS abusable tags")
				return FALSE
			// TODO:
			// input_element = parsepencode(input_element, item_write, user) // Encode everything from pencode to html
			// // if(id != "end")
			// // 	addtofield(text2num(id), input_element)
			// // else
			// info += input_element
			// populatefields()
			// updateinfolinks()
			// item_write.on_write(src, usr)
			// show_content(usr, forceshow = TRUE, infolinks = TRUE)
			// update_icon()
			return TRUE
