/*
Legion Design notes:
"Standard issue", AVOID identical kits and guns. Legion got spotty logistics and the hodgepodge aesthetic suits them, don't ruin it.
Sunglasses	For vets mainly, most lower ranks should have sandstorm goggles.
Money		Cent & Treasurer - "small" money bag (the biggest)
			Decanus - Officer money bag
			Rest - Enlisted money bag
Sidearm		None.
Melee		Officers only - Spatha
			Vets/Officers - Gladius
			Rest - Lawnmower machete the most common
Weapons		Lever shotgun, Grease gun, Repeater carbines, Revolvers, simple guns all good, very restrictive on long barrel automatics, generally limited ammo, always good melee option.
			Avoid Police shotguns, 5,56 semis, Desert Eagle, Survival knives etc, be creative and work within the limitations to avoid powercreep and things getting bland and same.
*/

/datum/job/CaesarsLegion
	department_flag = LEGION
	selection_color = "#ffeeee"
	faction = FACTION_LEGION

	forbids = "The Legion forbids: Using drugs such as stimpacks and alcohol. Ghouls joining. Women fighting (self defense and suicide allowed). Slaves carrying weapons. Using robots and advanced machines. Killing Legion members in secret, only if according to law and in public is it acceptable."
	enforces = "The Legion demands: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a NON-COMBAT infiltrator. Expect death as punishment for failing to obey."
	objectivesList = list("Focus on the tribals, win them over or intimidate them.", "Focus on Oasis, display dominance.", "Send out patrols and establish checkpoints to curb use of digusting drugs and degenerate behaviour.", "Flagstaff requests more worker: acquire slaves, train them if possible, send them east for breaking if not.", "Make sure no other faction gains dominance over Oasis, if they remain neutral it can be used to the Legions advantage.")

	exp_type = EXP_TYPE_LEGION

	access = list(ACCESS_LEGION)
	minimal_access = list(ACCESS_LEGION)

/datum/outfit/job/CaesarsLegion
	ears = null
	box = null

/datum/outfit/job/CaesarsLegion/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legioncombatarmor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legioncombathelmet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legioncombatarmormk2)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legioncombathelmetmk2)

/datum/outfit/job/CaesarsLegion/Legionnaire
	belt = /obj/item/storage/belt/military/assault/legion
	ears = /obj/item/radio/headset/headset_legion
	backpack = /obj/item/storage/backpack/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	uniform = /obj/item/clothing/under/f13/legskirt
	shoes = /obj/item/clothing/shoes/f13/military/legion
	gloves = /obj/item/clothing/gloves/legion
	box = /obj/item/storage/survivalkit_tribal

/datum/outfit/job/CaesarsLegion/Legionnaire/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == FEMALE)
		H.gender = MALE
		H.real_name = random_unique_name(MALE)
		H.name = H.real_name
		if(H.wear_id)
			var/obj/item/card/id/dogtag/L = H.wear_id
			L.registered_name = H.name
			L.update_label()

/datum/outfit/job/CaesarsLegion/Legionnaire/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TRIBAL, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/obj/item/storage/box/legate
	name = "legate belongings"
	icon_state = "secbox"
	illustration = "flashbang"

/obj/item/storage/box/legate/PopulateContents()
	. = ..()
	new /obj/item/reagent_containers/pill/patch/healpoultice(src)
	new /obj/item/reagent_containers/pill/patch/healpoultice(src)
	new /obj/item/ammo_box/magazine/m14mm(src)
	new /obj/item/ammo_box/magazine/m14mm(src)
	new /obj/item/ammo_box/magazine/m14mm(src)


///////////////////
/// Admin Roles ///
///////////////////

// LEGATE

/datum/job/CaesarsLegion/Legionnaire/f13legate
	title = "Legion Legate"
	flag = F13LEGATE
	head_announce = list("Security")
	supervisors = "Caesar"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	total_positions = 0
	spawn_positions = 0
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13legate
	access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS)
	minimal_access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legate/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legate	// 14mm Pistol, Powerfist
	name = "Legate"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13legate
	shoes =	/obj/item/clothing/shoes/f13/military/legate
	suit = /obj/item/clothing/suit/armor/f13/legion/legate
	head = /obj/item/clothing/head/helmet/f13/legion/legate
	gloves = /obj/item/clothing/gloves/legion/legate
	glasses = /obj/item/clothing/glasses/sunglasses/big
	suit_store = /obj/item/gun/ballistic/automatic/pistol/pistol14
	r_pocket = /obj/item/storage/bag/money/small/legion
	l_pocket = /obj/item/flashlight/lantern
	r_hand = /obj/item/melee/powerfist/goliath
	l_hand = /obj/item/tank/internals/oxygen
	backpack = null
	satchel = null
	box = /obj/item/storage/box/legate


// ORATOR

