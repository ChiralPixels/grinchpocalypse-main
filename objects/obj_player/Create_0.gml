
// ----------------- //
function initialize() {
	
	// debug
	debug = false;
	
	// movement
	max_speed = 48;
	acceleration = 16;
	resistance = 0.75;
	
	// stats
	hp = 3;
	
	// weapons
	primary_weapon = instance_create_depth(x, y, -y, obj_gun_snowpistol);
	primary_weapon.is_active = true;
	
	// presents
	has_present = false;
	present_pickup_distance = 30;
	is_targetable = true;
	present_slow = 0.75;
	
	// sprites 
	cycle_length = 8

}

// ----------------- //
initialize();