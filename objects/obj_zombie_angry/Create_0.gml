
// ----------------- //
function initialize() {
	
	// debug
	debug = false;
	
	// movement
	max_speed = 32;
	acceleration = 16;
	resistance = 0.975;
	
	// ai
	think_interval = 0.25;
	think_ticks = 0;
	target_friendly_zombie = noone;
	x_offset = 14;
	side = 1;
	
	// sprites
	just_spawned = true;
	is_stealing = false;
	cycle_length = 4;
	
	get_target();

}

function get_target() {
	
	if (is_stealing) { return; }
	
	target_x = random_range(0, room_width);
	target_y = random_range(0, room_height);
	
	if (instance_exists(obj_zombie_friendly)) {
		target_friendly_zombie = instance_nearest(x, y, obj_zombie_friendly);
		side = sign(x - target_friendly_zombie.y);
		target_x = target_friendly_zombie.x - x_offset * side;
		target_y = target_friendly_zombie.y;
	}
}

// ----------------- //
initialize();