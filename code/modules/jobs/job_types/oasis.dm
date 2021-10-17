/*
Town access doors
Sheriff/Deputy, Gatehouse etc: 62 ACCESS_GATEWAY
General access: 25 ACCESS_BAR
Clinic surgery/storage: 68 ACCESS_CLONING
Shopkeeper: 34 ACCESS_CARGO_BOT
Banker : 52 ACCESS_MINT_VAULT
Barkeep : 28 ACCESS_KITCHEN - you jebronis made default bar for no reason bruh
Prospector : 48 ACCESS_MINING
Detective : 4 ACCESS_FORENSICS_LOCKERS
here's a tip, go search DEFINES/access.dm
*/

/*
Mayor
*/

/datum/job/oasis
	exp_type = EXP_TYPE_OASIS
	faction = FACTION_OASIS

/datum/job/oasis/f13mayor
	title = "Mayor"
	flag = F13MAYOR
	department_flag = DEP_OASIS
	total_positions = 1
	spawn_positions = 1
	supervisors = "Oasis"
	description = "You are the benevolent tyrant of Oasis, chosen by the people to represent and lead them. Pass laws to protect your citizens, distribute town funds and make deals with the powers present within the Region to better the people, and yourself, of course."
	selection_color = "#d7b088"

	exp_requirements = 1500

	outfit = /datum/outfit/job/den/f13mayor
	access = list(ACCESS_BAR, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_CLINIC, ACCESS_KITCHEN, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	minimal_access = list(ACCESS_BAR, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_KITCHEN, ACCESS_CLINIC, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
			/datum/job/wasteland/f13mobboss,
		),
	)

/datum/outfit/job/den/f13mayor/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/den/f13mayor
	name = "Mayor"
	jobtype = /datum/job/oasis/f13mayor

	ears = 			/obj/item/radio/headset/headset_town
	id =            /obj/item/card/id/silver/mayor
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	l_pocket = /obj/item/storage/bag/money/small/settler
	r_pocket = /obj/item/flashlight/flare
	belt = /obj/item/gun/ballistic/revolver/colt357
	shoes = 		/obj/item/clothing/shoes/f13/tan
	uniform = /obj/item/clothing/under/f13/gentlesuit
	suit = /obj/item/clothing/suit/armor/f13/town/mayor
	head = /obj/item/clothing/head/f13/town/mayor
	backpack_contents = list(
		/obj/item/clothing/head/f13/town/big = 1, \
		/obj/item/storage/box/citizenship_permits = 1, \
		/obj/item/ammo_box/a357=2, \
		/obj/item/pen/fountain/captain = 1)
		
/*--------------------------------------------------------------*/	
	
/datum/job/oasis/f13secretary
	title = "Secretary"
	flag = F13SECRETARY
	department_flag = DEP_OASIS
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Mayor"
	description = "You are the mayor's assistant, you help them with anything and everything they require and make sure trivial problems do not concern them. You handle clerical work, hear complaints, and set meetings. An efficient and smooth running town means a happy mayor."
	selection_color = "#d7b088"

	exp_requirements = 800

	outfit = /datum/outfit/job/den/f13secretary
	access = list(ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_CLINIC, ACCESS_KITCHEN, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	minimal_access = list(ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_KITCHEN, ACCESS_CLINIC, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
			/datum/job/wasteland/f13enforcer,
		),
	)

/datum/outfit/job/den/f13secretary
	name = "Secretary"
	jobtype = /datum/job/oasis/f13secretary

	ears = 			/obj/item/radio/headset/headset_town
	id =            /obj/item/card/id/silver
	glasses = /obj/item/clothing/glasses/regular/hipster
	gloves = /obj/item/clothing/gloves/color/white
	backpack = /obj/item/storage/backpack/satchel/leather
	satchel = /obj/item/storage/backpack/satchel/leather
	r_hand = /obj/item/storage/briefcase/secretary
	l_pocket = /obj/item/storage/bag/money/small/settler
	r_pocket = /obj/item/flashlight/seclite
	shoes = 		/obj/item/clothing/shoes/f13/fancy
	uniform = /obj/item/clothing/under/suit/black
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m9mm = 1, 
		/obj/item/melee/onehanded/knife/switchblade = 1,
		/obj/item/pda = 1,
		)

