
// ----------------- //
function initialize() {
	
	// debug
	debug = true;
	
	// stats
	is_active = false;
	offset = 10;
	dir_x = 0;
	dir_y = 0;
	
	// firing
	// fire_amount = 3;
	bullet = obj_bullet;
	fire_rate = 0.5;
	fire_ticks = 0;
	
	// muzzle
	muzzle_length = 0;
	muzzle_offset_x = 0;
	muzzle_offset_y = 0;
	
	// ammo
	max_ammo = infinity;
	ammo = max_ammo;
	
	if (debug) {
		show_debug_message("Initialized a gun");
	}
	
}

// ----------------- //
initialize();