/datum/outfit
	var/role_job = /datum/job/ghost_role

/datum/outfit/proc/handlebank(mob/living/carbon/human/owner)
	var/datum/bank_account/offstation_bank_account = new(owner.real_name)
	owner.account_id = offstation_bank_account.account_id
	offstation_bank_account.replaceable = FALSE
	offstation_bank_account.account_job = new role_job
	owner.add_mob_memory(/datum/memory/key/account, remembered_id = owner.account_id)
	if(owner.wear_id)
		var/obj/item/card/id/id_card = owner.wear_id
		id_card.registered_account = offstation_bank_account
	return
