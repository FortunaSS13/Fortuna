/obj/item/ammo_casing/caseless
	desc = "A caseless bullet casing."
	firing_effect_type = null
	heavy_metal = FALSE

/obj/item/ammo_casing/caseless/fire_casing(atom/target, mob/living/user, params, distro, quiet, zone_override, spread, atom/fired_from)
	if (..()) //successfully firing
		moveToNullspace()
		QDEL_NULL(src)
		return TRUE
	else
		return FALSE

/obj/item/ammo_casing/caseless/update_icon_state()
	icon_state = "[initial(icon_state)]"

/obj/item/ammo_casing/caseless/needle
	name = "A needler round."
	desc = "A dart for use in needler pistols."
	icon_state = "needler-casing"
	caliber = "needle"
	projectile_type = /obj/item/projectile/bullet/needle
	var/reagent_amount = 15

/obj/item/ammo_casing/caseless/musketball
	name = "Musketball"
	desc = "This is a lead ball for a musket."
	caliber = "musketball"
	projectile_type = /obj/item/projectile/bullet/F13/musketball

/obj/item/ammo_casing/caseless/lasermusket
	name = "Battery"
	desc = "A single use battery for the lasmusket."
	caliber = "lasmusket"
	icon_state = "lasmusketbat"
	projectile_type = /obj/item/projectile/beam/laser/musket
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/energy

/obj/item/ammo_casing/caseless/plasmacaster
	name = "Plasma can"
	desc = "A single use can of plasma for the plasma musket."
	caliber = "plasmacaster"
	icon_state = "plasmacan"
	projectile_type = /obj/item/projectile/f13plasma/plasmacaster
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/energy
