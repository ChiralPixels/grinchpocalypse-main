
//---------------------//
function ai(dt) {
	
	// if (!has_present) {
	think_ticks += dt;
	if (think_ticks > think_interval) {
		get_target(dt);
		think_ticks = 0;
	}
	
	// }
	// else {

	//	}
	//}
	
	if ( has_present){
		if ((x < 0 || x > room_width) && y < 0 || y > room_height) {
			// take a point off the player.
			obj_player.hp -= 1;
			instance_destroy();
		}
	}
	
	if (target_zombie != noone) {
		
		if (y == clamp(y, target_y - 1, target_y + 1) && x == clamp(x, target_x - 1, target_x + 1)) {
			if (!is_fighting_for_present) {
				instance_destroy(target_zombie)
				is_fighting_for_present = true;
				image_index = 0;
			}
		}
		
	}
	
	//if (target_present != noone) {
		
	//	if (y == clamp(y, target_y - 1, target_y + 1) && x == clamp(x, target_x - 1, target_x + 1)) {
	//		if (!has_present && !is_knockbacked && target_present.is_targetable) {
	//			has_present = true;
	//			grabbing_present = true;
	//			image_index = 0;
	//			instance_destroy(target_present);
	//		}
	//	}
		
	//}
	
	if (is_knockbacked && is_fighting_for_present) {
		is_fighting_for_present = false
		has_present = false
		instance_create_depth(x, y, -y, obj_present);
		var new_zombie = instance_create_depth(x, y, -y, obj_zombie);
		if (abs(hspeed) > abs(vspeed)) {
			new_zombie.hspeed = -vspeed;
			new_zombie.vspeed = -hspeed;
		}
		else {
			new_zombie.hspeed = -vspeed;
			new_zombie.vspeed = hspeed;
		}
		var temp = hspeed;
		hspeed = vspeed;
		vspeed = temp;
		new_zombie.is_knockbacked = true;
	}
	
	if (is_knockbacked && grabbing_present) {
		grabbing_present = false;
	}
	
	if (is_fighting_for_present) {
		fighting_ticks += dt;
		if (fighting_ticks > max_fight_duration) {
			instance_destroy();
			obj_player.hp -= 1;
		}
	}
	else {
		fighting_ticks = 0;
	}
	
}

function movement(dt) {
	
	if (is_knockbacked) {
		knockback_ticks += dt;
		if (knockback_ticks > knockback_duration) {
			is_knockbacked = false;
			// is_getting_up = true;
			knockback_ticks = 0;
		}
		
		// resistance
		vspeed *= knockback_resistance;
		hspeed *= knockback_resistance;
		
		move_bounce_solid(true);
	
	}
	else if (is_getting_up) {
		vspeed = 0;
		hspeed = 0;
	}
	else if (grabbing_present) {
		vspeed = 0;
		hspeed = 0;
	}
	else if (is_fighting_for_present) {
		
		hspeed += sign(target_x - x) * acceleration * dt
		vspeed += sign(target_y - y) * acceleration * dt
	
		// resistance
		vspeed *= resistance;
	    hspeed *= resistance;
		
		// max speed
		var slow_factor = has_present ? present_slow : 1;
		speed = clamp(speed, -slow_factor * max_speed * dt, slow_factor * max_speed * dt);
		
	}
	
	// depth 
	depth = -y;
	
	if (debug) {
		show_debug_message("Speed: " + string(speed / dt));
	}
	
}

function state() {
	
	if (anger <= friendly_threshold && !is_knockbacked) {
		// die
		instance_create_depth(x, y, -y, obj_zombie_friendly)
		instance_destroy();
	}
	if (anger >= angry_threshold) {
		instance_create_depth(x, y, -y, obj_zombie_angry)
		instance_destroy();
	}
	
}

//---------------------//
function main() {
	var dt = delta_time / 1000000;
	ai(dt);
	movement(dt);
	state();
}

main();