/*--------------------------------------------------------------*/

/datum/job/oasis/f13sheriff
	title = "Sheriff"
	flag = F13SHERIFF
	department_flag = DEP_OASIS
	head_announce = list("Security")
	total_positions = 1
	spawn_positions = 1
	supervisors = "Oasis Government"
	description = "You are the Mayor's best friend, you helped them get where they are. While they handle civil matters, you've been rewarded with more hands-on work, as preferred. With your loyal patrolmen, you maintain your claim to authority by keeping the peace, and protecting the citizens from threats within and without. Never leave Oasis undefended, and don't let its people die out. You have nowhere left to go, if this town falls, so will you."
	selection_color = "#d7b088"
	exp_requirements = 1500

	outfit = /datum/outfit/job/den/f13sheriff
	
	loadout_options = list(
	/datum/outfit/loadout/thelaw,
	/datum/outfit/loadout/dacommissioner,
	)

	access = list(ACCESS_BAR, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_KITCHEN, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	minimal_access = list(ACCESS_BAR, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_CLINIC, ACCESS_KITCHEN, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
			/datum/job/wasteland/f13mobboss,
		),
	)

/datum/outfit/job/den/f13sheriff
	name = "Sheriff"
	jobtype = /datum/job/oasis/f13sheriff

	id = /obj/item/card/id/dogtag/sheriff
	belt = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer

	ears = 			/obj/item/radio/headset/headset_town
	uniform =  		/obj/item/clothing/under/f13/sheriff
	neck =			/obj/item/storage/belt/holster
	shoes = 		/obj/item/clothing/shoes/f13/cowboy
	glasses =		/obj/item/clothing/glasses/sunglasses
	l_pocket =		/obj/item/storage/bag/money/small/den
	backpack_contents = list(
		/obj/item/storage/box/deputy_badges = 1,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/melee/classic_baton = 1,
		/obj/item/melee/onehanded/knife/hunting = 1,
		)

/datum/outfit/loadout/thelaw
	name = "The Law Man"
	suit = /obj/item/clothing/suit/armor/f13/town/sheriff
	head = /obj/item/clothing/head/f13/town/sheriff
	r_hand = /obj/item/gun/ballistic/rifle/repeater/brush
	belt = /obj/item/gun/ballistic/revolver/m29/peacekeeper
	backpack_contents = list(
		/obj/item/ammo_box/tube/c4570 = 3,
		/obj/item/ammo_box/m44 = 2,
		)

/datum/outfit/loadout/dacommissioner
	name = "The Commissioner"
	uniform = /obj/item/clothing/under/f13/detectivealt
	suit = /obj/item/clothing/suit/armor/f13/town/commissioner
	head = /obj/item/clothing/head/f13/town/commissioner
	shoes = /obj/item/clothing/shoes/combat
	r_hand = /obj/item/gun/energy/laser/aer9
	belt = /obj/item/gun/ballistic/automatic/pistol/sig/commissioner
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc = 1,
		/obj/item/ammo_box/magazine/m9mm = 3,
		)

/datum/outfit/job/den/f13sheriff/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_SELF_AWARE, src)

/*--------------------------------------------------------------*/

