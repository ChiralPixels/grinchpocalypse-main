
//---------------------//
function get_state() {
	
	if (has_present) {
		sprite_index = spr_player_with_present;
	}
	else {
		sprite_index = spr_player;
	}
	
}

function get_direction() {
	
	var offset = 0;
	
	if (abs(hspeed) > abs(vspeed)) {
		if (hspeed < 0) {
			// offset = 3;
			offset = 1;
		}
		else {
			offset = 1;
		}
	}
	else { // yes ugly but more readable
		if (abs(vspeed) < 0) {
			//offset = 2;
			offset = 0;
		}
	}
	
	if (image_index < cycle_length * offset) {
		image_index = cycle_length * offset;
	}
	else if (image_index >= cycle_length * (offset + 1)) {
		image_index = cycle_length * offset;
	}
	
	var threshold = 0.01;
	if (abs(hspeed) + abs(vspeed) < threshold) {
		image_index = cycle_length * offset;
	}
	
}

//---------------------//
function main() {
	get_state();
	get_direction();
	draw_self();
}

main();
