
//---------------------//
function get_state() {
	
	if (just_spawned) {
		sprite_index = spr_grinch_angry_spawn;
		cycle_length = 10;
	}
	else if (is_stealing) {
		sprite_index = spr_grinch_angry_steal;
		cycle_length = 11;
	}
	else {
		sprite_index = spr_grinch_angry;
		cycle_length = 4;
	}
	
}

function get_direction() {
	
	// down
	var offset = 3;
	
	if (abs(hspeed) > abs(vspeed)) {
		if (hspeed < 0) {
			// left
			offset = 2;
		}
		else {
			// right
			offset = 0;
		}
	}
	else { // yes ugly but more readable
		if (vspeed < 0) {
			// up
			// offset = 1;
		}
	}
	
	if (sprite_index == spr_grinch_angry_spawn) {
		offset = 0;
	}
	if (sprite_index == spr_grinch_angry_steal) {
		image_xscale = side;
		offset = 0;
	}
	
	if (image_index < cycle_length * offset) {
		image_index = cycle_length * offset;
	}
	else if (image_index >= cycle_length * (offset + 1)) {
		if (just_spawned) {
			just_spawned = false;
		}
		else if (is_stealing) {
			// wtf
			is_stealing = false
			instance_create_depth(target_x + side * x_offset, target_y, -target_y, obj_zombie);
			instance_create_depth(x, y, -y, obj_zombie);
			instance_destroy();
		}
		else {
			image_index = cycle_length * offset;
		}
			
	}
	
}

//---------------------//
function main() {
	get_state();
	get_direction();
	draw_self();
}

main();
