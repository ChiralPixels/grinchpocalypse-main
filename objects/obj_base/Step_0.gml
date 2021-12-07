
// ----------------- //
function check_for_presents() {
	
	num_presents = 0;
	for (i = 0; i < instance_number(obj_present); i += 1) {
		var present = instance_find(obj_present, i);
		var diff_x = present.x - x;
		var diff_y = present.y - y;
		var dist = diff_x * diff_x + diff_y * diff_y;
		if (dist < present_pickup_radius * present_pickup_radius) {
			// pick up the present
			// instance_destroy(present);
			num_presents += 1;
		}
	}

}

// ----------------- //
function main() {
	check_for_presents();
	depth = -y;
}

main();