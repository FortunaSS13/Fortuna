SUBSYSTEM_DEF(callbacks)
	name = "Auxtools Callbacks"
	flags = SS_TICKER | SS_NO_INIT
	wait = 1
	priority = FIRE_PRIORITY_CALLBACKS

/proc/process_atmos_callbacks()
	SScallbacks.can_fire = 0
	SScallbacks.flags |= SS_NO_FIRE
	CRASH("Auxtools not found! Callback subsystem shutting itself off.")

/datum/controller/subsystem/callbacks/fire()
<<<<<<< HEAD
	if(process_atmos_callbacks(MC_TICK_REMAINING_MS))
=======
	if(process_atmos_callbacks(TICK_REMAINING_MS))
>>>>>>> 5204f5a6d9 (Merge pull request #13991 from Putnam3145/auxtools-atmos)
		pause()