/datum/job/oasis/f13deputy
	title = "Deputy"
	flag = F13DEPUTY
	department_flag = DEP_OASIS
	total_positions = 4
	spawn_positions = 4
	supervisors = "Oasis Police Department"
	description = "You've passed the training and tests to join the OPD, and your loyalty to the Chief is absolute - this is your new home, your family. This oasis of civilization will not fall as long as you breathe. Protect its citizens and property, for that is your new purpose."
	selection_color = "#dcba97"
	exp_requirements = 12
	exp_type = EXP_TYPE_OASIS
	exp_requirements = 600

	loadout_options = list(
	/datum/outfit/loadout/frontierjustice,
	/datum/outfit/loadout/police,
	/datum/outfit/loadout/pmc,)

	outfit = /datum/outfit/job/den/f13deputy
	access = list(ACCESS_BAR, ACCESS_GATEWAY)
	minimal_access = list(ACCESS_BAR, ACCESS_GATEWAY)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)

/datum/outfit/job/den/f13deputy
	name = "Deputy"
	jobtype = /datum/job/oasis/f13deputy

	ears = /obj/item/radio/headset/headset_town
	id = /obj/item/card/id/dogtag/deputy
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	l_pocket = /obj/item/storage/bag/money/small/settler
	r_pocket = /obj/item/flashlight/flare
	r_hand = /obj/item/melee/onehanded/knife/hunting
	shoes = /obj/item/clothing/shoes/f13/explorer
	uniform = /obj/item/clothing/under/f13/cowboyb
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 1,
		/obj/item/storage/belt/holster = 1,
		)

/datum/outfit/loadout/frontierjustice
	name = "Frontier Justice"
	suit = /obj/item/clothing/suit/armor/f13/town/deputy
	head = /obj/item/clothing/head/f13/town/deputy
	r_hand = /obj/item/gun/ballistic/rifle/repeater/trail
	belt = /obj/item/gun/ballistic/revolver/m29
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/bowie = 1,
		/obj/item/ammo_box/tube/m44 = 2,
		/obj/item/ammo_box/m44 = 2,
		)

/datum/outfit/loadout/police
	name = "Oasis PD"
	uniform = /obj/item/clothing/under/f13/police
	suit = /obj/item/clothing/suit/armor/bulletproof
	head = /obj/item/clothing/head/f13/police
	r_hand = /obj/item/gun/ballistic/shotgun/police
	belt = /obj/item/gun/ballistic/revolver/police
	shoes = /obj/item/clothing/shoes/combat
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/bean = 1,
		/obj/item/ammo_box/shotgun/buck = 1,
		/obj/item/ammo_box/a357 = 3,
		/obj/item/flashlight/seclite = 1,
		)

/datum/outfit/loadout/pmc
	name = "Private Contractor"
	uniform = /obj/item/clothing/under/f13/combat/militia
	suit = /obj/item/clothing/suit/armor/vest/alt
	head = /obj/item/clothing/head/helmet
	l_hand = /obj/item/gun/ballistic/automatic/marksman/policerifle
	belt = /obj/item/melee/onehanded/knife/switchblade
	shoes = /obj/item/clothing/shoes/jackboots
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle = 2,
		)

/datum/outfit/job/den/f13deputy/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

/*--------------------------------------------------------------*/

/datum/job/oasis/f13farmer
	title = "Farmer"
	flag = F13FARMER
	department_flag = DEP_OASIS
	total_positions = 4
	spawn_positions = 4
	supervisors = "Oasis Government & Police Department"
	description = "Growing up in the Oasis, you have an endless love for the sacred Oak, for nowhere in the valley is the soil as fertile, the bounty as rich. Behind the safety of the walls, you grow crops, medicines, and raise livestock. The community depends on you, you are a manifestation of the Oak’s will."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/den/f13farmer

	access = list(ACCESS_BAR,  ACCESS_KITCHEN)
	minimal_access = list(ACCESS_BAR,  ACCESS_KITCHEN)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)

