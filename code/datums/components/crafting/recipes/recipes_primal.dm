/datum/crafting_recipe/tribal_torch
	name = "Tribal Torch"
	result = /obj/item/candle/tribal_torch
	time = 30
	reqs = list(/obj/item/stack/sheet/mineral/wood = 4)
	category = CAT_PRIMAL

/datum/crafting_recipe/handheld_torch
	name = "Handheld Torch"
	result = /obj/item/flashlight/flare/torch
	time = 30
	reqs = list(/obj/item/stack/sheet/mineral/wood = 3,
				/obj/item/stack/sheet/cloth = 1)
	category = CAT_PRIMAL

/datum/crafting_recipe/bonfire
	name = "Bonfire"
	time = 60
	reqs = list(/obj/item/stack/sheet/mineral/wood = 30)
	result = /obj/structure/bonfire
	category = CAT_PRIMAL

/datum/crafting_recipe/bonfirecaps
	name = "Bonfire"
	time = 60
	reqs = list(/obj/item/grown/log = 5)
	result = /obj/structure/bonfire
	category = CAT_PRIMAL

/datum/crafting_recipe/headpikelegion
	name = "Spike Head (Throwing Spear)"
	time = 65
	reqs = list(/obj/item/throwing_star/spear = 1,
				/obj/item/bodypart/head = 1)
	parts = list(/obj/item/bodypart/head = 1,
			/obj/item/throwing_star/spear = 1)
	result = /obj/structure/headpike
	category = CAT_PRIMAL

/datum/crafting_recipe/headpike
	name = "Spike Head (Glass Spear)"
	time = 65
	reqs = list(/obj/item/twohanded/spear = 1,
				/obj/item/bodypart/head = 1)
	parts = list(/obj/item/bodypart/head = 1,
			/obj/item/twohanded/spear = 1)
	result = /obj/structure/headpike
	category = CAT_PRIMAL

/datum/crafting_recipe/headpikebone
	name = "Spike Head (Bone Spear)"
	time = 65
	reqs = list(/obj/item/twohanded/spear/bonespear = 1,
				/obj/item/bodypart/head = 1)
	parts = list(/obj/item/bodypart/head = 1,
			/obj/item/twohanded/spear/bonespear = 1)
	result = /obj/structure/headpike/bone
	category = CAT_PRIMAL

/datum/crafting_recipe/bow_tablet
	name = "Sandstone Bow Making Manual"
	result = /obj/item/book/granter/crafting_recipe/bone_bow
	time = 200 //Scribing // don't care
	always_availible = FALSE
	reqs = list(/obj/item/stack/rods = 1,
				/obj/item/stack/sheet/mineral/sandstone = 4)
	category = CAT_PRIMAL

/datum/crafting_recipe/rib
	name = "Collosal Rib"
	always_availible = FALSE
	reqs = list(
			/obj/item/stack/sheet/bone = 10,
			/datum/reagent/oil = 5)
	result = /obj/structure/statue/bone/rib
	category = CAT_PRIMAL

/datum/crafting_recipe/skull
	name = "Skull Carving"
	always_availible = FALSE
	reqs = list(
			/obj/item/stack/sheet/bone = 6,
			/datum/reagent/oil = 5)
	result = /obj/structure/statue/bone/skull
	category = CAT_PRIMAL

/datum/crafting_recipe/halfskull
	name = "Cracked Skull Carving"
	always_availible = FALSE
	reqs = list(
			/obj/item/stack/sheet/bone = 3,
			/datum/reagent/oil = 5)
	result = /obj/structure/statue/bone/skull/half
	category = CAT_PRIMAL

/datum/crafting_recipe/boneshovel
	name = "Serrated Bone Shovel"
	always_availible = FALSE
	reqs = list(
			/obj/item/stack/sheet/bone = 4,
			/datum/reagent/oil = 5,
			/obj/item/shovel/spade = 1)
	result = /obj/item/shovel/serrated
	category = CAT_PRIMAL

/datum/crafting_recipe/punji_sticks
	name = "Punji stick Trap"
	time = 30
	reqs = list(
			/obj/item/stack/sheet/mineral/bamboo = 5)
	result = /obj/structure/punji_sticks
	category = CAT_PRIMAL
	always_availible = FALSE

/datum/crafting_recipe/tribal_pa
	name = "Tribal Salvaged Power Armor"
	time = 120
	reqs = list(
			/obj/item/clothing/suit/armor/f13/power_armor/t45b = 1,
			/obj/item/stack/sheet/cloth = 15,
			/obj/item/stack/sheet/metal = 35,
			/obj/item/stack/sheet/leather = 10,
			/obj/item/stack/sheet/mineral/diamond = 5,
			/obj/item/stack/sheet/bone = 20
			)
	result = /obj/item/clothing/suit/armor/f13/wayfarer/tribal_pa
	category = CAT_TRIBAL
	always_availible = FALSE
	
