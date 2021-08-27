/datum/job/wasteland
	department_flag = WASTELAND

/datum/job/wasteland/enclavespy
	title = "Enclave Private"
	flag = F13USPRIVATE
	faction = "Enclave"
	total_positions = 0
	spawn_positions = 0
	description = "You are an undercover operative for the remnants of the Enclave. You are to remain concealed and attempt to present the Enclave in a positive light to the population of the wasteland unless overt action is absolutely necessary."
	forbids = ""
	enforces = ""
	supervisors = "the United States Government."
	selection_color = "#323232"
	exp_type = EXP_TYPE_FALLOUT
	exp_requirements = 1200

	access = list(ACCESS_ENCLAVE)
	minimal_access = list(ACCESS_ENCLAVE)

	outfit = /datum/outfit/job/wasteland/enclavespy

/datum/outfit/job/wasteland/enclavespy
	name = "Enclave Private"
	jobtype = /datum/job/wasteland/enclavespy
	backpack = /obj/item/storage/backpack/satchel/leather
	head = 			/obj/item/clothing/head/helmet/f13/combat/enclave
	ears = 			/obj/item/radio/headset/headset_enclave
	glasses = 		/obj/item/clothing/glasses/night
	uniform =		/obj/item/clothing/under/f13/navy
	suit = 			/obj/item/clothing/suit/armor/f13/combat/enclave
	belt = 			/obj/item/storage/belt/military/army
	shoes = 		/obj/item/clothing/shoes/combat/swat
	id = 			/obj/item/card/id/dogtag/enclave
	suit_store =  	/obj/item/gun/ballistic/automatic/assault_carbine

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/flashbang = 1,
		/obj/item/pda = 1,
		/obj/item/ammo_box/magazine/m556/rifle/extended = 2,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1
		)

/datum/job/wasteland/enclavesgt
	title = "Enclave Sergeant"
	flag = F13USSGT
	faction = "Enclave"
	total_positions = 0
	spawn_positions = 0
	description = "You are in charge of the recruiting for the remnants of the Enclave. You are to recruit all those interested to your cause."
	forbids = "You are not allowed to have friendly interactions with those outside of the Enclave."
	enforces = "You must maintain the secrecy of organization."
	supervisors = "the United States Government."
	selection_color = "#323232"
	exp_requirements = 2400
	exp_type = EXP_TYPE_FALLOUT
	access = list(ACCESS_ENCLAVE)
	minimal_access = list(ACCESS_ENCLAVE)

	outfit = /datum/outfit/job/wasteland/enclavesgt

/datum/outfit/job/wasteland/enclavesgt
	name = "Enclave Sergeant"
	jobtype = /datum/job/wasteland/enclavesgt
	backpack = /obj/item/storage/backpack/satchel/enclave
	ears = 			/obj/item/radio/headset/headset_enclave
	glasses = 		/obj/item/clothing/glasses/night
	uniform =		/obj/item/clothing/under/f13/enclave/peacekeeper
	accessory =     /obj/item/clothing/accessory/ncr/SGT
	belt = 			/obj/item/storage/belt/military/assault/enclave
	shoes = 		/obj/item/clothing/shoes/f13/enclave/serviceboots
	gloves = 		/obj/item/clothing/gloves/combat
	id = 			/obj/item/card/id/dogtag/enclave

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak=2,
		/obj/item/grenade/flashbang=1,
		/obj/item/pda=1,
		/obj/item/storage/bag/money/small/wastelander=1,
		/obj/item/melee/onehanded/knife/survival=1,
		/obj/item/clothing/head/helmet/f13/helmet/enclave/peacekeeper=1
		)

/datum/outfit/job/wasteland/enclavesgt/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)

/datum/job/wasteland/enclavesci
	title = "Enclave Scientist"
	flag = F13USSCIENTIST
	faction = "Enclave"
	total_positions = 0
	spawn_positions = 0
	description = "You're responsible for the maintenance of the base, the knowledge you've accumulated over the years is the only thing keeping the remnants alive. You've dabbled in enough to be considered a Professor in proficiency, but they call you Doctor. Support your dwindling forces and listen to the Lieutenant."
	forbids = "The Enclave forbids you from leaving the base alone while it is still habitable."
	enforces = "You must maintain the secrecy of organization."
	supervisors = "the United States Government."
	selection_color = "#323232"
	exp_requirements = 2800
	exp_type = EXP_TYPE_FALLOUT
	access = list(ACCESS_ENCLAVE)
	minimal_access = list(ACCESS_ENCLAVE)

	outfit = /datum/outfit/job/wasteland/enclavesci

/datum/outfit/job/wasteland/enclavesci
	name = "Enclave Scientist"
	jobtype = /datum/job/wasteland/enclavesci
	backpack = /obj/item/storage/backpack/satchel/enclave
	head = 			/obj/item/clothing/head/helmet/f13/envirosuit
	ears = 			/obj/item/radio/headset/headset_enclave
	glasses = 		/obj/item/clothing/glasses/night
	mask =			/obj/item/clothing/mask/breath/medical
	gloves = 		/obj/item/clothing/gloves/color/latex/nitrile
	uniform =		/obj/item/clothing/under/f13/enclave/science
	suit = 			/obj/item/clothing/suit/armor/f13/environmentalsuit
	belt = 			/obj/item/storage/belt/medical
	shoes = 		/obj/item/clothing/shoes/f13/enclave/serviceboots
	id = 			/obj/item/card/id/dogtag/enclave
	suit_store =  	/obj/item/tank/internals/oxygen

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak=2,
		/obj/item/grenade/chem_grenade/cleaner=1,
		/obj/item/pda=1,
		/obj/item/gun/energy/laser/ultra_pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=2,
		/obj/item/storage/bag/money/small/wastelander=1,
		/obj/item/melee/onehanded/knife/survival=1,
		/obj/item/clothing/head/helmet/f13/helmet/enclave/science=1
		)

/datum/outfit/job/wasteland/enclavesci/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)
	ADD_TRAIT(H, TRAIT_CYBERNETICIST_EXPERT, src)
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_UNETHICAL_PRACTITIONER, src) // Brainwashing