/datum/job/CaesarsLegion/Legionnaire/f13orator
	title = "Legion Orator"
	flag = F13ORATOR
	supervisors = "Legate"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	total_positions = 0
	spawn_positions = 0
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13orator
	display_order = JOB_DISPLAY_ORDER_ORATOR
	access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS, ACCESS_LEGION_COMMAND)
	minimal_access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS, ACCESS_LEGION_COMMAND)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13orator	// 10mm Revolver, Spatha
	name = "Orator"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13orator
	neck = /obj/item/storage/belt/holster
	shoes =	/obj/item/clothing/shoes/f13/military/legate
	suit = /obj/item/clothing/suit/armor/f13/legion/legate
	head = null
	id = /obj/item/card/id/dogtag/legcenturion
	gloves = null
	shoes = /obj/item/clothing/shoes/roman
	suit_store = /obj/item/gun/ballistic/revolver/colt6520
	r_pocket = /obj/item/storage/bag/money/small/legofficers
	l_pocket = /obj/item/flashlight/lantern
	l_hand = /obj/item/melee/onehanded/machete/spatha
	backpack_contents = list(
		/obj/item/ammo_box/l10mm = 2,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 1,
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13orator/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

/////////////////
//// Officers ///
/////////////////

// CENTURION

/datum/job/CaesarsLegion/Legionnaire/f13centurion
	title = "Legion Remnants Legate"
	flag = F13CENTURION
	head_announce = list("Security")
	total_positions = 1
	spawn_positions = 1
	description = "You were once the leader of this local encampment. Now? Caesar is dead. The Legion is dead. Mars has damned you all. This camp is all that remains of the Legion, and Yuma all that remains of humanity. On the bright side, now that Lanius is dead, you're technically the Legate!"
	supervisors = "Nobody. You are all that's left."
	selection_color = "#ffdddd"
	req_admin_notify = 1
	display_order = JOB_DISPLAY_ORDER_CENTURION
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13centurion
	exp_requirements = 1500

	access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS, ACCESS_LEGION_COMMAND)
	minimal_access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS, ACCESS_LEGION_COMMAND)

	loadout_options = list(
		/datum/outfit/loadout/palacent,		// M1919, military ripper
		/datum/outfit/loadout/rangerhunter,	// Hunting revolver, AMR
		/datum/outfit/loadout/centurion,	// 14mm pistol, Powerfist
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13centurion/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13centurion
	name = "Legion Remnant Legate"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13centurion
	id = /obj/item/card/id/dogtag/legcenturion
	mask = /obj/item/clothing/mask/bandana/legion/legcenturion
	neck = /obj/item/storage/belt/holster
	gloves = /obj/item/clothing/gloves/legion/plated
	glasses = /obj/item/clothing/glasses/night/polarizing
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/restraints/handcuffs
	l_pocket = /obj/item/flashlight/lantern
	box = /obj/item/storage/survivalkit_tribal/chief
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola = 1,
		/obj/item/storage/bag/money/small/legion = 1,
		)

/datum/outfit/loadout/palacent
	name = "Paladin-Slayer Legate"
	suit = /obj/item/clothing/suit/armor/f13/legion/palacent
	head = /obj/item/clothing/head/helmet/f13/legion/palacent
	suit_store = /obj/item/gun/ballistic/automatic/m1919
	backpack_contents = list(
		/obj/item/melee/powered/ripper/prewar = 1,
		/obj/item/ammo_box/magazine/mm762 = 1,
		)

/datum/outfit/loadout/rangerhunter
	name = "Ranger-Hunter Legate"
	suit = /obj/item/clothing/suit/armor/f13/legion/rangercent
	head = /obj/item/clothing/head/helmet/f13/legion/rangercent
	suit_store = /obj/item/gun/ballistic/rifle/mag/antimateriel
	backpack_contents = list(
		/obj/item/ammo_box/magazine/amr = 1,
		/obj/item/ammo_box/c4570 = 3,
		/obj/item/gun/ballistic/revolver/hunting = 1,
		/obj/item/melee/onehanded/machete/spatha = 1,
		)

/datum/outfit/loadout/centurion
	name = "Frontline Centurion"
	suit = /obj/item/clothing/suit/armor/f13/legion/centurion
	head = /obj/item/clothing/head/helmet/f13/legion/centurion
	suit_store = /obj/item/gun/ballistic/automatic/pistol/pistol14
	backpack_contents = list(
		/obj/item/melee/powerfist/goliath = 1,
		/obj/item/ammo_box/magazine/m14mm = 3,
		/obj/item/tank/internals/oxygen = 1
		)

/* /datum/outfit/loadout/berserkercenturion
	name = 			"Praetorian Candidate"
	suit = 			/obj/item/clothing/suit/armor/f13/legion/centurion
	head = 			/obj/item/clothing/head/helmet/f13/legion/centurion
	backpack_contents = list(
					/obj/item/melee/unarmed/sappers= 1,
					/obj/item/book/granter/martial/berserker= 1,
					/obj/item/reagent_containers/pill/patch/healingpowder/berserker=2)
commented out pending rework*/


// VETERAN DECANUS

