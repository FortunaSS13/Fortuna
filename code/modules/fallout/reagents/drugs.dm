/datum/reagent/drug/jet
	name = "Jet"
	description = "A chemical used to induce a euphoric high derived from brahmin dung. Fast-acting, powerful, and highly addictive."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 10
	addiction_threshold = 9

/datum/reagent/drug/jet/on_mob_add(mob/living/carbon/human/M)
	..()
	if(isliving(M))
		M.set_disgust(0)
		if(prob(50))
			addiction_random = 6
			addiction_threshold = (addiction_random -= addiction_threshold)
		to_chat(M, "<span class='notice'>You feel a euphoric rush wash over your body, muscles tensing up and heartrate increasing tenfold!</span>")

/datum/reagent/drug/jet/on_mob_delete(mob/living/carbon/human/M)
	..()
	if(isliving(M))
		to_chat(M, "<span class='notice'>Time begins to return to normal speed around you as the high fades...</span>")
		M.confused += 2

/datum/reagent/drug/jet/on_mob_life(mob/living/carbon/M)
	M.adjustStaminaLoss(-40, 0)
	M.set_drugginess(20)
	M.Jitter(2)
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !isspaceturf(M.loc) && prob(10))
		step(M, pick(GLOB.cardinals))
	if(prob(12))
		M.emote(pick("twitch","drool","moan","giggle"))
	..()

/datum/reagent/drug/jet/overdose_start(mob/living/M)
	to_chat(M, "<span class='userdanger'>You start tripping hard!</span>")
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "[type]_overdose", /datum/mood_event/overdose, name)

/datum/reagent/drug/jet/overdose_process(mob/living/M)
	if(M.hallucination < volume && prob(20))
		M.hallucination += 10
		M.adjustToxLoss(10, 0)
		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 60)
	..()

/datum/reagent/drug/jet/addiction_act_stage1(mob/living/M)
	M.Dizzy(1)
	if(prob(20))
		M.emote(pick("twitch","drool","moan"))
	..()

/datum/reagent/drug/jet/addiction_act_stage2(mob/living/M)
	M.Dizzy(5)
	if(prob(10))
		M.set_disgust(30)
	if(prob(40))
		M.emote(pick("twitch","drool","moan"))
	M.blur_eyes(5)
	..()

/datum/reagent/drug/jet/addiction_act_stage3(mob/living/M)
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovableatom(M.loc) && !isspaceturf(M.loc))
		for(var/i = 0, i < 4, i++)
			step(M, pick(GLOB.cardinals))
	M.set_disgust(50)
	M.Dizzy(10)
	if(prob(10))
		M.adjustStaminaLoss(20, 0)
	if(prob(20))
		M.emote(pick("twitch","drool","moan"))
	..()

/datum/reagent/drug/jet/addiction_act_stage4(mob/living/carbon/human/M)
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovableatom(M.loc) && !isspaceturf(M.loc))
		for(var/i = 0, i < 8, i++)
			step(M, pick(GLOB.cardinals))
	M.set_disgust(150)
	M.blur_eyes(10)
	M.adjustBruteLoss(2, 0)
	M.adjustToxLoss(2, 0)
	if(prob(10))
		M.adjustStaminaLoss(200, 0)
		M.visible_message("<span class='danger'>[M] heaves with exhaustion, collapsing to the ground!</span>")
	if(prob(30))
		M.emote(pick("twitch","drool","moan"))
	..()
	. = TRUE

/datum/reagent/drug/turbo
	name = "Turbo"
	description = "A chemical compound that, when inhaled, vastly increases the user's reflexes and slows their perception of time. Carries a risk of addiction and extreme nausea and toxin damage if overdosed."
	reagent_state = LIQUID
	color = "#FAFAFA"
	overdose_threshold = 10
	addiction_threshold = 5
	metabolization_rate = 0.5 * REAGENTS_METABOLISM

/datum/reagent/drug/turbo/on_mob_add(mob/M)
	..()
	ADD_TRAIT(M, TRAIT_IGNORESLOWDOWN, "[type]")
	if(isliving(M))
		M.set_disgust(0)
		if(prob(50))
			addiction_random = 6
			addiction_threshold = (addiction_random -= addiction_threshold)

/datum/reagent/drug/turbo/on_mob_delete(mob/M)
	REMOVE_TRAIT(M, TRAIT_IGNORESLOWDOWN, "[type]")
	..()

/datum/reagent/drug/turbo/on_mob_life(mob/living/carbon/M)
	var/high_message = pick("You feel hyper.", "You feel like you need to go faster.", "You feel like you can run the world.")
	if(prob(5))
		to_chat(M, "<span class='notice'>[high_message]</span>")
	M.Jitter(2)
	if(prob(5))
		M.emote(pick("twitch", "shiver"))
	..()
	. = TRUE

