
// ----------------- //
function spawn(dt) {
	
	if (num_spawn_objects < max_spawn_objects) {
		spawn_ticks += dt
	}
	if (spawn_ticks > spawn_interval && num_spawn_objects < max_spawn_objects) {
		
		var offset_x = random_range(-1, 1);
		var offset_y = random_range(-1, 1);
		offset_x *= ((max_spawn_radius - min_spawn_radius) / power(2, 0.5));
		offset_y *= ((max_spawn_radius - min_spawn_radius) / power(2, 0.5));
		var norm = power((offset_x * offset_x + offset_y * offset_y), 0.5);
		
		var min_x = min_spawn_radius * offset_x / norm;
		var min_y = min_spawn_radius * offset_y / norm;
		offset_x += min_x;
		offset_y += min_y;
		
		var new_spawn_object = instance_create_depth(x + offset_x, y + offset_y, -y, spawn_object);
		spawn_objects[array_length(spawn_objects)] = new_spawn_object;
		spawn_ticks = 0;
		// spawn_interval = 600;
	}

}

// ----------------- //
function main() {
	var dt = delta_time / 1000000;
	objects();
	spawn(dt);
}

main();