/datum/job/CaesarsLegion/Legionnaire/f13decanvet
	title = "Legion Remnant Veteran Decanus"
	flag = F13DECANVET
	total_positions = 1
	spawn_positions = 1
	description = "You answer directly to the Legate, who is now, in lieu of the rest of the Legion being devoured, probably all that's left. Caesar is dead. Mars has damned you all. World is a fuck. Command your veterans, and try to preserve what little remains of mankind."
	supervisors = "the Legate"
	display_order = JOB_DISPLAY_ORDER_DECANVET
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13decanvet
	exp_requirements = 900

	access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS, ACCESS_LEGION_COMMAND)
	minimal_access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS, ACCESS_LEGION_COMMAND)

	loadout_options = list(
		/datum/outfit/loadout/decvetfront,	// Carl Gustaf, Fireaxe, Smoke bomb, slightly better helmet
		/datum/outfit/loadout/decvetrear,	// SKS, Spatha
		)


/datum/outfit/job/CaesarsLegion/Legionnaire/f13decanvet/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decanvet
	name = "Legion Veteran Decanus"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13decanvet
	id = /obj/item/card/id/dogtag/legveteran
	suit = /obj/item/clothing/suit/armor/f13/legion/heavy
	mask = /obj/item/clothing/mask/bandana/legion/legdecan
	neck = /obj/item/storage/belt/holster
	gloves = /obj/item/clothing/gloves/legion/plated
	glasses = /obj/item/clothing/glasses/sunglasses/big
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/flashlight/lantern
	box = /obj/item/storage/survivalkit_tribal/chief
	backpack_contents = list(
		/obj/item/ammo_box/a357 = 1,
		/obj/item/gun/ballistic/revolver/colt357 = 1,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/storage/bag/money/small/legofficers = 1,
		/obj/item/binoculars
		)

/datum/outfit/loadout/decvetfront
	name = "Lead from the front"
	head = /obj/item/clothing/head/helmet/f13/legion/heavy
	suit_store = /obj/item/twohanded/sledgehammer/supersledge
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/smg/greasegun = 1,
		/obj/item/ammo_box/magazine/greasegun = 2,
		/obj/item/grenade/smokebomb = 1,
		)

/datum/outfit/loadout/decvetrear
	name = "Lead from the rear"
	head = /obj/item/clothing/head/helmet/f13/legion/vet/decan
	suit_store = /obj/item/gun/ballistic/rifle/repeater/brush
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/spatha = 1,
		/obj/item/ammo_box/tube/c4570 = 3,
		)


// PRIME DECANUS

/datum/job/CaesarsLegion/Legionnaire/f13decan
	title = "Legion Remnant Prime Decanus"
	flag = F13DECAN
	total_positions = 1
	spawn_positions = 1
	description = "A experienced officer, often commanding the camp. With the rest of the Legion outside of Yuma destroyed, the survival of humanity itself depends on you doing your job properly."
	supervisors = "the Veteran Decanus and the Legate"
	display_order = JOB_DISPLAY_ORDER_DECAN
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13decan
	access = list(ACCESS_LEGION, ACCESS_LEGION_COMMAND)
	minimal_access = list(ACCESS_LEGION,  ACCESS_LEGION_COMMAND)
	exp_requirements = 720

	loadout_options = list(
		/datum/outfit/loadout/decprimfront,	// Grease Gun, Gladius, Smoke bomb
		/datum/outfit/loadout/decprimrear,	// Trail carbine, 10mm Revolver, Gladius, Smoke bomb
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decan/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decan
	name = "Prime Decanus"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13decan
	id = /obj/item/card/id/dogtag/legveteran
	suit = /obj/item/clothing/suit/armor/f13/legion/vet
	head = /obj/item/clothing/head/helmet/f13/legion/prime/decan
	mask = /obj/item/clothing/mask/bandana/legion/legdecan
	neck = /obj/item/storage/belt/holster
	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/flashlight/lantern
	l_pocket = /obj/item/restraints/handcuffs
	box = /obj/item/storage/survivalkit_tribal/chief
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/gladius = 1,
		/obj/item/storage/bag/money/small/legofficers = 1,
		/obj/item/grenade/smokebomb = 1,
		/obj/item/binoculars,
		)

/datum/outfit/loadout/decprimfront
	name = "Lead from the front"
	suit_store = /obj/item/gun/ballistic/automatic/smg/smg10mm
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m10mm_adv/ext = 2,
		)

/datum/outfit/loadout/decprimrear
	name = "Lead from the rear"
	suit_store = /obj/item/gun/ballistic/rifle/repeater/trail
	backpack_contents = list(
		/obj/item/ammo_box/tube/m44 = 2,
		/obj/item/gun/ballistic/revolver/colt6520 = 1,
		/obj/item/ammo_box/l10mm = 1,
		)


// RECRUIT DECANUS