/datum/outfit/job/den/f13farmer
	name = "Farmer"
	jobtype = /datum/job/oasis/f13farmer

	id = /obj/item/card/id/dogtag/town
	ears = 			/obj/item/radio/headset/headset_town
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	l_pocket = /obj/item/storage/bag/money/small/settler
	r_pocket = /obj/item/flashlight/flare
	belt = /obj/item/storage/bag/plants
	backpack_contents = list(
		/obj/item/cultivator=1, \
		/obj/item/hatchet=1,
		/obj/item/shovel/spade=1, \
		/obj/item/gun/ballistic/automatic/pistol/n99, \
		/obj/item/ammo_box/magazine/m10mm_adv/simple=2)
	shoes = 		/obj/item/clothing/shoes/workboots

/datum/outfit/job/den/f13settler/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/settler, \
		/obj/item/clothing/under/f13/brahminm, \
		/obj/item/clothing/under/f13/machinist, \
		/obj/item/clothing/under/f13/lumberjack, \
		/obj/item/clothing/under/f13/roving)

/*--------------------------------------------------------------*/

/datum/job/oasis/f13prospector
	title = "Prospector"
	flag = F13PROSPECTOR
	department_flag = DEP_OASIS
	total_positions = 4
	spawn_positions = 4
	supervisors = "Oasis Government & Police Department"
	description = "Prospecting is a complicated business, some call it scrounging or looting, but there is more to it than sifting through rubble - few can boast the skills you possess in mining and delving through the ruins of the fallen empire. Not many survive this line of business, and the pay has always been uncertain, but perhaps today you'll strike gold."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/den/f13prospector

	access = list(ACCESS_BAR, ACCESS_MINING)
	minimal_access = list(ACCESS_BAR, ACCESS_MINING)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)

/datum/outfit/job/den/f13prospector
	name = "Prospector"
	jobtype = /datum/job/oasis/f13prospector

	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_town
	suit = /obj/item/clothing/suit/armor/f13/raider/iconoclast/
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	l_pocket = /obj/item/storage/bag/money/small/settler
	r_pocket = /obj/item/flashlight/flare
	r_hand = /obj/item/pickaxe
	belt = /obj/item/storage/bag/ore
	shoes = /obj/item/clothing/shoes/workboots
	backpack_contents = list(
		/obj/item/mining_scanner,
		/obj/item/shovel,
		/obj/item/melee/onehanded/knife/hunting,
		/obj/item/gun/ballistic/automatic/pistol/n99,
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 2,
		)

/datum/outfit/job/den/f13settler/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/machinist, \
		/obj/item/clothing/under/f13/roving, \
		/obj/item/clothing/under/f13/cowboyt)

/datum/outfit/job/den/f13prospector/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/*--------------------------------------------------------------*/

/datum/job/oasis/f13dendoc
	title = "Doctor"
	flag = F13DENDOC
	department_flag = DEP_OASIS
	total_positions = 0
	spawn_positions = 0
	supervisors = "law and order"
	description = "Handy with a scalpel and scanner, your expertise in the practice of medicine makes you an indispensible asset to the Town. Just remember - medicine doesn't come free, and you aren't here out of the kindness of your heart. Be sure to turn a profit, or the Mayor might reconsider your position!"
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/den/f13dendoc
	access = list(ACCESS_BAR, ACCESS_CLINIC, ACCESS_CLONING)
	minimal_access = list(ACCESS_BAR, ACCESS_CLINIC, ACCESS_CLONING)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)

/datum/outfit/job/den/f13dendoc
	name = "Doctor"
	jobtype = /datum/job/oasis/f13dendoc
	chemwhiz = TRUE
	uniform = /obj/item/clothing/under/f13/medic
	glasses = /obj/item/clothing/glasses/hud/health
	ears = /obj/item/radio/headset/headset_town
	neck = /obj/item/clothing/neck/stethoscope
	suit = /obj/item/clothing/suit/toggle/labcoat
	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel/med
	shoes = /obj/item/clothing/shoes/sneakers/white
	id = /obj/item/card/id/dendoctor
	l_pocket = /obj/item/storage/bag/money/small/settler
	r_pocket = /obj/item/flashlight/flare
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak=2, \
		/obj/item/storage/firstaid/regular,
		/obj/item/clothing/accessory/armband/medblue  \
		)
