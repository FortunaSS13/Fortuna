//In this document: Pistol calibre cartridges values for damage and penetration.

//////////////////////
// AMMUNITION TYPES //
//////////////////////
/*
FMJ (full metal jacket)		=	Baseline
AP (armor piercing)			=	-20% damage. AP increased by 0.2. Wound bonus -50%
JHP (jacketed hollow point)	=	+15% damage. AP reduced by 0.2 (not below zero). Wound bonus + 50%
SWC (semi wadcutter)		=	AP reduced by 0.1. Wound bonus +50%
P+ (overpressure)			=	extra speed 500. AP +25%
Match						=	extra speed 200. AP +10%. Wound bonus -10%
Civilian round				=	-10% damage. AP reduced by 50% 
*/

// Explanation: Two major ammo stats, AP and Damage. Bullets placed in classes. Light rounds for example balanced with each other, one more AP, one more Damage.
// Balance between classes mostly done on the gun end, bigger rounds typically fire slower and have more recoil. They are not supposed to be totally equal either.

////////////////////
// .22 LONG RIFLE //
////////////////////		-very light round

/obj/item/projectile/bullet/c22
	name = ".22lr bullet"
	damage = 20
	armour_penetration = 0.06
	wound_bonus = 6

/obj/item/projectile/bullet/c22/rubber
	name = ".22lr rubber bullet"
	damage = 2
	armour_penetration = 0
	stamina = 15
	wound_bonus = 0
	sharpness = SHARP_NONE

/////////////////
// .38 SPECIAL //
/////////////////		-Light round, slight damage focus

/obj/item/projectile/bullet/c38
	name = ".38 bullet"
	damage = 30
	armour_penetration = 0
	wound_bonus = 10

/obj/item/projectile/bullet/c38/rubber
	name = ".38 rubber bullet"
	damage = 5
	armour_penetration = 25
	wound_bonus = 0
	sharpness = SHARP_NONE


//////////
// 9 MM //
//////////				-Light round, allround

/obj/item/projectile/bullet/c9mm
	name = "9mm FMJ bullet"
	damage = 27
	armour_penetration = 0.05
	wound_bonus = 15

/obj/item/projectile/bullet/c9mm/op
	name = "9mm +P bullet"
	damage = 27
	armour_penetration = 0.07
	var/extra_speed = 500

/obj/item/projectile/bullet/c9mm/rubber
	name = "9mm rubber bullet"
	damage = 4
	stamina = 23
	armour_penetration = 0
	wound_bonus = 0
	sharpness = SHARP_NONE

/obj/item/projectile/bullet/c9mm/wounding
	name = "9mm wounding bullet"
	damage = 24
	armour_penetration = 0
	ricochets_max = 0
	sharpness = SHARP_EDGED
	wound_bonus = 35
	bare_wound_bonus = 35
	wound_falloff_tile = -8

/obj/item/projectile/bullet/c9mm/simple //for simple mobs, separate to allow balancing
	name = "9mm bullet"


///////////
// 10 MM //
///////////				-Medium round, AP focus

/obj/item/projectile/bullet/c10mm
	name = "10mm FMJ bullet"
	damage = 29
	armour_penetration = 0.12
	wound_bonus = 18

/obj/item/projectile/bullet/c10mm/rubber
	name = "10mm rubber bullet"
	damage = 8
	armour_penetration = 0
	stamina = 26
	wound_bonus = 0
	sharpness = SHARP_NONE

/obj/item/projectile/bullet/c10mm/wounding
	name = "10mm wounding bullet"
	damage = 24
	armour_penetration = 0
	ricochets_max = 0
	sharpness = SHARP_EDGED
	wound_bonus = 40
	bare_wound_bonus = 40
	wound_falloff_tile = -8

/obj/item/projectile/bullet/c10mm/incendiary
	name = "10mm incendiary bullet"
	damage = 13
	var/fire_stacks = 1

/obj/item/projectile/bullet/c10mm/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()


/////////////
// .45 ACP //
/////////////			-Medium round, damage focus

/obj/item/projectile/bullet/c45
	name = ".45 FMJ bullet"
	damage = 32
	armour_penetration = 0.1
	wound_bonus = 20


/obj/item/projectile/bullet/c45/op
	name = ".45 +P bullet"
	damage = 32
	armour_penetration = 0.12
	var/extra_speed = 500

/obj/item/projectile/bullet/c45/rubber
	name = ".45 rubber bullet"
	damage = 10
	stamina = 45
	armour_penetration = 0
	sharpness = SHARP_NONE
	wound_bonus = 0

/obj/item/projectile/bullet/c45/incendiary
	name = ".45 incendiary bullet"
	damage = 15
	var/fire_stacks = 1
	
/obj/item/projectile/bullet/c45/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()

/////////////////
// .357 MAGNUM //
/////////////////		-High power round

/obj/item/projectile/bullet/a357
	name = ".357 FMJ bullet"
	damage = 36
	armour_penetration = 0.15
	wound_bonus = 14
	bare_wound_bonus = -14

// 3 ricochets, more than enough to kill anything that moves
/obj/projectile/bullet/a357/ricochet
	name = ".357 ricochet bullet"
	damage = 30
	armour_penetration = 0.15
	ricochets_max = 3
	ricochet_chance = 140
	ricochet_auto_aim_angle = 50
	ricochet_auto_aim_range = 6
	ricochet_incidence_leeway = 80

////////////////
// .44 MAGNUM //
////////////////		- High power round

/obj/item/projectile/bullet/m44
	name = ".44 FMJ bullet"
	damage = 38
	armour_penetration = 0.2
	wound_bonus = 20
	bare_wound_bonus = -20


/obj/item/projectile/bullet/m44/simple //for simple mobs, separate to allow balancing
	name = ".44 bullet"