/datum/job/CaesarsLegion/Legionnaire/f13decanrec
	title = "Legion Remnant Recruit Decanus"
	flag = F13DECANREC
	total_positions = 1
	spawn_positions = 1
	description = "Once a mere junior officer, now, amidst this second apocalypse, you are...still a junior officer. Oh well. Lead your recruits. Try not to get them all eaten."
	supervisors = "the Prime/Veteran Decanus and the Legate"
	display_order = JOB_DISPLAY_ORDER_DECANREC
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13decanrec
	exp_requirements = 600

	loadout_options = list(
		/datum/outfit/loadout/recdeclegion,	// .44 Revolver, Bumper sword, Smokebomb
		/datum/outfit/loadout/recdectribal,	// Lever shotgun, Throwing spears, Reinforced machete
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decanrec/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decanrec
	name = "Legion Recruit Decanus"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13decanrec
	id = /obj/item/card/id/dogtag/legveteran
	suit = /obj/item/clothing/suit/armor/f13/legion/vet
	head = /obj/item/clothing/head/helmet/f13/legion/recruit/decan
	mask = /obj/item/clothing/mask/bandana/legion/legdecan
	neck = /obj/item/storage/belt/holster
	glasses = /obj/item/clothing/glasses/legiongoggles
	r_pocket = /obj/item/flashlight/lantern
	l_pocket = /obj/item/storage/survivalkit_tribal
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder = 1,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/storage/bag/money/small/legofficers = 1,
		)

/datum/outfit/loadout/recdeclegion
	name = "Born in the Legion"
	suit_store = /obj/item/twohanded/fireaxe/bmprsword
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/m29 = 1,
		/obj/item/ammo_box/m44 = 3,
		/obj/item/grenade/smokebomb = 1,
		)

/datum/outfit/loadout/recdectribal
	name = "Tribal background"
	suit_store = /obj/item/gun/ballistic/shotgun/automatic/combat/shotgunlever
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 2,
		/obj/item/melee/onehanded/machete/forgedmachete = 1,
		/obj/item/storage/backpack/spearquiver = 1,
		)



////////////////////
///Specialist///////
////////////////////

// VEXILLARIUS

/datum/job/CaesarsLegion/Legionnaire/f13vexillarius
	title = "Legion Remnant Vexillarius"
	flag = F13VEXILLARIUS
	total_positions = 1
	spawn_positions = 1
	description = "You are a Veteran of proven bravery. With Caesar dead, the role falls to you to keep the morale of the camp alive."
	supervisors = "the Veteran Decanus and Legate"
	display_order = JOB_DISPLAY_ORDER_VEXILLARIUS
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13vexillarius
	exp_requirements = 720

	loadout_options = list(
		/datum/outfit/loadout/vexbear,	//	Classic FO13 Vex with his ripper: .223 pistol, Ripper
		/datum/outfit/loadout/vexfox,	// 	Classic New Vegas Vex with his sniper: DKS sniper, Gladius
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13vexillarius/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13vexillarius
	name = "Vexillarius"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13vexillarius
	id = /obj/item/card/id/dogtag/legveteran
	suit = /obj/item/clothing/suit/armor/f13/legion/vet/vexil
	mask = /obj/item/clothing/mask/bandana/legion/legvet
	neck = /obj/item/storage/belt/holster
	glasses = /obj/item/clothing/glasses/sunglasses
	gloves = /obj/item/clothing/gloves/legion/plated
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder = 1,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/megaphone/cornu = 1,
		/obj/item/storage/bag/money/small/legenlisted = 1,
		)

/datum/outfit/loadout/vexbear
	name = "Mountain Bear"
	head = /obj/item/clothing/head/helmet/f13/legion/vet/combvexil
	suit_store = /obj/item/gun/ballistic/revolver/thatgun
	backpack_contents = list(
		/obj/item/ammo_box/a556 = 1,
		/obj/item/melee/powered/ripper = 1,
		)

/datum/outfit/loadout/vexfox
	name = "Desert Fox"
	head = /obj/item/clothing/head/helmet/f13/legion/vet/vexil
	suit_store = /obj/item/gun/ballistic/automatic/smg/smg10mm
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m10mm_adv/ext = 2,
		/obj/item/melee/onehanded/machete/gladius = 1,
		)


//EXPLORER

/datum/job/CaesarsLegion/Legionnaire/f13explorer
	title = "Legion Remnant Explorer"
	flag = F13EXPLORER
	total_positions = 2
	spawn_positions = 2
	description = "Mars has damned you all. Caesar is dead. The dead themselves rise to devour the living. Scout for the hordes and work to keep humanity alive"
	supervisors = "the Veteran Decanus and Legate must be obeyed, and as always, respect must be given to other Decanus. You are not a officer, but you are a specialist."
	display_order = JOB_DISPLAY_ORDER_EXPLORER
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13explorer
	exp_requirements = 300

	loadout_options = list(
		/datum/outfit/loadout/expsniper,	// sniper rifle, .45 Revolver, Machete, Smokebomb
		/datum/outfit/loadout/expambusher,	// mp5, .45 revolver, Bottlecap mine, Machete
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
			),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
			),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13explorer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13explorer
	name = "Legion Explorer"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13explorer
	id = /obj/item/card/id/dogtag/legprime
	suit = /obj/item/clothing/suit/armor/f13/legion/vet/explorer
	head = /obj/item/clothing/head/helmet/f13/legion/vet/explorer
	neck = /obj/item/storage/belt/holster
	r_pocket = /obj/item/flashlight
	l_pocket = /obj/item/binoculars
	suit_store = /obj/item/gun/ballistic/revolver/revolver45
	backpack_contents = list(
		/obj/item/ammo_box/c45/improvised = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 1,
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/melee/onehanded/machete = 1,
		)