/datum/job/wasteland/enclavelt
	title = "Enclave Lieutenant"
	flag = F13USLT
	faction = "Enclave"
	total_positions = 0
	spawn_positions = 0
	description = "You are the Lieutenant in charge of commanding the remnants of the Enclave forces in the area. You are to recruit all those interested to your cause."
	forbids = "You are not allowed to have friendly interactions with those outside of the Enclave."
	enforces = "You must maintain the secrecy of organization."
	supervisors = "the United States Government."
	selection_color = "#323232"
	exp_requirements = 1500
	exp_type = EXP_TYPE_ENCLAVE

	access = list(ACCESS_ENCLAVE)
	minimal_access = list(ACCESS_ENCLAVE)

	outfit = /datum/outfit/job/wasteland/enclavelt

/datum/outfit/job/wasteland/enclavelt
	name = "Enclave Lieutenant"
	jobtype = /datum/job/wasteland/enclavelt
	backpack = /obj/item/storage/backpack/satchel/enclave
	head = /obj/item/clothing/head/helmet/f13/helmet/enclave/officer
	ears = /obj/item/radio/headset/headset_enclave
	glasses = /obj/item/clothing/glasses/night
	mask = /obj/item/clothing/mask/gas/enclave
	uniform = /obj/item/clothing/under/f13/enclave/officer
	accessory = /obj/item/clothing/accessory/ncr/LT1
	belt = /obj/item/storage/belt/military/assault/enclave
	shoes = /obj/item/clothing/shoes/f13/enclave/serviceboots
	gloves = /obj/item/clothing/gloves/combat
	id = /obj/item/card/id/dogtag/enclave

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak/super = 2,
		/obj/item/grenade/flashbang = 1,
		/obj/item/pda = 1,
		/obj/item/stock_parts/cell/ammo/ec = 3,
		/obj/item/gun/energy/laser/plasma/glock/extended = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		)

/datum/outfit/job/wasteland/enclavelt/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)

/datum/outfit/job/wasteland/enclavelt/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

/*
Great Khan
*/

/datum/job/wasteland/f13pusher
	title = "Great Khan"
	flag = F13USPRIVATE
	department_head = list("Captain")
	head_announce = list("Security")
	faction = "Wastelander"
	total_positions = 6
	spawn_positions = 6
	description = "You are no common raider or tribal settler, for you are a Great Khan. Your ancestry is that of fierce warriors and noble chieftans, whose rites and sagas tell of blood soaked battlefields and great sacrifice for your tribe. At least, this was once the case: after the massacre at Bitter Springs by the NCR, your people have lost much of their strength - now you and many other Khans travel west of Vegas through Red Rock Canyon in the hopes of settling in the region of Yuma."
	supervisors = "your gang leadership"
	selection_color = "#ff915e"

	outfit = /datum/outfit/job/wasteland/f13pusher

	access = list(ACCESS_KHAN)
	minimal_access = list(ACCESS_KHAN)

	loadout_options = list(
		/datum/outfit/loadout/enforcer,
		/datum/outfit/loadout/brawler,
		)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/wasteland/f13raider,
			/datum/job/wasteland/f13pusher,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/wasteland/f13raider,
			/datum/job/wasteland/f13pusher,
		),
	)

/datum/outfit/job/wasteland/f13pusher
	name = "Great Khan"
	jobtype = /datum/job/wasteland/f13pusher
	suit = /obj/item/clothing/suit/toggle/labcoat/f13/khan_jacket
	suit_store = /obj/item/gun/ballistic/automatic/pistol/ninemil
	id = /obj/item/card/id/khantattoo
	ears = /obj/item/radio/headset
	belt = /obj/item/melee/onehanded/machete
	backpack =	/obj/item/storage/backpack/satchel/explorer
	satchel = 	/obj/item/storage/backpack/satchel/explorer
	uniform = /obj/item/clothing/under/f13/khan
	r_hand = /obj/item/book/granter/trait/selection
	r_pocket = /obj/item/flashlight/flare
	l_pocket = /obj/item/storage/bag/money/small/khan
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 1,
		/obj/item/reagent_containers/pill/patch/jet = 2,
		/obj/item/reagent_containers/syringe/medx = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		)
	head = /obj/item/clothing/head/helmet/f13/khan
	shoes = /obj/item/clothing/shoes/f13/military/plated


/datum/outfit/job/wasteland/f13pusher/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	if(!H.gang)
		var/datum/gang/greatkhans/GK = GLOB.greatkhans
		GLOB.all_gangs |= GK
		GK.add_member(H)
		H.gang = GK

/datum/outfit/loadout/pusher
	name = "Chemist"
	backpack_contents = list(
		/obj/item/reagent_containers/glass/beaker/large=2, \
		/obj/item/book/granter/trait/chemistry=1)

/datum/outfit/loadout/enforcer
	name = "Enforcer"
	suit_store = /obj/item/gun/ballistic/revolver/caravan_shotgun
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck=1, \
		/obj/item/ammo_box/shotgun/bean=1, \
		/obj/item/restraints/legcuffs/bola/tactical=1, \
		/obj/item/restraints/handcuffs=2)

/datum/outfit/loadout/brawler
name = "Brawler"
gloves = /obj/item/melee/unarmed/brass/spiked
backpack_contents = list(
		/obj/item/twohanded/baseball/spiked=1, \
		/obj/item/reagent_containers/pill/patch/healpoultice=2)

/*
Raider
*/

