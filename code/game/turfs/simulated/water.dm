/turf/open/water
	gender = PLURAL
	name = "water"
	desc = "Shallow water."
	icon = 'icons/turf/floors.dmi'
	icon_state = "riverwater_motion"
	baseturfs = /turf/open/indestructible/ground/inside/mountain
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	slowdown = 2
	bullet_sizzle = TRUE
	bullet_bounce_sound = null //needs a splashing sound one day.

	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER


	var/depth = 1 // Higher numbers indicates deeper water.

// Largely ported from citadels HRP branch

/turf/open/water/Initialize()
	. = ..()
	update_icon()


/turf/open/water/Entered(atom/movable/AM, atom/oldloc)
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		L.update_water()
		if(L.check_submerged() <= 0)
			return
		if(!istype(oldloc, /turf/open/water))
			to_chat(L, "<span class='warning'>You get drenched in water from entering \the [src]!</span>")
	AM.water_act(5)
	..()

/turf/open/water/Exited(atom/movable/AM, atom/newloc)
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		L.update_water()
		if(L.check_submerged() <= 0)
			return
		if(!istype(newloc, /turf/open/water))
			to_chat(L, "<span class='warning'>You climb out of \the [src].</span>")
	..()

/mob/living/proc/check_submerged()
	if(buckled)
		return 0
	if(locate(/obj/structure/lattice/catwalk) in loc)
		return 0
	var/turf/open/water/T = loc
	if(istype(T))
		return T.depth
	return 0

// Use this to have things react to having water applied to them.
/atom/movable/proc/water_act(amount)
	return

/mob/living/water_act(amount)
	adjust_fire_stacks(-amount * 5)
	for(var/atom/movable/AM in contents)
		AM.water_act(amount)