/datum/outfit/loadout/expambusher
	name = "Ambusher"
	suit_store = /obj/item/gun/ballistic/automatic/smg/mp5
	glasses = /obj/item/clothing/glasses/sunglasses/big
	backpack_contents = list(
		/obj/item/ammo_box/magazine/uzim9mm = 2,
		/obj/item/bottlecap_mine = 1,
		)

/datum/outfit/loadout/expsniper
	name = "Sniper"
	glasses = /obj/item/clothing/glasses/sunglasses/big
	suit_store = /obj/item/gun/ballistic/automatic/marksman/sniper
	backpack_contents = list(
		/obj/item/ammo_box/magazine/w308 = 3,
		/obj/item/melee/onehanded/machete = 1,
		/obj/item/grenade/smokebomb = 1,
		)



///////////////////
////Legionnaires///
///////////////////

// VETERAN

/datum/job/CaesarsLegion/Legionnaire/vetlegionnaire
	title = "Veteran Legionnaire"
	flag = F13VETLEGIONARY
	total_positions = 3
	spawn_positions = 3
	description = "A hardened warrior, obeying the orders from the Decanus and Legate is second nature. Your experience will help you, when it comes time to face against the hordes."
	supervisors = "the Decani and Legate"
	display_order = JOB_DISPLAY_ORDER_VETLEGIONARY
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/vetlegionnaire
	exp_requirements = 600

	loadout_options = list(
		/datum/outfit/loadout/vetshielder,	// .44 DA Revolver, Shield, Gladius, Armor plate
		/datum/outfit/loadout/vetrifle,		// Trail gun, Gladius
		/datum/outfit/loadout/vetberserker,	// Lever shotgun, Fireaxe, Bola
		)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/vetlegionnaire/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/vetlegionnaire
	name = "Veteran Legionnaire"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/vetlegionnaire
	id = /obj/item/card/id/dogtag/legveteran
	mask = /obj/item/clothing/mask/bandana/legion/legvet
	head = /obj/item/clothing/head/helmet/f13/legion/vet
	neck = /obj/item/storage/belt/holster
	suit = /obj/item/clothing/suit/armor/f13/legion/vet
	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder = 1,
		/obj/item/storage/bag/money/small/legenlisted = 1,
		)

/datum/outfit/loadout/vetshielder
	name = "Shieldbearer"
	suit_store = /obj/item/gun/ballistic/revolver/m29
	backpack_contents = list(
		/obj/item/ammo_box/m44 = 3,
		/obj/item/melee/onehanded/machete/gladius = 1,
		/obj/item/shield/riot/legion = 1,
		/obj/item/stack/crafting/armor_plate = 1,
		)

/datum/outfit/loadout/vetrifle
	name = "Sharpshooter"
	suit_store = /obj/item/gun/ballistic/rifle/repeater/trail
	backpack_contents = list(
		/obj/item/ammo_box/tube/m44 = 3,
		/obj/item/melee/onehanded/machete/gladius = 1,
		)

/datum/outfit/loadout/vetberserker
	name = "Berserker"
	suit_store = /obj/item/gun/ballistic/shotgun/automatic/combat/shotgunlever
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/slug = 1,
		/obj/item/ammo_box/shotgun/buck = 1,
		/obj/item/twohanded/spear/lance = 1,
		/obj/item/restraints/legcuffs/bola = 2,
		)


// PRIME

/datum/job/CaesarsLegion/Legionnaire/f13legionary
	title = "Prime Legionnaire"
	flag = F13LEGIONARY
	total_positions = 4
	spawn_positions = 4
	description = "A front line soldier who has shown ability to obey and fought in some battles. The Legions muscle, the young men who were once meant to build the future with blood and sacrifice for Caesar. There is no future now. Only death."
	supervisors = "the Decani and Legate"
	display_order = JOB_DISPLAY_ORDER_LEGIONARY
	exp_requirements = 120
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13legionary

	loadout_options = list(
		/datum/outfit/loadout/primelancer,	// .45 Revolver, Buckler, Forged machete, Bola
		/datum/outfit/loadout/primerifle,	// Cowboy repeater, Machete, Firebomb
		/datum/outfit/loadout/primebrave,	// Hunting shotgun, Throwing spears, Machete
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legionary/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legionary
	name = "Prime Legionnaire"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13legionary
	id = /obj/item/card/id/dogtag/legprime
	mask = /obj/item/clothing/mask/bandana/legion/legprime
	head = /obj/item/clothing/head/helmet/f13/legion/prime
	neck = /obj/item/storage/belt/holster
	suit = /obj/item/clothing/suit/armor/f13/legion/prime
	glasses = /obj/item/clothing/glasses/legiongoggles
	r_pocket = /obj/item/flashlight/lantern
	l_pocket = /obj/item/restraints/handcuffs
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 1,
		)

