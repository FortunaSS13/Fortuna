///Item boxes for custom loadouts transferred from Legacy.

/obj/item/storage/box/large/custom_kit
	name = "Custom Loadout"
	desc = "Your custom loadout items!"
	w_class = WEIGHT_CLASS_BULKY

//killer402402 killa#0666
/obj/item/storage/box/large/custom_kit/killa/PopulateContents()
	new /obj/item/clothing/suit/armor/vest/russian(src)
	new /obj/item/clothing/mask/gas/explorer(src)
	new /obj/item/clothing/mask/bandana/green(src)
	new /obj/item/clothing/under/costume/singer/yellow(src)
	new /obj/item/gun/energy/laser/wattz(src)
