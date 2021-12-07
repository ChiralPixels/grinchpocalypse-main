
// ----------------- //
function screen_shake(dt) {
	shake_ticks += dt
	if (shake_ticks > shake_duration) {
		shake = false;
		shake_ticks = 0;
	}
	var shake_x = random_range(-shake_magnitude * scale_x, shake_magnitude * scale_x);
	var shake_y = random_range(-shake_magnitude * scale_y, shake_magnitude * scale_y);
	camera_set_view_pos(view_camera[0], view_x + shake_x, view_y + shake_y);
}

// ----------------- //
function main() {
	var dt = delta_time / 1000000;
	camera_set_view_pos(view_camera[0], 0, 0);
	if (shake) {
		screen_shake(dt);
	}
}

main();