/datum/outfit/job/den/f13dendoc/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)
/*--------------------------------------------------------------*/

/datum/job/oasis/f13barkeep
	title = "Barkeep"
	flag = F13BARKEEP
	department_flag = DEP_OASIS
	total_positions = 2
	spawn_positions = 2
	supervisors = "Oasis Government & Police Department"
	description = "As the innkeeper, you are responsible for comfort and full bellies in town. Hidden safely away behind the town walls, you are free to refine your skills without always watching your back. As a citizen of the town you must follow its laws. However the inn is your private business, and you decide who is allowed to dine or reside in your hospitality."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/den/f13barkeep

	loadout_options = list(
	/datum/outfit/loadout/rugged,
	/datum/outfit/loadout/frontier,
	/datum/outfit/loadout/richmantender,
	/datum/outfit/loadout/diner)

	access = list(ACCESS_BAR, ACCESS_KITCHEN)
	minimal_access = list(ACCESS_BAR, ACCESS_KITCHEN)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)


/datum/outfit/job/den/f13barkeep
	name = "Barkeep"
	jobtype = /datum/job/oasis/f13barkeep

	uniform = /obj/item/clothing/under/f13/bartenderalt
	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_town
	belt = /obj/item/gun/ballistic/revolver/caravan_shotgun
	shoes = /obj/item/clothing/shoes/workboots/mining
	backpack = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(
		/obj/item/storage/bag/money/small/settler = 1,
		/obj/item/ammo_box/shotgun/bean = 2
		)

/datum/outfit/loadout/rugged
	name = "Rugged"
	head = /obj/item/clothing/head/helmet/f13/brahmincowboyhat
	uniform = /obj/item/clothing/under/f13/cowboyb
	suit = /obj/item/clothing/suit/f13/cowboybvest
	gloves = /obj/item/clothing/gloves/color/brown
	shoes = /obj/item/clothing/shoes/f13/brownie

/datum/outfit/loadout/frontier
	name = "Frontier"
	head = /obj/item/clothing/head/bowler
	mask = /obj/item/clothing/mask/fakemoustache
	uniform = /obj/item/clothing/under/f13/westender
	suit = /obj/item/clothing/suit/f13/westender
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/f13/fancy

/datum/outfit/loadout/richmantender
	name = "Fancy"
	head = /obj/item/clothing/head/fedora
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/rank/bartender
	suit = /obj/item/clothing/suit/toggle/lawyer/black
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/f13/fancy
	neck = /obj/item/clothing/neck/tie/black

/datum/outfit/loadout/diner
	name = "Diner"
	glasses = /obj/item/clothing/glasses/orange
	uniform = /obj/item/clothing/under/f13/brahminf
	neck = /obj/item/clothing/neck/apron/chef
	gloves = /obj/item/clothing/gloves/color/white
	shoes = /obj/item/clothing/shoes/f13/military/ncr

/*--------------------------------------------------------------*/
/datum/job/oasis/f13settler
	title = "Citizen"
	flag = F13SETTLER
	department_flag = DEP_OASIS
	total_positions = 8
	spawn_positions = 8
	supervisors = "Oasis Government & Police Department"
	description = "You are a citizen living in the Town of Oasis - as the name suggests, it is a somewhat safe place amidst the chaos of the continent. Treat it as such, be sure to follow the laws of the land and do not associate with those who have a tendency not to, or you are likely to face exile. Remember that Oasis is your home, and that you should not be leaving to explore the Wastes."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/den/f13settler

	loadout_options = list(
		/datum/outfit/loadout/provisioner,
		/datum/outfit/loadout/bum,
		/datum/outfit/loadout/properlady,
		/datum/outfit/loadout/propergent,
		/datum/outfit/loadout/hombre,
		/datum/outfit/loadout/singer,
	)
	access = list(ACCESS_BAR)
	minimal_access = list(ACCESS_BAR)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)