/datum/job/wasteland/f13raider
	title = "Outlaw"
	flag = F13RAIDER
	department_head = list("Captain")
	head_announce = list("Security")
	faction = "Wastelander"
	social_faction = "Raiders"
	total_positions = 12
	spawn_positions = 12
	description = "You are an undesirable figure of some kind- perhaps a corrupt official, or a cannibalistic bartender, or a devious conman, to name a few examples. You have more freedom than anyone else in the wastes, and are not bound by the same moral code as others, but though you may only be interested in self-gain, you still have a responsibility to make your time here interesting, fun, and engaging for others- this means that whatever path you pursue should be more nuanced and flavorful than simple highway robbery or slavery. (Adminhelp if you require help setting up your character for the round.)"
	supervisors = "Your desire to make things interesting and fun"
	selection_color = "#ff4747"
	exp_requirements = 600
	exp_type = EXP_TYPE_WASTELAND

	outfit = /datum/outfit/job/wasteland/f13raider

	access = list()
	minimal_access = list()
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/wasteland/f13pusher,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/wasteland/f13pusher,
		),
		/datum/matchmaking_pref/patron = list(
			/datum/job/wasteland/f13raider,
		),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/wasteland/f13raider,
		),
		/datum/matchmaking_pref/outlaw = list(
			/datum/job/wasteland/f13raider,
		),
		/datum/matchmaking_pref/bounty_hunter = list(
			/datum/job/wasteland/f13raider,
		),
	)
	loadout_options = list(
	/datum/outfit/loadout/raider_supafly,
	/datum/outfit/loadout/raider_yankee,
	/datum/outfit/loadout/raider_blast,
	/datum/outfit/loadout/raider_sadist,
	/datum/outfit/loadout/raider_painspike,
	/datum/outfit/loadout/raider_badlands,
	/datum/outfit/loadout/raider_sheriff,
	/datum/outfit/loadout/raider_mafia,
	/datum/outfit/loadout/raider_vault,
	/datum/outfit/loadout/raider_ncr,
	/datum/outfit/loadout/raider_legion,
	/datum/outfit/loadout/raider_tribal,
	)


/datum/outfit/job/wasteland/f13raider
	name = "Outlaw"
	jobtype = /datum/job/wasteland/f13raider

	id = null
	ears = null
	belt = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	r_hand = /obj/item/book/granter/trait/selection
	gloves = /obj/item/clothing/gloves/f13/handwraps
	r_pocket = /obj/item/flashlight/flare
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 2,
		/obj/item/melee/onehanded/club = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/storage/bag/money/small/raider = 1,
		)


/datum/outfit/job/wasteland/f13raider/pre_equip(mob/living/carbon/human/H)
	. = ..()
	uniform = pick(
		/obj/item/clothing/under/f13/merca, \
		/obj/item/clothing/under/f13/mercc, \
		/obj/item/clothing/under/f13/cowboyb, \
		/obj/item/clothing/under/f13/cowboyg, \
		/obj/item/clothing/under/f13/raider_leather, \
		/obj/item/clothing/under/f13/raiderrags, \
		/obj/item/clothing/under/pants/f13/ghoul, \
		/obj/item/clothing/under/jabroni)
	suit = pick(
		/obj/item/clothing/suit/armor/f13/raider/supafly,\
		/obj/item/clothing/suit/armor/f13/raider/yankee, \
		/obj/item/clothing/suit/armor/f13/raider/sadist, \
		/obj/item/clothing/suit/armor/f13/raider/blastmaster, \
		/obj/item/clothing/suit/armor/f13/raider/badlands, \
		/obj/item/clothing/suit/armor/f13/raider/painspike)
	if(prob(10))
		mask = pick(
			/obj/item/clothing/mask/bandana/red,\
			/obj/item/clothing/mask/bandana/blue,\
			/obj/item/clothing/mask/bandana/green,\
			/obj/item/clothing/mask/bandana/gold,\
			/obj/item/clothing/mask/bandana/black,\
			/obj/item/clothing/mask/bandana/skull)
	head = pick(
		/obj/item/clothing/head/sombrero,\
		/obj/item/clothing/head/helmet/f13/raider,\
		/obj/item/clothing/head/helmet/f13/raider/eyebot,\
		/obj/item/clothing/head/helmet/f13/raider/arclight,\
		/obj/item/clothing/head/helmet/f13/raider/blastmaster,\
		/obj/item/clothing/head/helmet/f13/raider/yankee,\
		/obj/item/clothing/head/helmet/f13/raider/psychotic,\
		/obj/item/clothing/head/helmet/f13/fiend)
	shoes = pick(
			/obj/item/clothing/shoes/jackboots,\
			/obj/item/clothing/shoes/f13/raidertreads)

	suit_store = pick(
		/obj/item/gun/ballistic/revolver/detective, \
		/obj/item/gun/ballistic/rifle/hunting, \
		/obj/item/gun/ballistic/automatic/hobo/zipgun, \
		/obj/item/gun/ballistic/revolver/hobo/pepperbox, \
		/obj/item/gun/ballistic/revolver/caravan_shotgun, \
		/obj/item/gun/ballistic/revolver/single_shotgun)


/datum/outfit/job/wasteland/f13raider/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	H.social_faction = "Raiders"
	add_verb(H, /mob/living/proc/creategang)

/datum/outfit/loadout/raider_supafly
	name = "Supa-fly"
	suit = /obj/item/clothing/suit/armor/f13/raider/supafly
	head = /obj/item/clothing/head/helmet/f13/raider/supafly
	backpack_contents = list(
		/obj/item/ammo_box/magazine/autopipe = 3,
		/obj/item/melee/onehanded/knife/hunting = 1,
		/obj/item/storage/box/dice = 1,
		/obj/item/storage/fancy/cigarettes/cigpack_cannabis = 1,
		)

/datum/outfit/loadout/raider_yankee
	name = "Yankee"
	suit = /obj/item/clothing/suit/armor/f13/raider/yankee
	head = /obj/item/clothing/head/helmet/f13/raider/yankee
	backpack_contents = list(
		/obj/item/twohanded/baseball/spiked=1,
		/obj/item/gun/ballistic/rifle/mosin=1,
		/obj/item/ammo_box/a762=2,
		/obj/item/storage/fancy/cigarettes/cigpack_cannabis=1,
		/obj/item/megaphone=1)

/datum/outfit/loadout/raider_blast
	name = "Blastmaster"
	suit = /obj/item/clothing/suit/armor/f13/raider/blastmaster
	head = /obj/item/clothing/head/helmet/f13/raider/blastmaster
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/single_shotgun=1,
		/obj/item/ammo_box/shotgun/bean,
		/obj/item/kitchen/knife/butcher = 1,
		/obj/item/grenade/homemade/firebomb = 6,
		)

/datum/outfit/loadout/raider_sadist
	name = "Sadist"
	suit = /obj/item/clothing/suit/armor/f13/raider/sadist
	head = /obj/item/clothing/head/helmet/f13/raider/arclight
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/colt357 = 1,
		/obj/item/clothing/mask/gas/explorer/folded=1,
		/obj/item/storage/belt/tribe_quiver = 1,
		/obj/item/twohanded/spear = 1)

