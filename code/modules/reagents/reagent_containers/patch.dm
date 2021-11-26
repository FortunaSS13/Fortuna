/obj/item/reagent_containers/pill/patch
	name = "chemical patch"
	desc = "A chemical patch for touch based applications."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bandaid"
	item_state = "bandaid"
	possible_transfer_amounts = list()
	volume = 40
	apply_type = PATCH
	apply_method = "apply"
	self_delay = 30		// three seconds
	dissolvable = FALSE

/obj/item/reagent_containers/pill/patch/attack(mob/living/L, mob/user)
	if(ishuman(L))
		var/obj/item/bodypart/affecting = L.get_bodypart(check_zone(user.zone_selected))
		if(!affecting)
			to_chat(user, "<span class='warning'>The limb is missing!</span>")
			return
		if(!L.can_inject(user, TRUE, user.zone_selected, FALSE, TRUE)) //stopped by clothing, not by species immunity.
			return
		if(affecting.status != BODYPART_ORGANIC)
			to_chat(user, "<span class='notice'>Medicine won't work on a robotic limb!</span>")
			return
	..()

/obj/item/reagent_containers/pill/patch/canconsume(mob/eater, mob/user)
	if(!iscarbon(eater))
		return 0
	return 1 // Masks were stopping people from "eating" patches. Thanks, inheritance.

/obj/item/reagent_containers/pill/patch/styptic
	name = "brute patch"
	desc = "Helps with brute injuries."
	list_reagents = list(/datum/reagent/medicine/styptic_powder = 20)
	icon_state = "bandaid_brute"

/obj/item/reagent_containers/pill/patch/silver_sulf
	name = "burn patch"
	desc = "Helps with burn injuries."
	list_reagents = list(/datum/reagent/medicine/silver_sulfadiazine = 20)
	icon_state = "bandaid_burn"

/obj/item/reagent_containers/pill/patch/get_belt_overlay()
	return mutable_appearance('icons/obj/clothing/belt_overlays.dmi', "pouch")

/obj/item/reagent_containers/pill/patch/jet
	name = "Jet"
	desc = "A highly addictive meta-amphetamine that produces a fast-acting, intense euphoric high on the user."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	list_reagents = list(/datum/reagent/drug/jet = 10)
	icon_state = "bandaid_jet"

/obj/item/reagent_containers/pill/patch/turbo
	name = "Turbo"
	desc = "A chem that vastly increases the user's reflexes and slows their perception of time."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "bandaid_turbo"
	list_reagents = list(/datum/reagent/drug/turbo = 5)

/obj/item/reagent_containers/pill/patch/healingpowder
	name = "Healing Powder"
	desc = "A powder used to heal wounds and slow poisons, derived from ground cave fungus and broc flowers, commonly used by tribals."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "bandaid_healingpowder"
	list_reagents = list(/datum/reagent/medicine/healing_powder = 10, /datum/reagent/medicine/stimulants = 5, /datum/reagent/medicine/antitoxin = 5)
	self_delay = 0
 
/obj/item/reagent_containers/pill/patch/bitterdrink
	name = "Bitter drink"
	desc = "A strong herbal healing concoction which enables wounded soldiers and travelers to tend to their wounds without stopping during journeys."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "bitterdrink"
	list_reagents = list(/datum/reagent/medicine/bitter_drink = 15) 
	self_delay = 0

// Legion stimulants for field testing
/obj/item/reagent_containers/pill/patch/healingpowder/red
	name = "Red Powder"
	desc = "Cazardor venom mixed with healing powder combine to make the users adrenaline production skyrocket for a short time, striking harder and moving faster, while still providing some minor healing."
	list_reagents = list(/datum/reagent/medicine/healing_powder = 5, /datum/reagent/medicine/stimulants/redpowder = 15)
	icon_state = "bandaid_redpowder"

/obj/item/reagent_containers/pill/patch/healingpowder/white
	name = "White Powder"
	desc = "Ground gecko scales mixed with datura and healing powder combine to make the user feel numb for a time, able to ignore serious wounds."
	list_reagents = list(/datum/reagent/medicine/healing_powder = 5, /datum/reagent/medicine/naturalpainkiller = 10)
	icon_state = "bandaid_whitepowder"
