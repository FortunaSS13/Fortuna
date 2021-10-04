/obj/item/encryptionkey
	name = "standard encryption key"
	desc = "An encryption key for a radio headset."
	icon = 'icons/obj/radio.dmi'
	icon_state = "cypherkey"
	w_class = WEIGHT_CLASS_TINY
	var/translate_binary = FALSE
	var/syndie = FALSE
	var/independent = FALSE
	var/list/channels = list()

/obj/item/encryptionkey/Initialize()
	. = ..()
	if(!channels.len)
		desc = "An encryption key for a radio headset.  Has no special codes in it. You should probably tell a coder!"

/obj/item/encryptionkey/examine(mob/user)
	. = ..()
	if(LAZYLEN(channels))
		var/list/examine_text_list = list()
		for(var/i in channels)
			examine_text_list += "[GLOB.channel_tokens[i]] - [lowertext(i)]"

		. += "<span class='notice'>It can access the following channels; [jointext(examine_text_list, ", ")].</span>"

/obj/item/encryptionkey/syndicate
	name = "syndicate encryption key"
	icon_state = "syn_cypherkey"
	channels = list(RADIO_CHANNEL_SYNDICATE = 1)
	syndie = TRUE //Signifies that it de-crypts Syndicate transmissions

/obj/item/encryptionkey/binary
	name = "binary translator key"
	icon_state = "bin_cypherkey"
	translate_binary = TRUE

/obj/item/encryptionkey/headset_sec
	name = "security radio encryption key"
	icon_state = "sec_cypherkey"
	channels = list(RADIO_CHANNEL_SECURITY = 1)

/obj/item/encryptionkey/headset_eng
	name = "engineering radio encryption key"
	icon_state = "eng_cypherkey"
	channels = list(RADIO_CHANNEL_ENGINEERING = 1)

/obj/item/encryptionkey/headset_med
	name = "medical radio encryption key"
	icon_state = "med_cypherkey"
	channels = list(RADIO_CHANNEL_MEDICAL = 1)

/obj/item/encryptionkey/headset_sci
	name = "science radio encryption key"
	icon_state = "sci_cypherkey"
	channels = list(RADIO_CHANNEL_SCIENCE = 1)

/obj/item/encryptionkey/headset_medsci
	name = "medical research radio encryption key"
	icon_state = "medsci_cypherkey"
	channels = list(RADIO_CHANNEL_SCIENCE = 1, RADIO_CHANNEL_MEDICAL = 1)

/obj/item/encryptionkey/headset_com
	name = "command radio encryption key"
	icon_state = "com_cypherkey"
	channels = list(RADIO_CHANNEL_COMMAND = 1)

/obj/item/encryptionkey/heads/captain
	name = "\proper the captain's encryption key"
	icon_state = "cap_cypherkey"
	channels = list(RADIO_CHANNEL_COMMAND = 1, RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_ENGINEERING = 0, RADIO_CHANNEL_SCIENCE = 0, RADIO_CHANNEL_MEDICAL = 0, RADIO_CHANNEL_SUPPLY = 0, RADIO_CHANNEL_SERVICE = 0)

/obj/item/encryptionkey/heads/rd
	name = "\proper the research director's encryption key"
	icon_state = "rd_cypherkey"
	channels = list(RADIO_CHANNEL_SCIENCE = 1, RADIO_CHANNEL_COMMAND = 1)

/obj/item/encryptionkey/heads/hos
	name = "\proper the head of security's encryption key"
	icon_state = "hos_cypherkey"
	channels = list(RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_COMMAND = 1)

/obj/item/encryptionkey/heads/ce
	name = "\proper the chief engineer's encryption key"
	icon_state = "ce_cypherkey"
	channels = list(RADIO_CHANNEL_ENGINEERING = 1, RADIO_CHANNEL_COMMAND = 1)

/obj/item/encryptionkey/heads/cmo
	name = "\proper the chief medical officer's encryption key"
	icon_state = "cmo_cypherkey"
	channels = list(RADIO_CHANNEL_MEDICAL = 1, RADIO_CHANNEL_COMMAND = 1)

/obj/item/encryptionkey/heads/hop
	name = "\proper the head of personnel's encryption key"
	icon_state = "hop_cypherkey"
	channels = list(RADIO_CHANNEL_SERVICE = 1, RADIO_CHANNEL_COMMAND = 1)

/obj/item/encryptionkey/heads/qm
	name = "\proper the quartermaster's encryption key"
	desc = "An encryption key for a radio headset.  Channels are as follows: :u - supply, :c - command."
	icon_state = "hop_cypherkey"
	channels = list(RADIO_CHANNEL_SUPPLY = 1, RADIO_CHANNEL_COMMAND = 1)

/obj/item/encryptionkey/headset_cargo
	name = "supply radio encryption key"
	icon_state = "cargo_cypherkey"
	channels = list(RADIO_CHANNEL_SUPPLY = 1)