/datum/outfit/loadout/raider_badlands
	name = "Badlands"
	suit = /obj/item/clothing/suit/armor/f13/raider/badlands
	head = /obj/item/clothing/head/helmet/f13/fiend
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/pistol22 = 1,
		/obj/item/ammo_box/magazine/m22,
		/obj/item/reagent_containers/hypospray/medipen/psycho=1,
		/obj/item/reagent_containers/pill/patch/turbo=1)

/datum/outfit/loadout/raider_painspike
	name = "Painspike"
	suit = /obj/item/clothing/suit/armor/f13/raider/painspike
	head = /obj/item/clothing/head/helmet/f13/raider/psychotic
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 1,
		/obj/item/ammo_box/shotgun/bean = 1,
		/obj/item/melee/onehanded/club/tireiron = 1,
		/obj/item/melee/onehanded/club/fryingpan = 1,
		/obj/item/grenade/chem_grenade/cleaner = 1,
		)


/datum/outfit/loadout/raider_ncr
	name = "NCR Deserter"
	suit = /obj/item/clothing/suit/armor/f13/exile/ncrexile
	uniform = /obj/item/clothing/under/f13/exile
	id = /obj/item/card/id/rusted
	backpack_contents = list(
		/obj/item/gun/ballistic/rifle/mosin=1,
		/obj/item/ammo_box/a762=2)

/datum/outfit/loadout/raider_legion
	name = "Exiled Legionnaire"
	suit = /obj/item/clothing/suit/armor/f13/exile/legexile
	uniform = /obj/item/clothing/under/f13/exile/legion
	id = /obj/item/card/id/rusted/rustedmedallion
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/gladius = 1,
		/obj/item/storage/backpack/spearquiver = 1,
		)

/datum/outfit/loadout/raider_sheriff
	name = "Desperado"
	suit = /obj/item/clothing/suit/armor/vest/leather
	uniform = /obj/item/clothing/under/syndicate/tacticool
	head = /obj/item/clothing/head/helmet/f13/brahmincowboyhat
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/colt357=1,
		/obj/item/ammo_box/a357=1)

/datum/outfit/loadout/raider_mafia
	name = "Town Mafia"
	suit = /obj/item/clothing/suit/armor/f13/leather_jacket
	uniform = /obj/item/clothing/under/f13/bennys
	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/f13/fancy
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/ninemil=1,
		/obj/item/ammo_box/magazine/m9mm=2,
		/obj/item/card/id/dogtag/town/mafia=1,
		/obj/item/toy/cards/deck=1)

/datum/outfit/loadout/raider_vault
	name = "Vault Renegade"
	suit = /obj/item/clothing/suit/armor/f13/leather_jacket/combat
	uniform = /obj/item/clothing/under/f13/exile/vault
	id = /obj/item/card/id/rusted/fadedvaultid
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/n99 = 1,
		/obj/item/ammo_box/magazine/m10mm_adv = 2,
		)

/datum/outfit/loadout/raider_tribal
	name = "Tribal Outcast"
	uniform = /obj/item/clothing/under/f13/exile/tribal
	suit = /obj/item/clothing/suit/hooded/tribaloutcast
	suit_store = /obj/item/melee/onehanded/club/warclub
	shoes = /obj/item/clothing/shoes/sandal
	belt = /obj/item/storage/backpack/spearquiver
	box = /obj/item/storage/survivalkit_tribal
	id = /obj/item/card/id/outcasttattoo
	back = /obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/clothing/mask/cigarette/pipe = 1,
		/obj/item/melee/onehanded/knife/bone = 1,
		)


/datum/job/wasteland/f13wastelander
	title = "Wastelander"
	flag = F13WASTELANDER
	faction = "Wastelander"
	total_positions = -1
	spawn_positions = -1
	description = "You arrive in Yuma Valley, hoping to escape your past, the war, or perhaps something worse. But you’ve seen the torchlight and heard the bark of the military officers. You haven’t escaped anything. Try to survive, establish your own settlement, make your own legend. Suffer well and die gladly."
	supervisors = "God"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/wasteland/f13wastelander

	access = list()		//we can expand on this and make alterations as people suggest different loadouts
	minimal_access = list()
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/wasteland/f13wastelander,
			/datum/job/wasteland/f13detective,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/wasteland/f13wastelander,
			/datum/job/wasteland/f13detective,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/wasteland/f13wastelander,
			/datum/job/wasteland/f13detective,
		),
		/datum/matchmaking_pref/patron = list(
			/datum/job/wasteland/f13wastelander,
			/datum/job/wasteland/f13mobboss,
		),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/wasteland/f13wastelander,
		),
	)
	loadout_options = list(
	/datum/outfit/loadout/vault_refugee,
	/datum/outfit/loadout/salvager,
	/datum/outfit/loadout/medic,
	/datum/outfit/loadout/merchant,
	/datum/outfit/loadout/scavenger,
	/datum/outfit/loadout/settler,
	/datum/outfit/loadout/warrior,
	/datum/outfit/loadout/ncrcitizen,
	/datum/outfit/loadout/wastelander_desert_ranger)

/datum/outfit/job/wasteland/f13wastelander
	name = "Wastelander"
	jobtype = /datum/job/wasteland/f13wastelander

	id = null
	ears = null
	belt = null
	r_hand = /obj/item/book/granter/trait/selection
	l_pocket = /obj/item/storage/bag/money/small/wastelander
	r_pocket = /obj/item/flashlight/flare
	belt = /obj/item/melee/onehanded/knife/survival
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak,
		/obj/item/reagent_containers/hypospray/medipen/stimpak,
		/obj/item/reagent_containers/pill/radx,
		)

/datum/outfit/job/wasteland/f13wastelander/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/settler, \
		/obj/item/clothing/under/f13/brahminm, \
		/obj/item/clothing/under/f13/lumberjack, \
		/obj/item/clothing/under/f13/roving)
	suit = pick(
		/obj/item/clothing/suit/armor/f13/kit, \
		/obj/item/clothing/suit/f13/veteran, \
		/obj/item/clothing/suit/toggle/labcoat/f13/wanderer)

