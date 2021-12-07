
// ----------------- //
function fire(dt) {

	if (mouse_check_button(mb_left) && fire_ticks == 0 && ammo > 0) {
	
		instance_create_depth(x + muzzle_offset_x, y + muzzle_offset_x, -y, bullet);
		ammo -= 1;
		obj_cam_controller.shake = true;
		
		fire_ticks = fire_rate;
		if (debug) {
			show_debug_message("Fired a bullet from this gun!");
		}
	}
	
}


function cooldown(dt) {
	
	if (fire_ticks > 0) {
		fire_ticks -= dt;
	}
	else {
		fire_ticks = 0;
	}

}

function attach() {
	
	if (is_active) {
		x = obj_player.x;
		y = obj_player.y;
	}
	
	var mouse_x_xview = mouse_x - view_xview[0];
	var mouse_y_yview = mouse_y - view_yview[0];
	
	dir_x = mouse_x_xview - obj_player.x;
	dir_y = mouse_y_yview - obj_player.y;
	var norm_squared = dir_x * dir_x + dir_y * dir_y;
	var norm = power(norm_squared, 0.5);
	
	x += offset * dir_x / norm;
	y += offset * dir_y / norm;
	
	muzzle_offset_x = 0; // muzzle_length * dir_x / norm;
	muzzle_offset_y = 0; // muzzle_length * dir_y / norm;
	
}


// ----------------- //
function main() {
	var dt = delta_time / 1000000;
	cooldown(dt);
	fire(dt);
	attach();
}

if (is_active) {	
	main();
}