/obj/machinery/light/proc/start_flickering()
	return

/obj/machinery/light/Initialize(mapload = TRUE)
	constant_flickering = FALSE
	. = ..()