/datum/outfit/loadout/salvager
	name = "Salvager"
	uniform = /obj/item/clothing/under/f13/machinist
	shoes = /obj/item/clothing/shoes/f13/explorer
	gloves = /obj/item/clothing/gloves/f13/blacksmith
	head = /obj/item/clothing/head/welding
	r_hand = /obj/item/weldingtool/largetank
	backpack_contents = list(/obj/item/gun/ballistic/automatic/pistol/m1911/compact=1)

/datum/outfit/loadout/scavenger
	name = "Scavenger"
	shoes = /obj/item/clothing/shoes/f13/explorer
	r_hand = /obj/item/storage/backpack/duffelbag/scavengers
	l_hand = /obj/item/pickaxe/drill
	belt = /obj/item/storage/belt
	backpack_contents = list(/obj/item/mining_scanner=1,
							/obj/item/metaldetector=1,
							/obj/item/shovel=1,
							/obj/item/gun/ballistic/automatic/pistol/m1911/compact=1)

/datum/outfit/loadout/settler
	name = "Settler"
	uniform = /obj/item/clothing/under/f13/settler
	shoes = /obj/item/clothing/shoes/f13/explorer
	r_hand = /obj/item/hatchet
	l_hand = /obj/item/gun/ballistic/automatic/pistol/n99
	belt = /obj/item/storage/belt
	backpack_contents = list(
		/obj/item/stack/sheet/metal = 50,
		/obj/item/stack/sheet/mineral/wood = 50,
		/obj/item/pickaxe/mini = 1,
		/obj/item/toy/crayon/spraycan = 1,
		/obj/item/cultivator = 1,
		/obj/item/reagent_containers/glass/bucket = 1,
		/obj/item/storage/bag/plants/portaseeder = 1,
		)

/datum/outfit/loadout/medic
	name = "Wasteland Doctor"
	uniform = /obj/item/clothing/under/f13/follower
	suit = /obj/item/clothing/suit/toggle/labcoat/f13/followers
	shoes = /obj/item/clothing/shoes/f13/explorer
	gloves = /obj/item/clothing/gloves/color/latex
	neck = /obj/item/bedsheet/medical
	backpack_contents =  list(/obj/item/reagent_containers/medspray/synthflesh=2,
							/obj/item/stack/medical/suture/emergency/fifteen=1,
							/obj/item/stack/medical/ointment/twelve=1,
							/obj/item/smelling_salts/crafted=1,
							/obj/item/healthanalyzer=1,
							/obj/item/stack/sheet/mineral/silver=1,
							/obj/item/gun/ballistic/automatic/pistol/m1911/compact=1,
							/obj/item/lighter=1,
							/obj/item/screwdriver=1,
							/obj/item/wirecutters=1,
							/obj/item/hatchet=1
		)

/datum/outfit/loadout/merchant
	name = "Roving Trader"
	uniform = /obj/item/clothing/under/f13/merchant
	neck = /obj/item/clothing/neck/mantle/brown
	shoes = /obj/item/clothing/shoes/f13/brownie
	head = /obj/item/clothing/head/f13/stormchaser
	gloves = /obj/item/clothing/gloves/color/brown
	glasses = /obj/item/clothing/glasses/f13/biker
	l_hand = /obj/item/gun/ballistic/revolver/caravan_shotgun
	backpack_contents =  list(/obj/item/storage/box/vendingmachine=1,
							/obj/item/stack/f13Cash/caps/threefivezero=1,
							/obj/item/gun/ballistic/automatic/pistol/m1911/compact=1)

//end new

/datum/outfit/loadout/vault_refugee
	name = "Vaultie"
	uniform = /obj/item/clothing/under/f13/vault
	gloves = /obj/item/pda
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/fingerless
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/n99=1,
		/obj/item/ammo_box/magazine/m10mm_adv/simple=2)

/datum/outfit/loadout/warrior
	name = "Wasteland Warrior"
	uniform = /obj/item/clothing/under/f13/settler
	shoes = /obj/item/clothing/shoes/f13/raidertreads
	suit = /obj/item/clothing/suit/armor/light/wastewar
	head = /obj/item/clothing/head/helmet/f13/wastewarhat
	glasses = /obj/item/clothing/glasses/welding
	l_hand = /obj/item/shield/riot/buckler/stop
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/scrapsabre = 1,
		)

/datum/outfit/loadout/ncrcitizen
	name = "NCR Citizen"
	uniform = /obj/item/clothing/under/f13/ncrcaravan
	shoes = /obj/item/clothing/shoes/f13/tan
	head = /obj/item/clothing/head/f13/cowboy
	gloves = /obj/item/clothing/gloves/color/brown
	id = /obj/item/card/id/dogtag/town/ncr
	l_hand = /obj/item/gun/ballistic/rifle/mag/varmint
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle=2)

/datum/outfit/loadout/wastelander_desert_ranger
	name = "Desert Ranger Scout"
	uniform = /obj/item/clothing/under/f13/desert_ranger_scout
	shoes = /obj/item/clothing/shoes/f13/cowboy
	head = /obj/item/clothing/head/f13/cowboy
	gloves = /obj/item/clothing/gloves/color/brown
	l_hand = /obj/item/gun/ballistic/revolver/colt357
	backpack_contents = list(
		/obj/item/ammo_box/a357=2,
		/obj/item/binoculars=1,
		/obj/item/radio=1)

/datum/job/wasteland/f13enforcer
	name = "Den Mob Enforcer"
	flag = F13ENFORCER
	faction = "Wastelander"
	social_faction = "Raiders"
	total_positions = 6
	spawn_positions = 6
	description = "The mob rules in Yuma. A hitman for the Den's Boss, you are a highly loyal enforcer charged with keeping order among the outlaw groups inhabiting the Den."
	supervisors = "The Boss."
	selection_color = "#ff4747"
	exp_requirements = 600
	exp_type = EXP_TYPE_OUTLAW

	outfit = /datum/outfit/job/wasteland/f13enforcer

	access = list(ACCESS_DEN)
	minimal_access = list(ACCESS_DEN)

	loadout_options = list(
		/datum/outfit/loadout/hitman,
		/datum/outfit/loadout/bodyguard,
		/datum/outfit/loadout/ronin,
		/datum/outfit/loadout/ashigari,
		/datum/outfit/loadout/soldat,
        /datum/outfit/loadout/soldatscouter,
		/datum/outfit/loadout/sovietmedic,
		/datum/outfit/loadout/colombianhitman,
		/datum/outfit/loadout/narcos,
		/datum/outfit/loadout/shotgunner
		)