/datum/crafting_recipe/tribal_pa_helmet
	name = "Tribal Salvaged Power Armor Helmet"
	time = 120
	reqs = list(
			/obj/item/clothing/head/helmet/f13/power_armor/t45b = 1,
			/obj/item/stack/sheet/cloth = 10,
			/obj/item/stack/sheet/metal = 15,
			/obj/item/stack/sheet/leather = 20,
			/obj/item/stack/sheet/mineral/diamond = 10,
			/obj/item/stack/sheet/bone = 10
			)
	result = /obj/item/clothing/head/helmet/f13/wayfarer/pa_helmet
	category = CAT_TRIBAL
	always_availible = FALSE

/datum/crafting_recipe/tribal_combat_armor
	name = "Tribal Combat Armor"
	time = 40
	reqs = list(
			/obj/item/clothing/suit/armor/f13/combat = 1,
			/obj/item/stack/sheet/cloth = 15,
			/obj/item/stack/sheet/sinew = 10,
			/obj/item/stack/sheet/animalhide/deathclaw= 2,
			/obj/item/stack/sheet/bone = 20
			)
	result = /obj/item/clothing/suit/armor/f13/tribal_combat_armor
	category = CAT_TRIBAL
	always_availible = FALSE

/datum/crafting_recipe/tribal_combat_armor_helmet
	name = "Tribal Combat Helmet"
	time = 40
	reqs = list(
			/obj/item/clothing/head/helmet/f13/combat = 1,
			/obj/item/stack/sheet/cloth = 5,
			/obj/item/stack/sheet/sinew = 5,
			/obj/item/stack/sheet/animalhide/deathclaw= 1,
			/obj/item/stack/sheet/bone = 10
			)
	result = /obj/item/clothing/head/helmet/f13/combat/wayfarer/tribe_helmet
	category = CAT_TRIBAL
	always_availible = FALSE

/datum/crafting_recipe/tribalwar/sturdybow
	name = "Sturdy Bow"
	result = /obj/item/gun/ballistic/automatic/sturdybow
	time = 80
	reqs = list(/obj/item/stack/sheet/mineral/wood = 5,
				/obj/item/stack/sheet/metal = 10,
				/obj/item/stack/sheet/cloth = 5)
	category = CAT_TRIBAL
	tools = list(TOOL_WORKBENCH)

/datum/crafting_recipe/tribalwar/silverbow
	name = "Silver Bow"
	result = /obj/item/gun/ballistic/automatic/silverbow
	time = 80
	reqs = list(/obj/item/stack/sheet/mineral/silver = 10,
				/obj/item/stack/sheet/metal = 10,
				/obj/item/stack/crafting/metalparts = 5)
	category = CAT_TRIBAL
	tools = list(TOOL_WORKBENCH)

/datum/crafting_recipe/tribalwar/bonebow
	name = "Deathclaw Bow"
	result = /obj/item/gun/ballistic/automatic/bonebow
	time = 80
	reqs = list(/obj/item/stack/sheet/animalhide/deathclaw = 6,
				/obj/item/stack/sheet/bone = 10,
				/obj/item/stack/sheet/sinew = 5)
	category = CAT_TRIBAL
	tools = list(TOOL_WORKBENCH)

/datum/crafting_recipe/tribalwar/tribe_bow
	name = "Short Bow"
	result = /obj/item/gun/ballistic/automatic/tribalbow
	time = 50
	reqs = list(/obj/item/stack/sheet/mineral/wood = 10,
				/obj/item/stack/sheet/sinew = 3)
	category = CAT_TRIBAL

/datum/crafting_recipe/tribalwar/crossbow
	name = "CrossBow"
	result = /obj/item/gun/ballistic/automatic/crossbow
	time = 180
	reqs = list(/obj/item/stack/sheet/metal = 10,
				/obj/item/stack/crafting/metalparts = 3,
				/obj/item/advanced_crafting_components/assembly = 1,
				/obj/item/advanced_crafting_components/alloys = 1,
				/obj/item/stack/sheet/glass = 4)
	category = CAT_TRIBAL

//ARROWS

/datum/crafting_recipe/tribalwar/arrowburn
	name = "Burning Oil Arrow"
	result = /obj/item/ammo_casing/caseless/arrow/burning
	time = 30
	reqs = list(/obj/item/ammo_casing/caseless/arrow = 1,
				/obj/item/reagent_containers/food/drinks/bottle = 1,
				/obj/item/reagent_containers/food/snacks/meat/slab/human/ghoul = 4)
	category = CAT_TRIBAL
	tools = list(TOOL_WORKBENCH)