/obj/item/encryptionkey/headset_mining
	name = "mining radio encryption key"
	icon_state = "cargo_cypherkey"
	channels = list(RADIO_CHANNEL_SUPPLY = 1, RADIO_CHANNEL_SCIENCE = 1)

/obj/item/encryptionkey/headset_service
	name = "service radio encryption key"
	icon_state = "srv_cypherkey"
	channels = list(RADIO_CHANNEL_SERVICE = 1)

/obj/item/encryptionkey/headset_cent
	name = "\improper CentCom radio encryption key"
	icon_state = "cent_cypherkey"
	independent = TRUE
	channels = list(RADIO_CHANNEL_CENTCOM = 1)

/obj/item/encryptionkey/ai //ported from NT, this goes 'inside' the AI.
	channels = list(RADIO_CHANNEL_COMMAND = 1, RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_ENGINEERING = 1, RADIO_CHANNEL_SCIENCE = 1, RADIO_CHANNEL_MEDICAL = 1, RADIO_CHANNEL_SUPPLY = 1, RADIO_CHANNEL_SERVICE = 1, RADIO_CHANNEL_AI_PRIVATE = 1)

/obj/item/encryptionkey/secbot
	channels = list(RADIO_CHANNEL_AI_PRIVATE = 1, RADIO_CHANNEL_SECURITY = 1)

//FALLOUT

/obj/item/encryptionkey/headset_vault
	name = "vault radio encryption key"
	desc = "An encryption key for a radio headset.  To access the vault channel, use :b."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_VAULT = 1)

/obj/item/encryptionkey/headset_vault_security
	name = "\proper the Security encryption key"
	desc = "An encryption key for a radio headset.  Channels are as follows: :b - vault, :s - security"
	icon_state = "sec_cypherkey"
	channels = list(RADIO_CHANNEL_VAULT = 1, RADIO_CHANNEL_SECURITY = 1)

/obj/item/encryptionkey/headset_overseer
	name = "\proper the Overseer's encryption key"
	desc = "An encryption key for a radio headset.  Channels are as follows: :b - vault, :c - command, :s - security, :e - engineering, :m - medical, :n - science."
	icon_state = "cap_cypherkey"
	channels = list(RADIO_CHANNEL_VAULT = 1, RADIO_CHANNEL_COMMAND = 1, RADIO_CHANNEL_SECURITY = 1)

/obj/item/encryptionkey/headset_vault_hos
	name = "\proper the Head of Security's encryption key"
	desc = "An encryption key for a radio headset.  Channels are as follows: :b - vault, :c - command, :s - security"
	icon_state = "hos_cypherkey"
	channels = list(RADIO_CHANNEL_VAULT = 1, RADIO_CHANNEL_COMMAND = 1, RADIO_CHANNEL_SECURITY = 1)

/obj/item/encryptionkey/headset_ncr
	name = "NCR radio encryption key"
	desc = "An encryption key for a radio headset.  To access the NCR channel, use :w."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_NCR = 1)

/obj/item/encryptionkey/headset_ranger
	name = "Ranger radio encryption key"
	desc = "An encryption key for a radio headset. To access the NCR channel, use :w. To access the Ranger channel, use :r."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_NCR = 1, RADIO_CHANNEL_RANGER = 1)

/obj/item/encryptionkey/headset_bos
	name = "Brotherhood radio encryption key"
	desc = "An encryption key for a radio headset.  To access the Brotherhood channel, use :q."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_BOS = 1)

/obj/item/encryptionkey/headset_khan
	name = "Khan radio encryption key"
	desc = "An encryption key for a radio headset.  To access the Khan channel, use :j."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_KHAN = 1)

/obj/item/encryptionkey/headset_town
	name = "Town radio encryption key"
	desc = "An encryption key for a radio headset.  To access the Town channel, use :f."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_TOWN = 1)

/obj/item/encryptionkey/headset_den
	name = "Den radio encryption key"
	desc = "An encryption key for a radio headset. To access the Den channel, use :j."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_DEN = 1)

/obj/item/encryptionkey/headset_legion
	name = "Legion radio encryption key"
	desc = "An encryption key for a radio headset.  To access the Legion channel, use :l."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_LEGION = 1)

/obj/item/encryptionkey/headset_cent
	name = "\improper CentCom radio encryption key"
	desc = "An encryption key for a radio headset.  To access the CentCom channel, use :y."
	icon_state = "cent_cypherkey"
	independent = TRUE
	channels = list(RADIO_CHANNEL_CENTCOM = 1)

/obj/item/encryptionkey/ai //ported from NT, this goes 'inside' the AI.
	channels = list(RADIO_CHANNEL_COMMAND = 1, RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_ENGINEERING = 1, RADIO_CHANNEL_SCIENCE = 1, RADIO_CHANNEL_MEDICAL = 1, RADIO_CHANNEL_SUPPLY = 1, RADIO_CHANNEL_SERVICE = 1, RADIO_CHANNEL_AI_PRIVATE = 1)

/obj/item/encryptionkey/secbot
	channels = list(RADIO_CHANNEL_AI_PRIVATE = 1, RADIO_CHANNEL_SECURITY = 1)
