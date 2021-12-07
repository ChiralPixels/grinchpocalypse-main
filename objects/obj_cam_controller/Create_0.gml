
// ----------------- //
function initialize() {
	
	scale_x = 1;
	scale_y = 0.5;
	
	view_x = camera_get_view_x(view_camera[0]);
	view_y = camera_get_view_y(view_camera[0]);
	
	shake = false;
	shake_ticks = 0;
	shake_duration = 0.1;
	shake_magnitude = 2;
}

// ----------------- //
initialize();