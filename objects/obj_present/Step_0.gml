
// ----------------- //
function movement(dt) {
	
	if (is_knockbacked) {
		knockback_ticks += dt;
		if (knockback_ticks > knockback_duration) {
			knockback_ticks = 0;
			is_knockbacked = false;
		}
		vspeed *= 0.75;
		hspeed *= 0.75;
	}
	else {
		hspeed = 0;
		vspeed = 0;
	}
	
	depth = -y;
	
}

function fall(dt) {
	
	var _dt = dt;
	if (fall_distance > fall_length * 0.9) {
		_dt *= 0.5;
	}
		
	var delta_fall = fall_speed * _dt;
	fall_distance += delta_fall;
	y = y + delta_fall;
	
	if (fall_distance >= fall_length) {
		is_targetable = true;
		is_falling = false;
	}
	
	depth = -room_height;
	
}

function check_for_base() {
	
	is_targetable = true;
	if (instance_exists(obj_base)) {
		var base = instance_nearest(x, y, obj_base);
		var diff_x = base.x - x;
		var diff_y = base.y - y;
		var dist = diff_x * diff_x + diff_y * diff_y;
		// technically this should check through all bases - but this should work well enough
		// this is because if a base might be further but have a larger pick up radius and so
		// the present would be under its umbrella but not know because it only checks for the
		// closer base.
		if (dist < base.present_pickup_radius * base.present_pickup_radius) {
			is_targetable = false;
		}
	}
	
}

// ----------------- //
function main() {
	var dt = delta_time / 1000000;
	if (is_falling) {
		is_targetable = false;
		fall(dt);
	}
	else {
		movement(dt);
		check_for_base();
	}
}

main();