
// ----------------- //
function initialize() {
	
	// debug
	debug = false;
	
	// falling
	is_falling = false;
	fall_length = room_height + 100;
	fall_distance = 0;
	if (is_falling) {	
		y -= fall_length;
	}
	fall_speed = 128;
	
	// targetting
	is_targetable = true;
	
	// movement
	is_knockbacked = false;
	knockback_ticks = 0;
	knockback_duration = 0.25;

}

// ----------------- //
initialize();