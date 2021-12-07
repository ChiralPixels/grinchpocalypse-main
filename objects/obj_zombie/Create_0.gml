
// ----------------- //
function initialize() {
	
	// debug
	debug = false;
	
	path=noone;
	
	// movement
	max_speed = 20;
	acceleration = 5;
	resistance = 0.975;
	
	// knockback
	is_knockbacked = false;
	knockback_ticks = 0;
	knockback_duration = 0.35;
	knockback_resistance = 0.85;
	
	// getting up
	is_getting_up = false;
	is_fighting_for_present = false;
	fighting_ticks = 0;
	max_fight_duration = 7;
	
	// ai
	think_interval = 0.25;
	think_ticks = 0;
	grabbing_present = false;
	has_present = false;
	y_offset = 6; // always due to pivot
	x_offset = 14; // for animations
	side = 1;
	target_zombie = noone;
	// target_present = noone;
	get_target();
	
	// stats
	anger = 0;
	friendly_threshold = -5;
	angry_threshold = 5;
	present_slow = 0.5;
	
	// sprites
	cycle_length = 4;

}

function get_target(dt = 0) {
	
	if (is_fighting_for_present || is_knockbacked || is_getting_up) { 
		path_end();
		return; 
	}
	
	target_x = random_range(0, room_width);
	target_y = random_range(0, room_height);
	target_zombie = noone;
	target_present = noone;
	
	var distance = infinity;
	
	if (instance_exists(obj_present)) {
		var present = instance_nearest(x, y, obj_present);
		
		if (present.is_targetable) {
			target_x = present.x;
			target_y = present.y;
			distance = 	distance_to_point(present.x, present.y);
		}
		else {
			for (i = 0; i < instance_number(obj_present); i += 1) {
				present = instance_find(obj_present, i);
				if (present.is_targetable && distance_to_point(present.x, present.y) < distance) {
					target_x = present.x;
					target_y = present.y;
					distance = distance_to_point(present.x, present.y);
				}
			}
		}
		target_present = present;
	}
	
	if (distance_to_point(obj_player.x, obj_player.y) < distance) {
		if (obj_player.has_present) {
			target_x = obj_player.x;
			target_y = obj_player.y;
			distance = distance_to_point(obj_player.x, obj_player.y);
		}
	}
	
	for (i = 0; i < instance_number(obj_zombie); i += 1) {
		var zombie = instance_find(obj_zombie, i);
		if (zombie.has_present && distance_to_point(zombie.x, zombie.y) < distance) {
			target_x = zombie.x - x_offset * side;;
			target_y = zombie.y;
			target_zombie = zombie;
			distance = distance_to_point(zombie.x, zombie.y);
		}
	}
	
	target_y += 6;
	
	if (has_present) {			
		var center_x = room_width / 2;
		var center_y = room_height / 2;
		
		target_x = x + 100 * (x - center_x);
		target_y = y + 100 * (y - center_y);
	
	}
	
	var slow_factor = has_present ? present_slow : 1;
	
	if path != noone path_end()
	path = path_add();
	var _speed = slow_factor * max_speed * dt;
	mp_potential_path(path, target_x, target_y, 8, 2, false);
	path_start(path, _speed, path_action_continue, true);
	
}

// ----------------- //
initialize();