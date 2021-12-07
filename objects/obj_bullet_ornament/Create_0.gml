
// ----------------- //
function initialize() {
	
	// sprite
	bullet_index = random_range(0, 5);
	spin_magnitude = 5;
	
	// stats.
	bullet_speed = 192;
	
	// bullet_kickback = 5; // get this from the gun.
	damage = 1;
	knockback_speed = bullet_speed * 0.5;
	
	virtual_initialized = false;
}



// ----------------- //
initialize();