/datum/outfit/loadout/primelancer
	name = "Frontliner"
	suit_store = /obj/item/gun/ballistic/automatic/pistol/n99
	r_hand = /obj/item/shield/riot/legion
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m10mm_adv = 2,
		/obj/item/restraints/legcuffs/bola = 1,
		/obj/item/melee/onehanded/machete/forgedmachete = 1,
		/obj/item/book/granter/trait/trekking = 1,
		)

/datum/outfit/loadout/primerifle
	name = "Gunner"
	suit_store = /obj/item/gun/ballistic/rifle/repeater/cowboy
	backpack_contents = list(
		/obj/item/ammo_box/a357 = 3,
		/obj/item/melee/onehanded/machete = 1,
		/obj/item/grenade/homemade/firebomb = 1,
		)

/datum/outfit/loadout/primebrave
	name = "Brave"
	suit_store = /obj/item/gun/ballistic/shotgun/hunting
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 1,
		/obj/item/melee/onehanded/machete = 1,
		/obj/item/storage/backpack/spearquiver = 1,
		)


// RECRUIT

/datum/job/CaesarsLegion/Legionnaire/f13recleg
	title = "Recruit Legionnaire"
	flag = F13RECRUITLEG
	total_positions = 5
	spawn_positions = 5
	description = "You have recently come of age or been inducted into Caesar's Legion. You have absolutely no training, are expected to follow every whim of the Decanii and your Legate, and to top it off, ghouls are eating all of humanity."
	supervisors = "the Decani and Legate."
	display_order = JOB_DISPLAY_ORDER_RECRUITLEG
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13recleg

	loadout_options = list(
		/datum/outfit/loadout/recruittribal,	// Lance, Bola, Big Leagues (Fresh tribal, meant to go melee)
		/datum/outfit/loadout/recruitlegion,	// .357 Revolver, Machete, 2 x Molotovs
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13recleg/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13recleg
	name = "Recruit Legionnaire"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13recleg
	id = /obj/item/card/id/dogtag/legrecruit
	shoes = /obj/item/clothing/shoes/f13/military/leather
	suit = /obj/item/clothing/suit/armor/f13/legion/recruit
	head = /obj/item/clothing/head/helmet/f13/legion/recruit
	mask = /obj/item/clothing/mask/bandana/legion/legrecruit
	glasses = /obj/item/clothing/glasses/legiongoggles
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 1,
		)

/datum/outfit/loadout/recruittribal
	name = "Tribal Recruit"
	suit_store = /obj/item/twohanded/fireaxe
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola = 1,
		/obj/item/book/granter/trait/trekking = 1,
		)

/datum/outfit/loadout/recruitlegion
	name = "Legion Recruit"
	suit_store = /obj/item/gun/ballistic/revolver/colt357
	backpack_contents = list(
		/obj/item/ammo_box/a357 = 3,
		/obj/item/melee/onehanded/machete = 1,
		/obj/item/reagent_containers/food/drinks/bottle/molotov = 2,
		/obj/item/reagent_containers/glass/bottle/napalm = 2,
		/obj/item/lighter/greyscale = 1,
		)



//////////////////////
////Support Roles ////
//////////////////////

// SLAVEMASTER  Kind off duty, camp defender, making sure slaves and prisoners are in order.

/datum/job/CaesarsLegion/Legionnaire/f13slavemaster
	title = "Legion Remnant Slavemaster"
	flag = F13SLAVEMASTER
	total_positions = 1
	spawn_positions = 1
	description = "This is the worst apocalypse EVER. You can't enslave zombies. All they do is bite."
	supervisors = "the Legate."
	display_order = JOB_DISPLAY_ORDER_SLAVEMASTER
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13slavemaster
	exp_requirements = 300

/datum/outfit/job/CaesarsLegion/Legionnaire/f13slavemaster
	name = "Slavemaster"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13slavemaster
	id = /obj/item/card/id/dogtag/legslavemaster
	mask = /obj/item/clothing/mask/bandana/legion/camp
	uniform = /obj/item/clothing/under/f13/legskirt
	suit = /obj/item/clothing/suit/armor/f13/legion/prime/slavemaster
	head = /obj/item/clothing/head/helmet/f13/legion/prime/slavemaster
	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/roman
	r_pocket = /obj/item/restraints/handcuffs
	l_pocket = /obj/item/flashlight/lantern
	suit_store = /obj/item/gun/ballistic/revolver/caravan_shotgun
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/melee/onehanded/machete = 1,
		/obj/item/ammo_box/shotgun/bean = 1,
		/obj/item/melee/onehanded/slavewhip = 1,
		/obj/item/razor = 1,
		/obj/item/restraints/legcuffs/bola = 1,
		/obj/item/electropack/shockcollar/explosive = 1,
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13slavemaster/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_MARS_TEACH, src)


// FORGE MASTER

