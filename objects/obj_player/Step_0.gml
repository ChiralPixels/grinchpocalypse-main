
//---------------------//
function movement(dt) {
	
	// input
	if (keyboard_check(vk_up) || keyboard_check(ord("W"))) {
        vspeed -= acceleration * dt;
    }
    else if (keyboard_check(vk_down) || keyboard_check(ord("S"))) {
        vspeed += acceleration  * dt;
    }

    if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
        hspeed += acceleration  * dt;
    }
    else if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
        hspeed -= acceleration  * dt;
    }
	
	// resistance
	vspeed *= resistance;
    hspeed *= resistance;
	
	// max speed
	var slow_factor = has_present ? present_slow : 1;
	speed = clamp(speed, -slow_factor * max_speed * dt, slow_factor * max_speed * dt);
	
	// area bounds
    x = clamp(x, 0, room_width);
    y = clamp(y, 0, room_height);
	
	// depth 
	depth = -y;
	
	if (debug) {
		show_debug_message("Speed: " + string(speed / dt));
	}
	
}

function check_present() {
	
	if (keyboard_check_pressed(vk_space)) {
		if (has_present) {
			drop_present();
		}
		else if (instance_exists(obj_present)) {
			pick_up_present();
		}
	}
	
}

function drop_present() {
	// drop present
	instance_create_depth(x, y + 10, -(y+10), obj_present);
	has_present = false;
}

function pick_up_present() {
	var present = instance_nearest(x, y, obj_present);
	var diff_x = present.x - x;
	var diff_y = present.y - y;
	var dist = diff_x * diff_x + diff_y * diff_y;
	if (dist < present_pickup_distance * present_pickup_distance) {
		// pick up the present
		instance_destroy(present);
		has_present = true;
	}
}

function switch_weapon() {
	
	if (has_present) {
		primary_weapon.is_active = false;
	}
	else {
		primary_weapon.is_active = true;
	}
	
	var new_weapon = noone;
	if (keyboard_check_pressed(ord("1"))) {
		new_weapon = obj_gun_snowpistol;
	}
	else if (keyboard_check_pressed(ord("2"))) {
		new_weapon = obj_gun_ornament;
	}
	else if (keyboard_check_pressed(ord("3"))) {
		new_weapon = obj_gun_snowman;
	}	
	
	if (new_weapon != noone) {
		primary_weapon.is_active = false;
		if (instance_exists(new_weapon) && new_weapon.object_index == new_weapon) {
			primary_weapon = new_weapon;
			primary_weapon.is_active = true;
		}
		else {
			primary_weapon = instance_create_depth(x, y, -y, new_weapon);
			primary_weapon.is_active = true;
		}
		
		if (has_present) {
			drop_present();
		}
	}
	
}

//---------------------//
function main() {
	var dt = delta_time / 1000000;
	movement(dt);
	check_present();
	switch_weapon();
	
}

main();