/datum/reagent/drug/turbo/overdose_process(mob/living/M)
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovableatom(M.loc) && !isspaceturf(M.loc))
		for(var/i in 1 to 4)
			step(M, pick(GLOB.cardinals))
	if(prob(10))
		M.emote("laugh")
	if(prob(5))
		to_chat(M, "<spawn class='notice'>A stabbing pain appears in your chest, heart beating too fast for it to handle!</span>")
		M.adjustOrganLoss(ORGAN_SLOT_HEART, 5)
	if(prob(33))
		M.visible_message("<span class='danger'>[M]'s hands flip out and flail everywhere!</span>")
		M.drop_all_held_items()
	..()
	M.adjustToxLoss(2, 0)
	. = TRUE

/datum/reagent/drug/turbo/addiction_act_stage1(mob/living/M)
	M.Jitter(5)
	if(prob(10))
		shake_camera(M, 10, 1)
		M.emote(pick("twitch","drool","moan"))
	..()

/datum/reagent/drug/turbo/addiction_act_stage2(mob/living/M)
	M.Jitter(10)
	M.Dizzy(10)
	if(prob(20))
		shake_camera(M, 10, 2)
		M.emote(pick("twitch","drool","moan"))
	..()

/datum/reagent/drug/turbo/addiction_act_stage3(mob/living/M)
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovableatom(M.loc) && !isspaceturf(M.loc))
		for(var/i = 0, i < 4, i++)
			step(M, pick(GLOB.cardinals))
	M.Jitter(15)
	M.Dizzy(15)
	if(prob(20))
		shake_camera(M, 10, 2)
		M.emote(pick("twitch","drool","moan"))
	..()

/datum/reagent/drug/turbo/addiction_act_stage4(mob/living/carbon/human/M)
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovableatom(M.loc) && !isspaceturf(M.loc))
		for(var/i = 0, i < 8, i++)
			step(M, pick(GLOB.cardinals))
	M.Jitter(20)
	M.Dizzy(20)
	M.adjustBruteLoss(5)
	if(prob(20))
		shake_camera(M, 10, 3)
		M.emote(pick("twitch","drool","moan"))
	..()
	. = TRUE

/datum/reagent/drug/psycho
	name = "Psycho"
	description = "Makes the user hit harder and shrug off slight stuns, but causes slight brain damage and carries a risk of addiction."
	reagent_state = LIQUID
	color = "#FF0000"
	overdose_threshold = 15
	addiction_threshold = 20
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	var/datum/brain_trauma/special/psychotic_brawling/bath_salts/rage


/datum/reagent/drug/psycho/on_mob_life(mob/living/carbon/M)
	var/high_message = pick("<br><font color='#FF0000'><b>FUCKING KILL!</b></font>", "<br><font color='#FF0000'><b>RAAAAR!</b></font>", "<br><font color='#FF0000'><b>BRING IT!</b></font>")
	if(prob(20))
		to_chat(M, "<span class='notice'>[high_message]</span>")
	M.AdjustStun(-25, 0)
	M.AdjustKnockdown(-25, 0)
	M.AdjustUnconscious(-25, 0)
	M.adjustStaminaLoss(-5, 0)
	M.Jitter(2)
	..()
	. = TRUE

/datum/reagent/drug/psycho/on_mob_add(mob/living/L)
	..()
	ADD_TRAIT(L, TRAIT_SLEEPIMMUNE, "[type]")
	if(iscarbon(L))
		var/mob/living/carbon/C = L
		rage = new()
		M.set_disgust(0)
		L.add_client_colour(/datum/client_colour/glass_colour/red)
		C.gain_trauma(rage, TRAUMA_RESILIENCE_ABSOLUTE)
	if(isliving(L))
		if(prob(5))
			addiction_random = 12
			addiction_threshold = (addiction_random -= addiction_threshold)

/datum/reagent/drug/psycho/on_mob_delete(mob/living/L)
	REMOVE_TRAIT(L, TRAIT_SLEEPIMMUNE, "[type]")
	if(rage)
		QDEL_NULL(rage)
	L.remove_client_colour(/datum/client_colour/glass_colour/red)
	..()

/datum/reagent/drug/psycho/overdose_process(mob/living/carbon/human/M)
	M.hallucination += 20
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovableatom(M.loc) && !isspaceturf(M.loc))
		for(var/i = 0, i < 8, i++)
			step(M, pick(GLOB.cardinals))
	if(prob(20))
		M.emote(pick("twitch","scream","laugh"))
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 2)
	M.set_heartattack(TRUE)
	M.visible_message("<span class='userdanger'>[M] clutches at their chest as if their heart stopped!</span>")
	to_chat(M, "<span class='danger'>Your vision goes black and your heart stops beating as the amount of drugs in your system shut down your organs one by one. Say hello to Elvis in the afterlife. </span>")
	..()
	return TRUE

/datum/reagent/drug/psycho/addiction_act_stage1(mob/living/M)
	M.hallucination += 10
	M.Jitter(5)
	if(prob(20))
		M.emote(pick("twitch","scream","laugh"))
	..()
	return
/datum/reagent/drug/psycho/addiction_act_stage2(mob/living/M)
	M.hallucination += 20
	M.Jitter(10)
	M.Dizzy(10)
	if(prob(30))
		M.emote(pick("twitch","scream","laugh"))
	..()
	return