/datum/job/CaesarsLegion/Legionnaire/f13campfollower	// Chainsaw, Extra materials, Blueprints
	title = "Legion Remnant Forgemaster"
	flag = F13CAMPFOLLOWER
	total_positions = 1
	spawn_positions = 1
	description = "The Forgemaster makes weapons of all sorts and upgrades them, keeping order in the Forge and makes sure the camp is defended."
	supervisors = "the Legate."
	display_order = JOB_DISPLAY_ORDER_CAMPFOLLOWER
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13campfollower
	exp_requirements = 300

/datum/outfit/job/CaesarsLegion/Legionnaire/f13campfollower
	name = "Legion Forgemaster"
	id = /obj/item/card/id/dogtag/legforgemaster
	glasses = /obj/item/clothing/glasses/welding
	belt = /obj/item/storage/belt/utility/waster/forgemaster
	neck = /obj/item/clothing/neck/apron/labor/forge
	gloves = /obj/item/clothing/gloves/legion/forgemaster
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/stack/sheet/metal/twenty = 2,
		/obj/item/stack/sheet/mineral/wood/twenty = 1,
		/obj/item/stack/sheet/leather/twenty = 1,
		/obj/item/stack/sheet/cloth/thirty = 1,
		/obj/item/stack/sheet/prewar = 1,
		/obj/item/weldingtool = 1,
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13campfollower/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/gladius)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/spatha)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/lance)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legionshield)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/lever_action)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/grease_gun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/brush)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legionlance)



// AUXILIA - Civilians with special training. Can sow new uniforms for soldiers who lost theirs, and are loyal so they would never abuse this.

/datum/job/CaesarsLegion/auxilia
	title = "Legion Auxilia"
	flag = F13AUXILIA
	total_positions = 2
	spawn_positions = 2
	description = "A non-combat position in the Legion for free citizens who perform tasks that need special training, such as surgery. They are loyal to the Legion-now that it has been consumed by the hordes, their loyalty falls to the Legate."
	supervisors = "the Legate"
	display_order = JOB_DISPLAY_ORDER_AUXILIA
	outfit = /datum/outfit/job/CaesarsLegion/auxilia
	exp_requirements = 600

	loadout_options = list(
		/datum/outfit/loadout/auxassist, // Keep track of the money, handle trading beneath the warriors
		/datum/outfit/loadout/auxmedicus, // Do surgery, medical tasks.
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)


/datum/outfit/job/CaesarsLegion/auxilia
	name = "Legion Auxilia"
	jobtype = /datum/job/CaesarsLegion/auxilia
	id = /obj/item/card/id/dogtag/legauxilia
	head = /obj/item/clothing/head/f13/legion/auxilia
	uniform = /obj/item/clothing/under/f13/legauxiliaf
	shoes = /obj/item/clothing/shoes/roman
	ears = /obj/item/radio/headset/headset_legion
	gloves = null
	belt = null
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		)

/datum/outfit/job/CaesarsLegion/auxilia/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_SURGERY_LOW, src)
	ADD_TRAIT(H, TRAIT_MARS_TEACH, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tailor/legionuniform)


/datum/outfit/loadout/auxassist
	name = "Treasurer"
	neck = /obj/item/clothing/neck/mantle/treasurer
	backpack_contents = list(
		/obj/item/folder/red = 1,
		/obj/item/paper/natural = 2,
		/obj/item/pen/fountain = 1,
		/obj/item/storage/bag/money/small/legion = 1,
		/obj/item/taperecorder = 1,
		/obj/item/clothing/under/f13/legauxilia = 1,
		)

/datum/outfit/loadout/auxmedicus
	name = "Medicus (Surgeon)"
	neck = /obj/item/clothing/neck/apron/medicus
	gloves = /obj/item/clothing/gloves/f13/crudemedical
	belt = /obj/item/storage/belt/medical/legion
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/storage/firstaid/ancient = 1,
		/obj/item/stack/sticky_tape/surgical = 1,
		/obj/item/stack/medical/bone_gel = 1,
		/obj/item/book/granter/trait/midsurgery = 1,
		/obj/item/clothing/under/f13/legauxilia = 1,
		)


// LEGION SLAVES - Servant cook, and assist with medical, low surgery. Worker farm and mine.
// Both get Mars teachings to help out when normal work is done.

/datum/job/CaesarsLegion/slave
	title = "Legion Slave"
	flag = F13LEGIONSLAVE
	total_positions = 3
	spawn_positions = 3
	description = "A slave that survives the breaking camps is given a Legion appropriate name (latin-tribal inspired) and bull tattoo. Be obedient, respectful, stay inside the camp. Work the farm, mine, make food, clean and help injured men. Do NOT escape on your own, up to you how to handle it if forcibly freed by outside forces."
	supervisors = "Officers and Slavemaster first, then Auxilia, then warriors."
	display_order = JOB_DISPLAY_ORDER_LEGIONSLAVE
	exp_requirements = 120
	outfit = /datum/outfit/job/CaesarsLegion/slave

	loadout_options = list(
		/datum/outfit/loadout/slaveservant,
		/datum/outfit/loadout/slaveworker,
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion/slave,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion/slave,
		),
	)

/datum/outfit/job/CaesarsLegion/slave/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MARS_TEACH, src)

