//smelling salts
/obj/item/smelling_salts
	name = "large phial of smelling salts"
	desc = "A large glass phial of pungent smelling salts, used to revive those who have fainted."
	w_class = WEIGHT_CLASS_NORMAL
	icon = 'icons/obj/fallout/smelling_salts.dmi'
	icon_state = "smelling_salts_legion"
	var/time_limit = DEFIB_TIME_LIMIT * 5 // half compared to an actual defib
	var/charges = 8 // a bit lower than a normal defib's 10
	var/in_use = FALSE
	var/time_to_use = 10 SECONDS // a defib is 5 seconds

/obj/item/smelling_salts/wayfarer
	icon_state = "smelling_salts_wayfarer"

/obj/item/smelling_salts/crafted
	name = "small phial of smelling salts"
	w_class = WEIGHT_CLASS_SMALL // unsure about this balance-wise, given that defibs are bulky
	desc = "A stoppered glass phial of pungent smelling salts, used to revive those who have fainted."
	icon_state = "smelling_salts_crafted"
	charges = 4 // half of the premade smelling salts

/obj/item/smelling_salts/attack(mob/target, mob/user)
	if(in_use)
		return
	if(!user.IsAdvancedToolUser())
		to_chat(user, SPAN_WARNING("You don't know how to use [src]!"))
		return
	if(!iscarbon(target))
		to_chat(user, SPAN_WARNING("Do smelling salts even work on that?"))
		return
	var/mob/living/carbon/target_carbon = target

	if(user.zone_selected != BODY_ZONE_PRECISE_MOUTH && user.zone_selected != BODY_ZONE_HEAD)
		to_chat(user, SPAN_WARNING("[target_carbon] has to smell [src] to be revived, hold it up to their face!"))

	if((target_carbon.head?.flags_cover & HEADCOVERSMOUTH) || (target_carbon.wear_mask?.flags_cover & MASKCOVERSMOUTH))
		to_chat(user, SPAN_NOTICE("You're going to need to remove that [(target_carbon.head?.flags_cover & HEADCOVERSMOUTH) ? "helmet" : "mask"] first."))
		return

	else if(can_revive(target_carbon))
		target_carbon.notify_ghost_cloning("You're being revived with smelling salts. Re-enter your corpse if you want to be revived!", source = src)

	do_revive(target_carbon, user)
	charges--
	if(charges <= 0)
		to_chat(user, SPAN_NOTICE("[src] is now empty and useless; you throw it away."))
		qdel(src)

/obj/item/smelling_salts/proc/can_revive(mob/living/carbon/target)
	var/obj/item/organ/brain/BR = target.getorgan(/obj/item/organ/brain)
	return (!target.suiciding && !(target.has_trait(TRAIT_NOCLONE)) && !target.hellbound && ((world.time - target.timeofdeath) < time_limit) && (target.getBruteLoss() < 160) && (target.getFireLoss() < 160) && target.getorgan(/obj/item/organ/heart) && BR && !BR.damaged_brain)

/obj/item/smelling_salts/proc/do_revive(mob/living/carbon/revived_mob, mob/living/user)
	in_use = TRUE
	if(!do_after(user, time_to_use, target = revived_mob))
		return
	user.visible_message(SPAN_NOTICE("[user] starts waving [src] under [revived_mob]'s nose."), SPAN_WARNING("You wave [src] under [revived_mob]'s nose."))
	var/time_since_death = world.time - revived_mob.timeofdeath
	// past this much time the patient is unrecoverable
	// (in deciseconds)
	// brain damage starts setting in on the patient after
	// some time left rotting
	var/total_burn	= 0
	var/total_brute	= 0
	if(!do_after(user, 20, target = revived_mob)) //placed on chest and short delay to shock for dramatic effect, revive time is 5sec total
		in_use = FALSE
		return
	if((revived_mob.head?.flags_cover & HEADCOVERSMOUTH) || (revived_mob.wear_mask?.flags_cover & MASKCOVERSMOUTH)) // should've been checked prior, so it must've been put on during the pause
		to_chat(user, SPAN_NOTICE("You're going to need to remove that [(revived_mob.head?.flags_cover & HEADCOVERSMOUTH) ? "helmet" : "mask"] again."))
		in_use = FALSE
		return
	if(revived_mob.stat != DEAD)
		in_use = FALSE
		revived_mob.emote("cough")
		return
	total_brute	= revived_mob.getBruteLoss()
	total_burn	= revived_mob.getFireLoss()

	if (!can_revive(revived_mob))
		revived_mob.visible_message(SPAN_WARNING("[revived_mob] doesn't respond..."))
		in_use = FALSE
		return
	else if(revived_mob.get_ghost())
		revived_mob.visible_message(SPAN_WARNING("[revived_mob] gasps, but doesn't stir yet."))
		to_chat(user, SPAN_NOTICE("Perhaps they need another dose?"))
		in_use = FALSE
		return
	//If the body has been fixed so that they would not be in crit when revived, give them oxyloss to put them back into crit
	var/const/threshold = ((HEALTH_THRESHOLD_CRIT + HEALTH_THRESHOLD_DEAD) * 0.5)
	if (revived_mob.health > threshold)
		revived_mob.adjustOxyLoss(revived_mob.health - threshold, 0)
	else
		var/overall_damage = total_brute + total_burn + revived_mob.getToxLoss() + revived_mob.getOxyLoss()
		var/mobhealth = revived_mob.health
		revived_mob.adjustOxyLoss((mobhealth - threshold) * (revived_mob.getOxyLoss() / overall_damage), 0)
		revived_mob.adjustToxLoss((mobhealth - threshold) * (revived_mob.getToxLoss() / overall_damage), 0)
		revived_mob.adjustFireLoss((mobhealth - threshold) * (total_burn / overall_damage), 0)
		revived_mob.adjustBruteLoss((mobhealth - threshold) * (total_brute / overall_damage), 0)
	revived_mob.updatehealth() // Previous "adjust" procs don't update health, so we do it manually.
	revived_mob.visible_message(SPAN_NOTICE("[revived_mob] gasps and stirs!"), SPAN_NOTICE("You're alive!"))
	revived_mob.set_heartattack(FALSE) // if you can safely be revived without this, then this should be removed; smelling salts aren't a defib
	revived_mob.revive()
	revived_mob.emote("gasp")
	revived_mob.Jitter(20)
	if(time_since_death > time_limit)
		revived_mob.adjustBrainLoss( max(0, min(99, ((time_limit - time_since_death) / time_limit * 100))), 150)
	add_logs(user, revived_mob, "revived (smelling salts)", src)
	in_use = FALSE
