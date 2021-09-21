/datum/keybinding/client/communication
	category = CATEGORY_COMMUNICATION

/datum/keybinding/client/communication/say
	hotkey_keys = list("CtrlT")
	classic_keys = list("Unbound")
	name = "Say"
	full_name = "IC Say"
	clientside = "say"

/datum/keybinding/client/communication/ooc
	hotkey_keys = list("O")
	name = "OOC"
	full_name = "Out Of Character Say (OOC)"
	clientside = "ooc"

/datum/keybinding/client/communication/me
	hotkey_keys = list("CtrlM")
	classic_keys = list("Unbound")
	name = "Me"
	full_name = "Me (emote)"
	clientside = "me"

/datum/keybinding/client/communication/halt
	hotkey_keys = list("ShiftR")
	classic_keys = list("Unbound")
	name = "Halt"
	full_name = "Halt Command"
	clientside = "Halt"

//indicators
/datum/keybinding/client/communication/say_with_indicator
	hotkey_keys = list("T")
	name = "say_with_indicator"
	full_name = "Say with Typing Indicator"

/datum/keybinding/client/communication/say_with_indicator/down(client/user)
	var/mob/M = user.mob
	M.say_typing_indicator()
	return TRUE

/datum/keybinding/client/communication/me_with_indicator
	hotkey_keys = list("M")
	name = "me_with_indicator"
	full_name = "Me (emote) with Typing Indicator"

/datum/keybinding/client/communication/me_with_indicator/down(client/user)
	var/mob/M = user.mob
	M.me_typing_indicator()
	return TRUE

/datum/keybinding/client/communication/subtle
	hotkey_keys = list("5")
	name = "Subtle"
	full_name = "Subtle Emote"
	clientside = "subtle"

/datum/keybinding/client/communication/subtler
	hotkey_keys = list("6")
	name = "Subtler"
	full_name = "Subtler Anti-Ghost Emote"
	clientside = "subtler-anti-ghost"

/datum/keybinding/client/communication/whisper
	hotkey_keys = list("Y")
	name = "Whisper"
	full_name = "Whisper"
	clientside = "whisper"

/datum/keybinding/client/communication/looc
	hotkey_keys = list("L")
	name = "LOOC"
	full_name = "Local Out of Character chat"
	clientside = "looc"

/datum/keybinding/client/communication/toggle_indicator
	hotkey_keys = list("N")
	name = "toggle_indicator"
	full_name = "Toggle Typing Indicator"
	description = ""

/datum/keybinding/client/communication/toggle_indicator/down(client/user)
	var/mob/M = user.mob
	M.toggle_typing_indicator()
	return TRUE