/datum/outfit/job/wasteland/f13enforcer
	name = "Den Mob Enforcer"
	jobtype = /datum/job/wasteland/f13enforcer

	id = /obj/item/card/id/dentattoo
	belt = /obj/item/storage/belt/military/assault
	shoes = /obj/item/clothing/shoes/laceup
	ears = /obj/item/radio/headset/headset_den
	l_pocket = /obj/item/melee/onehanded/knife/switchblade
	r_pocket = /obj/item/flashlight/seclite
	uniform = /obj/item/clothing/under/suit/white
	backpack =	/obj/item/storage/backpack/satchel
	satchel =  /obj/item/storage/backpack/satchel
	gloves =  /obj/item/clothing/gloves/color/white
	head = /obj/item/clothing/head/beret/durathread
	mask =  /obj/item/clothing/mask/bandana/durathread
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/restraints/handcuffs=1, \
		/obj/item/storage/bag/money/small/wastelander)

/datum/outfit/job/wasteland/f13enforcer/pre_equip(mob/living/carbon/human/H)
	..()
	r_hand = /obj/item/book/granter/trait/selection

/datum/outfit/job/wasteland/f13enforcer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	if(!H.gang)
		var/datum/gang/denmob/DM = GLOB.denmob
		GLOB.all_gangs |= DM
		DM.add_member(H)
		H.gang = DM

/datum/outfit/loadout/ronin
	name = "Ronin"
	r_hand = /obj/item/katana
	suit = /obj/item/clothing/suit/armor/f13/combat/swat
	shoes = /obj/item/clothing/shoes/laceup
	belt = /obj/item/storage/belt/military/assault
	ears = /obj/item/radio/headset/headset_den
	id = /obj/item/card/id/dentattoo
	backpack_contents = list(
						 /obj/item/gun/ballistic/automatic/smg/mp5,
						)


/datum/outfit/loadout/ashigari
	name = "Ashigari"
	r_hand = /obj/item/twohanded/spear
	suit = /obj/item/clothing/suit/armor/f13/combat/dark
	shoes = /obj/item/clothing/shoes/laceup
	belt = /obj/item/storage/belt/military/assault
	backpack =	/obj/item/storage/backpack/satchel
	ears = /obj/item/radio/headset/headset_den
	id = /obj/item/card/id/dentattoo
	backpack_contents = list(
    /obj/item/clothing/suit/jacket/leather,
	/obj/item/clothing/neck/mantle/poncho,
    /obj/item/clothing/shoes/roman
	)

/datum/outfit/loadout/soldat
	name = "Soldat"
	r_hand = /obj/item/gun/ballistic/rifle/mosin
	suit = /obj/item/clothing/suit/armor/vest
	shoes = /obj/item/clothing/shoes/laceup
	belt = /obj/item/storage/belt/military/assault
	backpack =	/obj/item/storage/backpack/satchel
	ears = /obj/item/radio/headset/headset_den
	id = /obj/item/card/id/dentattoo
	backpack_contents = list(
		/obj/item/clothing/under/suit_jacket/charcoal,
		/obj/item/clothing/neck/mantle/brown,
		/obj/item/clothing/head/mask/black,
	)

/datum/outfit/loadout/soldatscouter
name = "Scouter"
r_hand = /obj/item/gun/ballistic/automatic/smg/rockwell
suit = /obj/item/clothing/under/soviet
shoes = /obj/item/clothing/shoes/laceup
belt = /obj/item/storage/belt/military/assault
backpack =	/obj/item/storage/backpack/satchel
ears = /obj/item/radio/headset/headset_den
backpack_contents = list(
	/obj/item/ammo_box/magazine/uzim9mm/rockwell/,
	
)


/datum/outfit/loadout/sovietmedic
name = "Soviet Medic"
r_hand = /obj/item/gun/ballistic/revolver/colt6520
suit = /obj/item/clothing/suit/jacket/puffer/vest
shoes = /obj/item/clothing/shoes/laceup
belt = /obj/item/storage/belt/military/assault
backpack =	/obj/item/storage/backpack/satchel
ears = /obj/item/radio/headset/headset_den
id = /obj/item/card/id/dentattoo
backpack_contents = list(
	/obj/item/ammo_box/l10mm,
	/obj/item/clothing/head/ushanka,
	/obj/item/clothing/shoes/laceup,
	/obj/item/clothing/head/mask)



/datum/outfit/loadout/colombianhitman
name = "colombian Hitman"
r_hand = /obj/item/gun/ballistic/automatic/pistol/beretta
suit = /obj/item/clothing/suit/armor/vest
shoes = /obj/item/clothing/shoes/laceup
belt = /obj/item/storage/belt/military/assault
backpack =	/obj/item/storage/backpack/satchel
ears = /obj/item/radio/headset/headset_den
id = /obj/item/card/id/dentattoo
backpack_contents = list(
		/obj/item/ammo_box/magazine/m9mmds,
		/obj/item/clothing/head/flatcap,
		/obj/item/clothing/under/overalls)
        
		
/datum/outfit/loadout/narcos
name = "infantry"
r_hand = /obj/item/gun/ballistic/automatic/service
suit = /obj/item/clothing/suit/armor/f13/leather_jacket/combat/riotpolice
shoes = /obj/item/clothing/shoes/laceup
belt = /obj/item/storage/belt/military/assault
ears = /obj/item/radio/headset/headset_den
id = /obj/item/card/id/dentattoo
	backpack_contents = list(
		/obj/item/clothing/head/helmet/alt)


		
/datum/outfit/loadout/shotgunner
name = "CQC"
r_hand = /obj/item/gun/ballistic/shotgun/trench
suit =	/obj/item/clothing/suit/armor/f13/combat
shoes = /obj/item/clothing/shoes/laceup
belt = /obj/item/storage/belt/military/assault
backpack =	/obj/item/storage/backpack/satchel
ears = /obj/item/radio/headset/headset_den
id = /obj/item/card/id/dentattoo
backpack_contents = list(
		/obj/item/clothing/under/suit_jacket/navy,
		)

		
						
	