/datum/crafting_recipe/tribalwar/arrowap
	name = "Sturdy Arrow"
	result = /obj/item/ammo_casing/caseless/arrow/ap
	time = 40
	reqs = list(
		/obj/item/stack/rods = 2,
		/obj/item/stack/crafting/metalparts = 2,
		)
	category = CAT_TRIBAL
	tools = list(TOOL_WORKBENCH)

/datum/crafting_recipe/tribalwar/arrowpoison
	name = "Poison Arrow"
	result = /obj/item/ammo_casing/caseless/arrow/poison
	time = 30
	reqs = list(
		/obj/item/ammo_casing/caseless/arrow = 1,
		/obj/item/reagent_containers/food/snacks/grown/nettle = 5,
		)
	category = CAT_TRIBAL
	tools = list(TOOL_WORKBENCH)

/datum/crafting_recipe/tribalwar/arrowbone
	name = "Bone Arrow"
	result = /obj/item/ammo_casing/caseless/arrow/bone
	time = 30
	reqs = list(/obj/item/stack/sheet/bone = 4,
				/obj/item/stack/sheet/sinew = 1)
	category = CAT_TRIBAL
	tools = list(TOOL_WORKBENCH)

//MELEE

/datum/crafting_recipe/tribalwar/bonespear
	name = "Bone Spear"
	result = /obj/item/twohanded/spear/bonespear
	time = 30
	reqs = list(/obj/item/stack/sheet/bone = 4,
				/obj/item/stack/sheet/sinew = 1)
	category = CAT_TRIBAL

/datum/crafting_recipe/tribalwar/boneaxe
	name = "Bone Axe"
	result = /obj/item/twohanded/fireaxe/boneaxe
	time = 50
	reqs = list(/obj/item/stack/sheet/bone = 6,
				/obj/item/stack/sheet/sinew = 3)
	category = CAT_TRIBAL

/datum/crafting_recipe/tribalwar/warclub
	name = "Carve Wooden Warclub"
	result = /obj/item/melee/onehanded/club/warclub
	time = 80
	reqs = list(/obj/item/stack/sheet/mineral/wood = 10,
				/obj/item/stack/sheet/cloth = 1)
	category = CAT_TRIBAL
	tools = list(TOOL_WORKBENCH)

/datum/crafting_recipe/tribalwar/tribe_quiver
	name = "Craft Quiver and Arrows"
	result = /obj/item/storage/belt/tribe_quiver
	time = 80
	reqs = list(/obj/item/stack/sheet/mineral/wood = 8,
				/obj/item/stack/sheet/metal = 4,
				/obj/item/stack/sheet/leather = 1)
	tools = list(TOOL_WORKBENCH)

/datum/crafting_recipe/tribalwar/spearquiver
	name = "Spear Quiver"
	result = /obj/item/storage/backpack/spearquiver
	time = 60
	reqs = list(/obj/item/stack/sheet/leather = 3,
				/obj/item/stack/sheet/metal = 1)
	category = CAT_TRIBAL

/datum/crafting_recipe/tribalwar/lighttribe
	name = "Light Tribal Plates"
	result = /obj/item/clothing/suit/armor/f13/tribe_armor
	time = 600
	reqs = list(/obj/item/stack/sheet/metal = 10,
				/obj/item/stack/sheet/cloth = 5)
	category = CAT_TRIBAL
	tools = list(TOOL_FORGE)

/datum/crafting_recipe/tribalwar/heavytribe
	name = "Heavy Tribal Plates"
	result = /obj/item/clothing/suit/armor/f13/tribe_heavy_armor
	time = 600
	reqs = list(/obj/item/stack/sheet/metal = 20,
				/obj/item/stack/sheet/cloth = 5)
	category = CAT_TRIBAL
	tools = list(TOOL_FORGE)

/datum/crafting_recipe/tribalwar/goliathcloak
	name = "Deathclaw cloak"
	result = /obj/item/clothing/suit/hooded/cloak/goliath
	time = 50
	reqs = list(/obj/item/stack/sheet/leather = 2,
				/obj/item/stack/sheet/sinew = 2,
				/obj/item/stack/sheet/animalhide/deathclaw = 4)
	category = CAT_TRIBAL
	tools = list(TOOL_WORKBENCH)

/datum/crafting_recipe/tribalwar/chitinarmor
	name = "Insect Chitin Armor"
	result = /obj/item/clothing/suit/armor/f13/chitinarmor
	time = 30
	reqs = list(/obj/item/stack/sheet/animalhide/chitin = 12,
				/obj/item/stack/sheet/sinew = 4,
				/obj/item/stack/sheet/cloth = 4)
	category = CAT_TRIBAL
	tools = list(TOOL_WORKBENCH)