/datum/outfit/job/CaesarsLegion/slave
	name = "Legion Slave"
	jobtype = /datum/outfit/job/CaesarsLegion/slave
	id = /obj/item/card/id/legionbrand
	uniform = /obj/item/clothing/under/f13/legslavef
	neck = /obj/item/electropack/shockcollar
	shoes =	null
	l_pocket = /obj/item/radio


//Servants cook, clean, help with medical tasks.
/datum/outfit/loadout/slaveservant
	name = "Servant"
	head = /obj/item/clothing/head/f13/legion/servant
	uniform	= /obj/item/clothing/under/f13/campfollowermale
	gloves = /obj/item/clothing/gloves/f13/crudemedical
	shoes =	/obj/item/clothing/shoes/roman
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		/obj/item/reagent_containers/pill/patch/healpoultice = 2,
		/obj/item/smelling_salts/crafted = 1,
		/obj/item/book/granter/trait/lowsurgery = 1,
		/obj/item/reagent_containers/food/condiment/flour = 2,
		/obj/item/storage/box/bowls = 1,
		/obj/item/reagent_containers/glass/beaker/large = 1,
		/obj/item/soap/homemade = 1,
		/obj/item/lighter = 1,
		)

/datum/outfit/loadout/slaveservant/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == MALE)
		H.gender = FEMALE
		H.real_name = random_unique_name(FEMALE)
		H.name = H.real_name
		if(H.wear_id)
			var/obj/item/card/id/dogtag/L = H.wear_id
			L.registered_name = H.name
			L.update_label()

//Laborers farm and mine.
/datum/outfit/loadout/slaveworker
	name = "Worker"
	suit = /obj/item/clothing/suit/armor/f13/slavelabor
	uniform = /obj/item/clothing/under/f13/legslave
	shoes =	/obj/item/clothing/shoes/f13/rag
	r_hand = /obj/item/flashlight/flare/torch
	backpack_contents = list(
		/obj/item/storage/bag/plants = 1,
		/obj/item/reagent_containers/food/snacks/grown/ambrosia/deus = 1,
		/obj/item/cultivator = 1,
		/obj/item/soap/homemade = 1,
		/obj/item/shovel/spade = 1,
		)

/*
Post Scriptum
Plans: Add recipes/traits to keep refining support roles, Forgemaster close to done, just missing armor, others will need some minor tweaking. Planned is making the medicus more of a improvised surgery master, using primitive tools to good effect, because its interesting and unique.
Venator  - Zero slots, role built on cloning vet ranger, linear just vastly better than all but the Cent, snowflakey in command when it suits them, messes up the chain of command thats already messy for Legion.
*/
/datum/job/CaesarsLegion/Legionnaire/f13venator
	title = "Legion Venator"
	flag = F13VENATOR
	total_positions = 0
	spawn_positions = 0
	description = "You are the Venator -- the Hunter. With your powerful rifle and your many years of experience, you are a formidable killing machine, capable of taking down even the most formidable targets. Note that you are not a rank-and-file legionary, and you should not be operating as such -- your job is special operations, not fighting alongside the hordes of the Legion."
	supervisors = "the Centurion"
	selection_color = "#ffdddd"
	display_order = JOB_DISPLAY_ORDER_VENATOR
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13venator
	exp_requirements = 1500

/datum/outfit/job/CaesarsLegion/Legionnaire/f13venator/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_TRIBAL, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13venator
	name = "Legion Venator"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13explorer
	id = /obj/item/card/id/dogtag/legvenator
	suit = /obj/item/clothing/suit/armor/f13/legion/venator
	head = /obj/item/clothing/head/helmet/f13/legion/venator
	mask = /obj/item/clothing/mask/bandana/legion/legdecan
	neck = /obj/item/storage/belt/holster
	glasses = /obj/item/clothing/glasses/night
	ears = /obj/item/radio/headset/headset_legion
	r_pocket = /obj/item/binoculars
	suit_store = /obj/item/gun/ballistic/automatic/marksman/sniper
	backpack_contents = list(
		/obj/item/ammo_box/magazine/w308 = 3,
		/obj/item/melee/onehanded/machete/gladius = 1,
		/obj/item/reagent_containers/pill/patch/healpoultice = 1,
		/obj/item/gun/ballistic/revolver/revolver45 = 1,
		/obj/item/ammo_box/c45rev = 3,
		)

// Legion Citizen
// Really only used for ID console
/datum/job/ncr/f13legioncitizen
	title = "Legion Citizen"
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13legioncitizen

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legioncitizen
	name = "Legion Citizen (Role)"
	uniform = /obj/item/clothing/under/f13/doctor
	shoes = /obj/item/clothing/shoes/f13/fancy
	suit = /obj/item/clothing/suit/curator
	head = /obj/item/clothing/head/scarecrow_hat
	gloves = /obj/item/clothing/gloves/color/black
	glasses = /obj/item/clothing/glasses/welding
	id = /obj/item/card/id/dogtag/town/legion
	l_hand = /obj/item/shield/riot/buckler
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/spatha = 1,
		)