/datum/job/wasteland/f13mobboss
	title = "Den Mob Boss"
	flag = F13MOBBOSS
	faction = "Wastelander"
	social_faction = "Raiders"
	total_positions = 1
	spawn_positions = 1
	description = "The mob rules in Yuma, and you're on top. Keeping the loose association of Khans, outlaws, and other no-goods together you maintain order in The Den by force. Ensure that all inhabitants of the Den obey their rules, and spread your influence over the wasteland. Be careful though - even your own men can't be trusted."
	supervisors = "Whatever god you pray to. Sky's the limit!"
	selection_color = "#ff4747"
	exp_requirements = 1000
	exp_type = EXP_TYPE_OUTLAW

	outfit = /datum/outfit/job/wasteland/f13mobboss

	access = list(ACCESS_DEN)
	minimal_access = list(ACCESS_DEN)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis/f13mayor,
			/datum/job/oasis/f13sheriff,
			/datum/job/wasteland/f13detective,
		),
		/datum/matchmaking_pref/patron = list(
			/datum/job/wasteland/f13wastelander,
		),
	)


/datum/outfit/job/wasteland/f13mobboss
	name = "Den Mob Boss"
	jobtype = /datum/job/wasteland/f13mobboss

	id = /obj/item/card/id/dentattoo
	belt = /obj/item/storage/belt/military/assault
	ears = /obj/item/radio/headset/headset_den
	shoes = /obj/item/clothing/shoes/laceup
	l_pocket = /obj/item/melee/onehanded/knife/switchblade
	r_pocket = /obj/item/flashlight/seclite
	uniform = /obj/item/clothing/under/suit/white
	suit = /obj/item/clothing/suit/armor/f13/combat/mk2/raider
	backpack =	/obj/item/storage/backpack/satchel
	satchel = 	/obj/item/storage/backpack/satchel
	gloves = /obj/item/clothing/gloves/color/white
	head = /obj/item/clothing/head/caphat/beret/white
	mask = /obj/item/clothing/mask/bandana/durathread
	suit_store = /obj/item/gun/ballistic/automatic/smg/p90
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/restraints/handcuffs=1, \
		/obj/item/ammo_box/magazine/m10mm_p90=2, \
		/obj/item/storage/bag/money/small/raider/mobboss)

/datum/outfit/job/wasteland/f13mobboss/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)

	loadout_options = list(
		/datum/outfit/loadout/yakuza,
		/datum/outfit/loadout/kapitan,
		/datum/outfit/loadout/capo,
		/datum/outfit/loadout/don,
	)
	/datum/outfit/loadout/yakuza
	name = "Yakuza Boss"
	r_hand = /obj/item/katana
	suit = /obj/item/clothing/suit/armor/vest
	shoes = /obj/item/clothing/shoes/laceup
	belt = /obj/item/storage/belt/military/assault
	backpack =	/obj/item/storage/backpack/satchel
	ears = /obj/item/radio/headset/headset_den
	id = /obj/item/card/id/dentattoo
	backpack_contents = list(
						/obj/item/grenade/smokebomb
						)


	/datum/outfit/loadout/kapitan
	name = "Kapitan"
	r_hand = /obj/item/gun/ballistic/automatic/assault_rifle
	suit = /obj/item/clothing/suit/armor/vest
	belt = /obj/item/storage/belt/military/assault
	backpack =	/obj/item/storage/backpack/satchel
	ears = /obj/item/radio/headset/headset_den
	id = /obj/item/card/id/dentattoo
	backpack_contents = list(
						/obj/item/clothing/hat/beret/red
	                    )


	/datum/outfit/loadout/capo
	name = "Italian Capo"
	r_hand = /obj/item/gun/ballistic/automatic/smg/tommygun
	suit = 	/obj/item/clothing/under/suit_jacket/checkered
    shoes = /obj/item/clothing/shoes/laceup
	belt = /obj/item/storage/belt/military/assault
	backpack =	/obj/item/storage/backpack/satchel
	ears = /obj/item/radio/headset/headset_den
	id = /obj/item/card/id/dentattoo
	backpack_contents = list(
						/obj/item/clothing/shoes/laceup
						)

	/datum/outfit/loadout/don
	name = "Colombian Don"
	r_hand = /obj/item/gun/ballistic/automatic/r84
	suit = /obj/item/clothing/suit/armor/bulletproof
	belt = /obj/item/storage/belt/military/assault
	backpack =	/obj/item/storage/backpack/satchel
	ears = /obj/item/radio/headset/headset_den
	id = /obj/item/card/id/dentattoo
	backpack_contents = list(
						/obj/item/clothing/shoes/laceup,
						/obj/item/reagent/drug/methamphetamine
						/obj/item/clothing/shoes/sneakers/white
						)

/datum/outfit/job/wasteland/f13mobboss/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	if(!H.gang)
		var/datum/gang/denmob/DM = GLOB.denmob
		GLOB.all_gangs |= DM
		DM.add_member(H)
		H.gang = DM

datum/job/wasteland/f13dendoctor
	title = "Den Doctor"
	flag = F13DENDOCTOR
	faction = "Wastelander"
	social_faction = "Raiders"
	total_positions = 2
	spawn_positions = 2
	description = "While you prioritize providing medical treatment in emergency situations, you are still trained in combat and have the additional role as a loyal combanteer to the Den."
	supervisors = "The Boss."
	selection_color = "#ff4747"
	exp_requirements = 1000
	exp_type = EXP_TYPE_OUTLAW

	outfit = /datum/outfit/job/wasteland/f13dendoctor

	access = list(ACCESS_DEN)
	minimal_access = list(ACCESS_DEN)

	loadout_options = list(
		/datum/outfit/loadout/dencombatmedic,
		/datum/outfit/loadout/denchemist,
		)