/datum/outfit/job/den/f13settler
	name = "Citizen"
	jobtype = /datum/job/oasis/f13settler
	ears = /obj/item/radio/headset/headset_town
	belt = null
	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_town
	uniform = /obj/item/clothing/under/f13/settler
	shoes = /obj/item/clothing/shoes/jackboots
	backpack = /obj/item/storage/backpack/satchel/explorer
	r_pocket = /obj/item/flashlight/flare
	backpack_contents = list(
		/obj/item/storage/bag/money/small/settler = 1,
		/obj/item/melee/onehanded/knife/hunting = 1,
		)

/datum/outfit/loadout/provisioner
	name = "Provisioner"
	neck = /obj/item/clothing/neck/scarf/cptpatriot
	suit = /obj/item/clothing/suit/jacket/miljacket
	neck = /obj/item/clothing/ears/headphones
	uniform = /obj/item/clothing/under/f13/merca
	gloves = /obj/item/clothing/gloves/f13/leather
	shoes = /obj/item/clothing/shoes/f13/explorer
	backpack_contents = list(/obj/item/reagent_containers/food/drinks/flask = 1,
	/obj/item/gun/ballistic/automatic/pistol/n99 = 1,
	/obj/item/ammo_box/magazine/m10mm_adv/simple = 1,
	)

/datum/outfit/loadout/bum
	name = "Bum"
	mask = /obj/item/clothing/mask/facewrap
	neck = /obj/item/clothing/neck/mantle/poncho
	uniform = /obj/item/clothing/under/f13/rag
	gloves = /obj/item/clothing/gloves/f13/handwraps
	shoes = /obj/item/clothing/shoes/f13/rag
	backpack_contents = list(/obj/item/storage/bag/trash = 1, /obj/item/reagent_containers/food/drinks/bottle/whiskey = 1,
	/obj/item/gun/ballistic/revolver/hobo/piperifle = 1,
	/obj/item/ammo_box/a556/stripper = 1,
	/obj/item/twohanded/spear/scrapspear = 1,
	)

/datum/outfit/loadout/properlady
	name = "Proper Lady"
	head = /obj/item/clothing/head/beret/black
	suit = /obj/item/clothing/under/sailordress
	gloves = /obj/item/clothing/gloves/f13/lace
	shoes = /obj/item/clothing/shoes/f13/fancy
	backpack_contents = list(/obj/item/reagent_containers/food/drinks/bottle/champagne = 1,
	/obj/item/gun/ballistic/revolver/police = 1,
	/obj/item/ammo_box/a357 = 2,
	)

/datum/outfit/loadout/propergent
	name = "Respectable Gent"
	head = /obj/item/clothing/head/f13/beaver
	suit = /obj/item/clothing/suit/f13/cowboybvest
	uniform = /obj/item/clothing/under/f13/bartenderalt
	shoes = /obj/item/clothing/shoes/f13/fancy
	backpack_contents = list(/obj/item/storage/box/matches = 1,
	/obj/item/storage/fancy/cigarettes/cigars = 1,
	/obj/item/gun/ballistic/revolver/widowmaker = 1,
	/obj/item/ammo_box/shotgun/improvised = 2,
	)

/datum/outfit/loadout/hombre
	name = "Hombre"
	head = /obj/item/clothing/head/f13/cowboy
	suit = /obj/item/clothing/suit/f13/duster
	uniform = /obj/item/clothing/under/f13/cowboyb
	r_hand = /obj/item/gun/ballistic/rifle/hunting
	gloves = /obj/item/clothing/gloves/f13/leather
	shoes = /obj/item/clothing/shoes/f13/cowboy
	backpack_contents = list(/obj/item/ammo_box/a308 = 2,
	)