////////////
// .45-70 //
////////////			-Heavy round, AP focus

/obj/item/projectile/bullet/c4570
	name = ".45-70 FMJ bullet"
	damage = 41
	armour_penetration = 0.25
	wound_bonus = 24
	bare_wound_bonus = -24

/obj/item/projectile/bullet/c4570/explosive
	damage = 10
	armour_penetration = 1
	pixels_per_second = TILES_TO_PIXELS(500)
	name = ".45-70 explosive bullet"

/obj/item/projectile/bullet/c4570/explosive/on_hit(atom/target, blocked = FALSE)
	..()
	explosion(target, 0, 0, 1, 1, flame_range = 1)


///////////
// 14 MM //
///////////				-Heavy round, damage focus

/obj/item/projectile/bullet/mm14
	name = "14mm FMJ bullet"
	damage = 43
	armour_penetration = 0.2
	wound_bonus = 28
	bare_wound_bonus = -28



//////////////////////
//SPECIAL AMMO TYPES//
//////////////////////

//45 Long Colt. Bouncy ammo but less damage then the Sequoia. It's in one of the Vet Ranger kits
/obj/item/projectile/bullet/a45lc
	name = ".45 LC bullet"
	damage = 40 //Right inbetween 44 and 45-70. Gun this is used in has a fire delay of 8, doing the math I'm pretty sure a regular M29 has a higher DPS then dual wielding these unless you bounce shots
	armour_penetration = 0.25 //Again, right inbetween 44 and 45-70.
	wound_bonus = 20
	bare_wound_bonus = -20
	ricochets_max = 3
	ricochet_incidence_leeway = 130
	ricochet_decay_damage = 1.1 //48 damage on first bounce, 53 on second, 58 on third. Unless you bounce, the DPS dual wielding is lower then a single M29
	ricochet_decay_chance = 11
	ricochet_chance = 80 //100% if you have the vet's trait
	ricochet_auto_aim_range = 4


/////////////
// NEEDLER //
/////////////			- AP focus

/obj/item/projectile/bullet/needle
	name = "needle"
	icon_state = "cbbolt"
	damage = 32
	armour_penetration = 0.8
	var/piercing = FALSE





////////////////
//CODE ARCHIVE//
////////////////

/*
SYNDIE AMMO
/obj/item/projectile/bullet/p50
	name =".50 bullet"
	pixels_per_second = TILES_TO_PIXELS(25)
	damage = 70
	knockdown = 100
	dismemberment = 50
	armour_penetration = 0.85
	zone_accuracy_factor = 100		//guarunteed 100%
	var/breakthings = TRUE

/obj/item/projectile/bullet/p50/on_hit(atom/target, blocked = 0)
	if(isobj(target) && (blocked != 100) && breakthings)
		var/obj/O = target
		O.take_damage(80, BRUTE, "bullet", FALSE)
	return ..()

/obj/item/projectile/bullet/p50/soporific
	name =".50 soporific bullet"
	armour_penetration = 0
	damage = 0
	dismemberment = 0
	knockdown = 0
	breakthings = FALSE

/obj/item/projectile/bullet/p50/soporific/on_hit(atom/target, blocked = FALSE)
	if((blocked != 100) && isliving(target))
		var/mob/living/L = target
		L.Sleeping(400)
	return ..()

/obj/item/projectile/bullet/p50/penetrator
	name =".50 penetrator bullet"
	icon_state = "gauss"
	name = "penetrator round"
	damage = 60
	movement_type = FLYING | UNSTOPPABLE
	dismemberment = 0 //It goes through you cleanly.
	knockdown = 0
	breakthings = FALSE

/obj/item/projectile/bullet/p50/penetrator/shuttle //Nukeop Shuttle Variety
	icon_state = "gaussstrong"
	damage = 25
	pixels_per_second = TILES_TO_PIXELS(33.33)
	range = 16

NEEDLE INJECTION CODE
/obj/item/projectile/bullet/needle/Initialize()
	. = ..()
	create_reagents(50, NO_REACT, NO_REAGENTS_VALUE)

/obj/item/projectile/bullet/needle/on_hit(atom/target, blocked = FALSE, skip = FALSE)
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		if(blocked != 100) // not completely blocked
			if(M.can_inject(null, FALSE, def_zone, piercing)) // Pass the hit zone to see if it can inject by whether it hit the head or the body.
				..()
				if(skip == TRUE)
					return BULLET_ACT_HIT
				reagents.reaction(M, INJECT)
				reagents.trans_to(M, reagents.total_volume)
				return TRUE
			else
				blocked = 100
				target.visible_message("<span class='danger'>\The [src] was deflected!</span>", \
									   "<span class='userdanger'>You were protected against \the [src]!</span>")

	..(target, blocked)
	DISABLE_BITFIELD(reagents.reagents_holder_flags, NO_REACT)
	reagents.handle_reactions()
	return BULLET_ACT_HIT

BOUNCING BULLET CODE
	ricochets_max = 2
	ricochet_chance = 50
	ricochet_auto_aim_angle = 10
	ricochet_auto_aim_range = 3
	wound_bonus = -20
	bare_wound_bonus = 10
	embedding = list(embed_chance=15, fall_chance=2, jostle_chance=2, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=3, jostle_pain_mult=5, rip_time=10)


SOPORIFIC ROUND CODE
/obj/item/projectile/bullet/p50/soporific/on_hit(atom/target, blocked = FALSE)
	if((blocked != 100) && isliving(target))
		var/mob/living/L = target
		L.Sleeping(400)
	return ..()
*/

// BETA STUFF // Obsolete
/obj/item/projectile/bullet/test
	name = "testing bullet"
	damage = 0