/datum/reagent/drug/psycho/addiction_act_stage3(mob/living/M)
	M.hallucination += 30
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovableatom(M.loc) && !isspaceturf(M.loc))
		for(var/i = 0, i < 2, i++)
			step(M, pick(GLOB.cardinals))
	M.Jitter(15)
	M.hallucination += 10
	M.Dizzy(15)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 2)
	if(prob(40))
		M.emote(pick("twitch","scream","laugh"))
	..()
	return
/datum/reagent/drug/psycho/addiction_act_stage4(mob/living/carbon/human/M)
	M.hallucination += 40
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovableatom(M.loc) && !isspaceturf(M.loc))
		for(var/i = 0, i < 4, i++)
			step(M, pick(GLOB.cardinals))
	M.Jitter(50)
	M.Dizzy(50)
	M.adjustToxLoss(5)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 5)
	if(prob(50))
		M.emote(pick("twitch","scream","laugh"))
	..()
	return

/datum/reagent/drug/buffout
	name = "Buffout"
	description = "A powerful steroid which increases the user's strength and endurance."
	color = "#FF9900"
	reagent_state = SOLID
	overdose_threshold = 20
	addiction_threshold = 15
	metabolization_rate = 1.25 * REAGENTS_METABOLISM
	var/datum/brain_trauma/special/psychotic_brawling/bath_salts/rage

/datum/reagent/drug/buffout/on_mob_add(mob/living/carbon/human/M)
	..()
	if(isliving(M))
		to_chat(M, "<span class='notice'>You feel stronger, and like you're able to endure more.</span>")
		ADD_TRAIT(M, TRAIT_BUFFOUT_BUFF, "buffout")
		ADD_TRAIT(M, TRAIT_PERFECT_ATTACKER, "buffout")
		M.maxHealth += 25
		M.health += 25
		M.set_disgust(0)
		if(prob(5))
			addiction_random = 7
			addiction_threshold = (addiction_random -= addiction_threshold)


/datum/reagent/drug/buffout/on_mob_delete(mob/living/carbon/human/M)
	..()
	if(isliving(M))
		to_chat(M, "<span class='notice'>You feel weaker.</span>")
		REMOVE_TRAIT(M, TRAIT_BUFFOUT_BUFF, "buffout")
		REMOVE_TRAIT(M, TRAIT_PERFECT_ATTACKER, "buffout")
		M.maxHealth -= 25
		M.health -= 25

/datum/reagent/drug/buffout/on_mob_life(mob/living/carbon/M)
	M.AdjustStun(-10*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.AdjustKnockdown(-10*REAGENTS_EFFECT_MULTIPLIER, 0)
	..()
	. = TRUE

/datum/reagent/drug/buffout/overdose_process(mob/living/carbon/human/M)
	if(iscarbon(M))
		var/mob/living/carbon/C = M
		rage = new()
		C.gain_trauma(rage, TRAUMA_RESILIENCE_ABSOLUTE)
	var/datum/disease/D = new /datum/disease/heart_failure
	M.ForceContractDisease(D)
	if(prob(33))
		M.visible_message("<span class='danger'>[M]'s muscles spasm, making them drop what they were holding!</span>")
		M.drop_all_held_items()
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 2)
	..()

/datum/reagent/drug/buffout/addiction_act_stage1(mob/living/M)
	to_chat(M, "<span class='notice'>Your muscles ache slightly.</span>")

	if(prob(15))
		M.emote(pick("twitch"))
	..()
	return

/datum/reagent/drug/buffout/addiction_act_stage2(mob/living/M)
	to_chat(M, "<span class='notice'>Your muscles feel incredibly sore.</span>")
	M.adjustBruteLoss(2)
	if(prob(30))
		to_chat(M, "<span class='notice'>Your muscles spasm, making you drop what you were holding.</span>")
		M.drop_all_held_items()
		M.emote(pick("twitch"))
	..()
	return

/datum/reagent/drug/buffout/addiction_act_stage3(mob/living/M)
	to_chat(M, "<span class='notice'>Your muscles start to hurt badly, and everything feels like it hurts more.</span>")
	M.maxHealth -= 1.5
	M.health -= 1.5
	if(prob(50))
		to_chat(M, "<span class='notice'>Your muscles spasm, making you drop what you were holding. You're not even sure if you can control your arms!</span>")
		M.drop_all_held_items()
		M.emote(pick("twitch"))
	..()
	return

/datum/reagent/drug/buffout/addiction_act_stage4(mob/living/M)
	to_chat(M, "<span class='danger'>Your muscles are in incredible pain! When will it stop!?</span>")
	M.adjustBruteLoss(5)
	M.hallucination += 10
	M.maxHealth -= 10
	M.health -= 10
	if(prob(90))
		to_chat(M, "<span class='danger'>You can't even keep control of your muscles anymore!</span>")
		M.drop_all_held_items()
		M.emote(pick("twitch"))
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !isspaceturf(M.loc) && prob(25))
		step(M, pick(GLOB.cardinals))
	M.adjustOrganLoss(ORGAN_SLOT_HEART, 5)
	..()
	return