/*
/datum/outfit/loadout/secretary
	name = "Secretary"
	uniform = /obj/item/clothing/under/suit/black
	glasses = /obj/item/clothing/glasses/regular/hipster
	shoes = /obj/item/clothing/shoes/laceup
	r_hand = /obj/item/storage/briefcase
	backpack_contents = list(/obj/item/pen = 1,
	/obj/item/clipboard = 1,
	/obj/item/paper_bin/bundlenatural = 1,
	/obj/item/clothing/under/suit/black/skirt = 1,
	/obj/item/gun/ballistic/automatic/pistol/pistol22 = 1,
	/obj/item/ammo_box/magazine/m22 = 2,
	)
	///we should find something to do with this
*/
/datum/outfit/loadout/singer
	name = "Saloon Singer"
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(/obj/item/clothing/under/f13/classdress = 1,
	/obj/item/clothing/under/suit/black_really = 1,
	/obj/item/clothing/gloves/evening = 1,
	/obj/item/clothing/gloves/color/white = 1,
	/obj/item/melee/unarmed/brass = 1,
	)

/*----------------------------------------------------------------
--							Detective							--
----------------------------------------------------------------*/
/datum/job/wasteland/f13detective
	title = "Detective"
	flag = F13DETECTIVE
	total_positions = 1
	spawn_positions = 1
	description = "As a Detective you are a private eye who assists clients to gather evidence, conduct surveillance, find missing people, and verify information. As a private investigator you are not responsible for peacekeeping the valley, but for finding answers. Your life is already over, make the ending mean something."
	supervisors = "paying clients"
	selection_color = "#dcba97"
	outfit = /datum/outfit/job/wasteland/f13detective

	access = list(ACCESS_BAR, ACCESS_FORENSICS_LOCKERS)
	minimal_access = list(ACCESS_BAR, ACCESS_FORENSICS_LOCKERS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/wasteland/f13wastelander,
			/datum/job/wasteland/f13detective,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/wasteland/f13wastelander,
			/datum/job/wasteland/f13detective,
			/datum/job/wasteland/f13mobboss,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/wasteland/f13wastelander,
		),
	)


/datum/outfit/job/wasteland/f13detective
	name = "Detective"
	jobtype = /datum/job/wasteland/f13detective
	suit = /obj/item/clothing/suit/det_suit/grey
	ears = /obj/item/radio/headset/headset_town
	uniform = /obj/item/clothing/under/f13/detectivealt
	head = /obj/item/clothing/head/f13/det_hat_alt
	shoes =  /obj/item/clothing/shoes/laceup
	id = /obj/item/card/id/silver
	l_pocket = /obj/item/storage/bag/money/small/oasis
	r_pocket = /obj/item/flashlight/flare
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	suit_store = /obj/item/gun/ballistic/revolver/police
	backpack_contents = list(
		/obj/item/pda/detective=1,
		/obj/item/camera/detective=1,
		/obj/item/toy/crayon/white=1,
		/obj/item/detective_scanner=1,
		/obj/item/storage/box/gloves=1,
		/obj/item/storage/box/evidence=1,
		/obj/item/ammo_box/a357=2)

/*--------------------------------------------------------------*/