/datum/outfit/job/wasteland/f13dendoctor
	name = "Den Doctor"
	jobtype = /datum/job/wasteland/f13dendoctor

	id = /obj/item/card/id/dentattoo
	belt = /obj/item/storage/belt/medical
	shoes = /obj/item/clothing/shoes/laceup
	ears = /obj/item/radio/headset/headset_den
	r_pocket = /obj/item/flashlight/seclite
	uniform = /obj/item/clothing/under/suit/white
	backpack =	/obj/item/storage/backpack/medic
	gloves =  /obj/item/clothing/gloves/color/white
	head = /obj/item/clothing/head/beret/durathread
	mask =  /obj/item/clothing/mask/bandana/durathread
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak=2, \
		/obj/item/healthanalyzer=1, \
		/obj/item/storage/bag/money/small/wastelander)

/datum/outfit/job/wasteland/f13dendoctor/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)
	ADD_TRAIT(H, TRAIT_SURGERY_MID, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/jet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/turbo)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/psycho)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/medx)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/buffout)

/datum/outfit/job/wasteland/f13dendoctor/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	if(!H.gang)
		var/datum/gang/denmob/DM = GLOB.denmob
		GLOB.all_gangs |= DM
		DM.add_member(H)
		H.gang = DM

/datum/outfit/loadout/dencombatmedic
	name = "Combat medic"
	r_hand = /obj/item/gun/ballistic/automatic/pistol/deagle
	suit = /obj/item/clothing/suit/toggle/labcoat/chemist
	backpack_contents = list(
							/obj/item/clothing/glasses/hud/health/f13=1, \
							/obj/item/ammo_box/magazine/m44 \
							)

/datum/outfit/loadout/denchemist
	name = "Chemist"
	r_hand = /obj/item/gun/ballistic/automatic/pistol/type17
	suit = /obj/item/clothing/suit/toggle/labcoat/chemist
	backpack_contents = list(
						/obj/item/ammo_box/magazine/m10mm_adv/simple=1, \
						/obj/item/clothing/mask/gas=1, \
						/obj/item/reagent_containers/glass/beaker/large=2 \
						)



//vigilante


/datum/job/wasteland/f13vigilante
	title = "Vigilante"
	flag = F13VIGILANTE
	faction = "Wastelander"
	total_positions = 0
	spawn_positions = 0
	description = "You have come a long way to reach this god forsaken place... it is now your job to protect its inhabitants from all sorts of injustice. Your moral codex requires you to help anyone in need and to never harm an innocent. Always try to capture and reeducate criminals instead of killing. Do not get involved in the conflicts between the major factions, that is not your fight."
	supervisors = "your moral code"
	selection_color = "#76885f"
	exp_requirements = 3000
	exp_type = EXP_TYPE_FALLOUT

	outfit = /datum/outfit/job/wasteland/f13vigilante

	loadout_options = list(
							/datum/outfit/loadout/desert_ranger,
							/datum/outfit/loadout/bounty_hunter,
							/datum/outfit/loadout/retired_ranger)


/datum/outfit/job/wasteland/f13vigilante
	name = "Vigilante"
	jobtype = /datum/job/wasteland/f13vigilante

	id = /obj/item/card/id/dogtag/vigilante
	belt = /obj/item/storage/belt/military
	shoes = /obj/item/clothing/shoes/f13/explorer
	l_pocket = /obj/item/melee/onehanded/knife/hunting
	r_pocket = /obj/item/flashlight/seclite
	uniform = /obj/item/clothing/under/f13/merca
	backpack = /obj/item/storage/backpack/satchel/trekker
	gloves = /obj/item/clothing/gloves/f13/military
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak=4, \
		/obj/item/reagent_containers/pill/radx=1, \
		/obj/item/restraints/handcuffs=2, \
		/obj/item/storage/bag/money/small/wastelander)

/datum/outfit/job/wasteland/f13vigilante/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIGHT_STEP, src)

/datum/outfit/loadout/desert_ranger
	name = "Desert Ranger"
	head = /obj/item/clothing/head/helmet/f13/ncr/rangercombat/desert
	suit = /obj/item/clothing/suit/armor/f13/rangercombat/desert
	r_hand = /obj/item/gun/ballistic/revolver/revolver44/desert_ranger
	backpack_contents = list(
							/obj/item/ammo_box/m44box/swc=2
							)

/datum/outfit/loadout/bounty_hunter
	name = "Bounty Hunter"
	head = /obj/item/clothing/suit/armor/f13/combat/mk2/dark
	suit = /obj/item/clothing/head/helmet/f13/combat/mk2/dark
	r_hand = /obj/item/gun/ballistic/automatic/g11
	backpack_contents = list(
							/obj/item/ammo_box/magazine/m473=2
							)

/datum/outfit/loadout/retired_ranger
	name = "Retired Veteran"
	r_hand = /obj/item/gun/ballistic/revolver/sequoia
	backpack_contents = list(
							/obj/item/ammo_box/c4570/explosive=2
							)

/datum/job/wasteland/f13adminboos
	title = "Death"
	flag = F13ADMINBOOS
	faction = "Wastelander"
	total_positions = 0
	spawn_positions = 0
	description = ""
	supervisors = "no one"
	selection_color = "#76885f"

	outfit = /datum/outfit/job/wasteland/f13adminboos

/datum/outfit/job/wasteland/f13adminboos
	name = "Death"
	jobtype = /datum/job/wasteland/f13vigilante
	id = /obj/item/card/id/dogtag/vigilante
	belt = /obj/item/storage/belt/military
	shoes = /obj/item/clothing/shoes/f13/explorer
	l_pocket = /obj/item/melee/onehanded/knife/hunting
	r_pocket = /obj/item/flashlight/seclite
	uniform = /obj/item/clothing/under/f13/merca
	backpack = /obj/item/storage/backpack/satchel/trekker
	gloves = /obj/item/clothing/gloves/f13/military
	head = /obj/item/clothing/head/helmet/f13/ncr/rangercombat/desert
	suit = /obj/item/clothing/suit/armor/f13/rangercombat/desert
	suit_store = /obj/item/gun/ballistic/revolver/sequoia/death
	glasses = /obj/item/clothing/glasses/hud/health/night
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak/super=4, \
		/obj/item/reagent_containers/pill/radx=1, \
		/obj/item/restraints/handcuffs=2, \
		/obj/item/ammo_box/c4570/explosive=6)

/datum/outfit/job/wasteland/f13adminboos/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	var/obj/item/implant/explosive/E = new
	E.implant(H)

	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIGHT_STEP, src)