/*
/datum/job/oasis/f13banker
	title = "Banker"
	flag = F13BANKER
	department_flag = DEP_OASIS
	total_positions = 2
	spawn_positions = 2
	supervisors = "law and order"
	description = "No matter where society lurks, profit and fortune are there to be made! It is up to you to distribute caps and earn interest while safekeeping items of value for the wastelands denizens! Ensure you make a profit and make your money back no matter the cost. You are to work alongside the Town, and should not be attempting to harm the residents of Oasis."
	selection_color = "#dcba97"
	enforces = "You are in a Job meant for encouraging roleplay with others, do not abandon your post or hoard money unless absolutely necessary. Do not use the caps provided for yourself."
	outfit = /datum/outfit/job/den/f13banker

	loadout_options = list(
	/datum/outfit/loadout/classy,
	/datum/outfit/loadout/loanshark,
	/datum/outfit/loadout/investor,
	)

	access = list(ACCESS_BAR, ACCESS_MINT_VAULT)
	minimal_access = list(ACCESS_BAR, ACCESS_MINT_VAULT)

/datum/outfit/job/den/f13banker
	name = "Banker"
	jobtype = /datum/job/oasis/f13banker

	uniform = /obj/item/clothing/under/lawyer/blacksuit
	id = /obj/item/card/id/silver
	ears = /obj/item/radio/headset/headset_town
	shoes = /obj/item/clothing/shoes/f13/fancy
	backpack = /obj/item/storage/backpack/satchel/leather
	satchel = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(
		/obj/item/storage/bag/money/small/banker)

/datum/outfit/loadout/classy
	name = "Classy"
	head = /obj/item/clothing/head/collectable/tophat
	glasses = /obj/item/clothing/glasses/monocle
	uniform = /obj/item/clothing/under/suit_jacket/charcoal
	suit = /obj/item/clothing/suit/f13/banker
	gloves = /obj/item/clothing/gloves/color/white/redcoat
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(
	/obj/item/cane=1,
	/obj/item/gun/ballistic/automatic/hobo/zipgun=1
	/obj/item/storage/fancy/cigarettes/cigpack_bigboss=1,
	/obj/item/reagent_containers/food/drinks/bottle/whiskey=1,
	/obj/item/reagent_containers/food/drinks/drinkingglass/shotglass=1
	)

/datum/outfit/loadout/loanshark
	name = "Loanshark"
	glasses = /obj/item/clothing/glasses/orange
	mask = /obj/item/clothing/mask/cigarette/cigar
	suit = /obj/item/clothing/suit/f13/vest
	uniform = /obj/item/clothing/under/f13/sleazeball
	shoes = /obj/item/clothing/shoes/sandal
	backpack_contents = list(
	/obj/item/reagent_containers/food/drinks/bottle/whiskey=1,
	/obj/item/storage/box/matches=1,
	/obj/item/gun/ballistic/automatic/smg/mini_uzi=1
	)

/datum/outfit/loadout/investor
	name = "Investor"
	glasses = /obj/item/clothing/glasses/sunglasses
	suit = /obj/item/clothing/suit/toggle/lawyer/black
	uniform = /obj/item/clothing/under/f13/bennys
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/colt357=1,
		/obj/item/storage/fancy/cigarettes/cigpack_bigboss=1,
		/obj/item/storage/box/matches=1
		)
*/

/*--------------------------------------------------------------*/

/datum/job/oasis/f13shopkeeper
	title = "Shopkeeper"
	flag = F13SHOPKEEPER
	department_flag = DEP_OASIS
	total_positions = 2
	spawn_positions = 2
	supervisors = "free hand of the market"
	description = "The greed of the United States survived better than its people. You are an organ of this greed. Ensure its continuation."
	selection_color = "#dcba97"
	exp_requirements = 600

	outfit = /datum/outfit/job/den/f13shopkeeper
	access = list(ACCESS_BAR, ACCESS_CARGO_BOT)
	minimal_access = list(ACCESS_BAR, ACCESS_CARGO_BOT)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)

/datum/outfit/job/den/f13shopkeeper
	name = "Shopkeeper"
	jobtype = /datum/job/oasis/f13shopkeeper

	id = /obj/item/card/id/dogtag/town
	uniform = /obj/item/clothing/under/f13/roving
	ears = /obj/item/radio/headset/headset_town
	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	gloves = /obj/item/clothing/gloves/fingerless
	l_pocket = /obj/item/storage/bag/money/small/den
	r_pocket = /obj/item/flashlight/flare
	shoes = /obj/item/clothing/shoes/f13/explorer
	backpack_contents = list()

/datum/outfit/job/den/f13shopkeeper/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/den/f13shopkeeper/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
